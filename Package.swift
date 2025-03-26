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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.13/WebRTC.xcframework.zip",
            checksum: "e59c0366652dcb9bb3311f21299b0d289928c9f9e4908da3d60d06363b5dc45f"
        )
    ]
)
