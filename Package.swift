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
            url: "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.6/LookInsideServer.xcframework.zip",
            checksum: "a50d25eab73d6fe35e7e15d719c5ac1635b6ee11c98b1da0dbc70a6b89bf8f00"
        ),
        .testTarget(
            name: "LookInsideReleaseLookInsideServerTests",
            dependencies: ["LookInsideServer"],
            path: "Tests/LookInsideReleaseLookInsideServerTests"
        )
    ]
)
