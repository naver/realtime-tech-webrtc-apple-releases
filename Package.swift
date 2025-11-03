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
            url: "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.1.0/WebRTC.xcframework.zip",
            checksum: "3ce0a2def048b9357ad3f5880b8abdcf1ec6e5d35784683a1bbf5ffbb3ee1f58"
        )
    ]
)
