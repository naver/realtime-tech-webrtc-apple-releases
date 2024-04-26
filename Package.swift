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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.9/WebRTC.xcframework.zip",
            checksum: "87acf2a710ea5d6d1588c542e2e677d0d35cdbcc8b3d211d32eb7ed40e857fbc"
        )
    ]
)
