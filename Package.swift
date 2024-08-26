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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.12/WebRTC.xcframework.zip",
            checksum: "4a07a5dd98545f78b26d8c1a8eb1d1ddc94bc0ab8882ccb96986c63d2eabf0b2"
        )
    ]
)
