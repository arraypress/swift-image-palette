// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ImagePalette",
    defaultLocalization: "en",
    // ImageIO and CoreGraphics only — no UI framework, so this runs on every
    // Apple platform and in a headless process.
    platforms: [
        .macOS(.v14), .iOS(.v17), .tvOS(.v17), .watchOS(.v10), .visionOS(.v1)
    ],
    products: [
        .library(name: "ImagePalette", targets: ["ImagePalette"]),
    ],
    targets: [
        .target(name: "ImagePalette", resources: [.process("Localizable.xcstrings")], swiftSettings: [.swiftLanguageMode(.v6)]),
        .testTarget(name: "ImagePaletteTests", dependencies: ["ImagePalette"]),
    ]
)
