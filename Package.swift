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
            url: "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.5/LookInsideServer.xcframework.zip",
            checksum: "9e327310189a6e976d33b91bba4567048a5d0f2a390891ae2798a17af206e0ab"
        ),
        .testTarget(
            name: "LookInsideReleaseLookInsideServerTests",
            dependencies: ["LookInsideServer"],
            path: "Tests/LookInsideReleaseLookInsideServerTests"
        )
    ]
)
