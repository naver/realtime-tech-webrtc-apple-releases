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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.7/WebRTC.xcframework.zip",
            checksum: "02d32cd80a3b823b11aa8b75af3342c105e507c8eaf99520c8fa6c3d51707bc6"
        )
    ]
)
