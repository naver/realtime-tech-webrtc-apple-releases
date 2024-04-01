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
            checksum: "62a9fc22224acd12b028f5d2af15e239f0aa74762413cdc60da47da873f15861"
        )
    ]
)
