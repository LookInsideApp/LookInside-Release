// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LookInside-Release",
    platforms: [
        .iOS("13.0"),
        .macOS("14.0"),
    ],
    products: [
        .library(
            name: "LookInsideServer",
            targets: ["LookInsideServer"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LookInsideServer",
            url: "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.3/LookInsideServer.xcframework.zip",
            checksum: "641a6f1ece18a36f8efa92d14343153a78206a690ab010fc66b76ea63e1c4de3"
        ),
        .testTarget(
            name: "LookInsideReleaseLookInsideServerTests",
            dependencies: ["LookInsideServer"],
            path: "Tests/LookInsideReleaseLookInsideServerTests"
        )
    ]
)
