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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.12-debug/WebRTC.xcframework.zip",
            checksum: "7e454e025bf80076a301ea0e632e8682e36e4897c26a3f427ad6feb8aa457b40"
        )
    ]
)
