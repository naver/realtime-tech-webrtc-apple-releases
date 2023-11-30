// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "WebRTC",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "WebRTC",
            targets: ["WebRTC"]),
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.1/WebRTC.xcframework.zip",
            checksum: "016f1d4cc30826e49ac16657470d6440f2e6b670ee0281b18df4e6f24e1abb15"
        )
    ]
)
