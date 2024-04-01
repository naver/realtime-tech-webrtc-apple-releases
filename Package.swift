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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.5/WebRTC.xcframework.zip",
            checksum: "66a9caf6b6d581db53ffaac3bd54c29d9a3a96ff135ba5e341bf4d54764f8f8d"
        )
    ]
)
