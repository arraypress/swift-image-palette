// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ImagePalette",
    // ImageIO and CoreGraphics only — no UI framework, so this runs on every
    // Apple platform and in a headless process.
    platforms: [
        .macOS(.v14), .iOS(.v17), .tvOS(.v17), .watchOS(.v10), .visionOS(.v1)
    ],
    products: [
        .library(name: "ImagePalette", targets: ["ImagePalette"]),
    ],
    targets: [
        .target(name: "ImagePalette", swiftSettings: [.swiftLanguageMode(.v6)]),
        .testTarget(name: "ImagePaletteTests", dependencies: ["ImagePalette"]),
    ]
)
