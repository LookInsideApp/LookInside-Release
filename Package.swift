// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LookInside-Release",
    platforms: [
        .iOS("15.0"),
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
            url: "https://github.com/LookInsideApp/LookInside-Release/releases/download/1.1.1/LookInsideServer.xcframework.zip",
            checksum: "85517003f6076da5d279848a8f171af0c0a16c258f0f1c19d66141fd4cb57147"
        ),
        .testTarget(
            name: "LookInsideReleaseLookInsideServerTests",
            dependencies: ["LookInsideServer"],
            path: "Tests/LookInsideReleaseLookInsideServerTests"
        )
    ]
)
