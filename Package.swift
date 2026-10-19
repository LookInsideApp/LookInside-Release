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
            url: "https://github.com/LookInsideApp/LookInside-Release/releases/download/1.0.2/LookInsideServer.xcframework.zip",
            checksum: "c9a2646382ce6c9a949a04dc41b32457741083fd7fc3e2e64ff92b3c5b721ede"
        ),
        .testTarget(
            name: "LookInsideReleaseLookInsideServerTests",
            dependencies: ["LookInsideServer"],
            path: "Tests/LookInsideReleaseLookInsideServerTests"
        )
    ]
)
