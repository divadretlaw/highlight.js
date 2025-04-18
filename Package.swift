// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Highlight.js",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "HighlightJS",
            targets: ["HighlightJS"]
        ),
    ],
    targets: [
        .target(
            name: "HighlightJS",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "HighlightTests",
            dependencies: [
                "HighlightJS",
                "HighlightUI"
            ]
        )
    ]
)
