// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImagePalette",
    // ImageIO and CoreGraphics only — no UI framework, so this runs on every
    // Apple platform and in a headless process.
    platforms: [
        .macOS(.v13), .iOS(.v16), .tvOS(.v16), .watchOS(.v9), .visionOS(.v1)
    ],
    products: [
        .library(name: "ImagePalette", targets: ["ImagePalette"]),
    ],
    targets: [
        .target(name: "ImagePalette"),
        .testTarget(name: "ImagePaletteTests", dependencies: ["ImagePalette"]),
    ]
)
