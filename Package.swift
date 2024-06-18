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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.11/WebRTC.xcframework.zip",
            checksum: "b104ddb78128a1241fd1cf8475f1065358dc2f1d4509fb3b8be5a5989800d85c"
        )
    ]
)
