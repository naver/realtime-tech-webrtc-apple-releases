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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.4/WebRTC.xcframework.zip",
            checksum: "3460e2cb63cae55c75e4142b39fc4825500b41f62c9167006447fea68d7a0abd"
        )
    ]
)
