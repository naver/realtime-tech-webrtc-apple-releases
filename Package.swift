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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.3/WebRTC.xcframework.zip",
            checksum: "d7823e7e013e32b7fc2d27ad594b49ee25c093678bccff93c593e7cbccd3b8c3"
        )
    ]
)
