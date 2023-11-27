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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.0/WebRTC.xcframework.zip",
            checksum: "ad41474b7f3ee5926e3cf87b27eba2526001f8680a220bb6befc926bdf1e4e14"
        )
    ]
)
