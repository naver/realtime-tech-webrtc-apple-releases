import os
import subprocess
import argparse
import shutil
import json
import re
import sys
from typing import List, Union
from enum import Enum

class Color(Enum):
    RED = '\033[91m'
    GREEN = '\033[92m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    BOLD = '\033[1m'
    END = '\033[0m'

def log(value: Union[str, List[str]]):
    assert isinstance(value, (str, list))
    print(Color.BOLD.value, end='')
    print(Color.PURPLE.value, end='')
    print('# ' if isinstance(value, str) else '>>> ', end='')
    print(Color.END.value, end='')
    print(Color.BOLD.value, end='')
    if isinstance(value, str):
        print(value, end='')
    else:
        value = [value[0]] + [f"'{v}'" for v in value[1:]]
        print(' '.join(value), end='')
    print(Color.END.value)

def run_process(command: List[str], print_log: bool = True):
    if print_log:
        log(command)
    subprocess.run(command, check=True)

def release(tag, build_directory, skip_build):
    original_directory = os.getcwd()

    #1: Build the xcframework
    if not skip_build:
        if check_webrtc_version_match(build_directory, tag):
            os.chdir(build_directory)
            log("Building WebRTC.xcframework...")
            run_process(['python3', 'build_apple.py', 'xcframework'])
            os.chdir(original_directory)
        else:
            sys.exit(1)

    #2: Compute checksum
    log("Computing checksum...")
    checksum_process = subprocess.run(['swift', 'package', 'compute-checksum', os.path.join(build_directory, 'WebRTC.xcframework.zip')], capture_output=True, text=True)
    if checksum_process.returncode != 0:
        raise Exception("Failed to compute checksum: " + checksum_process.stderr)
    checksum = checksum_process.stdout.strip()

    #3: Update Package.swift
    log("Updating Package.swift...")
    if update_package_swift('Package.swift', tag, checksum):
        log("Committing and pushing changes...")
        run_process(['git', 'commit', '-am', f"Update version to {tag}"])
        run_process(['git', 'push'])
    else:
        log("No update needed for Package.swift as the tag has not changed.")

    #4: Create GitHub release
    if not check_existing_release(tag):
      log("Creating GitHub release...")
      run_process(['gh', 'release', 'create', tag, '--title', tag, '--notes', f"Release version {tag}", os.path.join(build_directory, "WebRTC.xcframework.zip")])

    #5: Update PodSpec
    podspec_path = os.path.join(os.getcwd(), f'NaverWebRTC/{tag}/NaverWebRTC.podspec')
    os.makedirs(os.path.dirname(podspec_path), exist_ok=True)
    template_path = os.path.join(os.getcwd(), 'NaverWebRTC/1.0.2/NaverWebRTC.podspec')
    shutil.copy(template_path, podspec_path)
    update_podspec(podspec_path, tag)

    #6: Commit and push podspec changes
    log("Committing and pushing PodSpec...")
    run_process(['git', 'add', podspec_path])
    run_process(['git', 'commit', '-m', f"Update pod version to {tag}"])
    run_process(['git', 'push'])

def update_package_swift(file_path, new_tag, new_checksum):
    package_data = dump_package()
    updated = False

    for target in package_data['targets']:
        if target['type'] == 'binary':
            old_url = target['url']
            old_checksum = target['checksum']
            old_tag = re.search(r'/(\d+\.\d+\.\d+)/', old_url).group(1)

            if old_tag != new_tag:
                # Update URL and checksum
                new_url = f"https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/{new_tag}/WebRTC.xcframework.zip"
                content = open(file_path, 'r').read()
                content = re.sub(re.escape(old_url), new_url, content)
                content = re.sub(re.escape(old_checksum), new_checksum, content)
                open(file_path, 'w').write(content)
                updated = True
            break

    return updated


def dump_package():
    result = subprocess.run(['swift', 'package', 'dump-package'], capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception("Failed to dump package: " + result.stderr)
    return json.loads(result.stdout)

def update_podspec(file_path, tag):
    with open(file_path, 'r') as file:
        content = file.read()

    # spec.version 값을 업데이트
    content = re.sub(r'spec\.version\s+=\s+".+"', f'spec.version      = "{tag}"', content)
    
    # spec.source의 HTTP URL을 업데이트
    new_url = f"https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/{tag}/WebRTC.xcframework.zip"
    content = re.sub(r'spec\.source\s+=\s+\{ :http => ".+"\s+\}', f'spec.source       = {{ :http => "{new_url}" }}', content)

    with open(file_path, 'w') as file:
        file.write(content)
        
def check_gh_auth():
    try:
        result = subprocess.run(['gh', 'auth', 'status'], capture_output=True, text=True)
        if result.returncode != 0:
            log("GitHub CLI is not authenticated. Please log in using gh auth login")
            sys.exit(1)

        if "github.com" not in result.stdout:
            log("GitHub CLI is authenticated, but not with github.com. Please log in using gh auth login --hostname github.com")
            sys.exit(1)

    except FileNotFoundError:
        print("GitHub CLI is not installed. Please install it to proceed.")
        sys.exit(1)
        
def check_existing_release(tag):
    result = subprocess.run(['gh', 'release', 'view', tag, '--json', 'tagName'], text=True, capture_output=True)
    try:
      release_info = json.loads(result.stdout)
      if release_info:
          return True
      return False
    except Exception as e:
      return False
      
def check_webrtc_version_match(build_directory, expected_tag):
    file_path = os.path.join(build_directory, "sdk", "objc", "api", "peerconnection", "RTCPeerConnection.mm")
    pattern = re.compile(r'const NSString \*const PRISMRTCENGINE_WEBRTC_VERSION = @"(.+)"')
    try:
        with open(file_path, 'r') as file:
            content = file.read()
        match = pattern.search(content)
        if match:
            current_version = match.group(1)
            if current_version == expected_tag:
                log(f"WebRTC version match: {current_version} matches the expected tag {expected_tag}")
                return True
            else:
                log(f"WebRTC version mismatch: {current_version} does not match the expected tag {expected_tag}")
                return False
        else:
            log("The PRISMRTCENGINE_WEBRTC_VERSION constant was not found in the file.")
            return False
    except FileNotFoundError:
        log(f"File not found: {file_path}")
        return False

def main():
    
    check_gh_auth()

    parser = argparse.ArgumentParser(description='Deploy WebRTC Framework')
    subparsers = parser.add_subparsers(dest='command')

    release_parser = subparsers.add_parser('release', help='Release a new version of WebRTC')
    release_parser.add_argument('--tag', type=str, required=True, help='Version tag for the release')
    release_parser.add_argument('--build-directory', type=str, required=True, help='Directory where WebRTC is built')
    release_parser.add_argument('--skip-build', action='store_true', help='Skip the building process if xcframework already exists')

    args = parser.parse_args()

    if args.command == 'release':
        release(args.tag, args.build_directory, args.skip_build)

if __name__ == '__main__':
    main()
