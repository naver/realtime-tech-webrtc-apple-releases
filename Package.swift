// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "WebRTC",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "WebRTC",
            targets: ["WebRTC"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.14/WebRTC.xcframework.zip",
            checksum: "bdbab1d7ddddb1abc17b8dc4f164cd151a7ba4017e549fa0673d36ef3c6c1f80"
        )
    ]
)
