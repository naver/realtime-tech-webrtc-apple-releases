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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.1.1/WebRTC.xcframework.zip",
            checksum: "95914bbf3fba61473a5c4a1185e6e7914cd505a74ea849f2ec9ba53865952e8b"
        )
    ]
)
