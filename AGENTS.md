# Swift Image Palette

The colours of an image, with how much of it each one covers: k-means in OKLab (so "different" means
different to the eye), deterministic from a fixed seed, near colours merged, slivers dropped, transparent
pixels skipped. Any image ImageIO reads, drawn down to 256 px before sampling. CoreGraphics and ImageIO
only — no UI framework, headless.

- Module `ImagePalette` in `Sources/ImagePalette`; tests in `Tests`; `swift test` is the whole check.
- Swift 6 language mode, tools 6.2, macOS 14+ (iOS 17, tvOS 17, watchOS 10, visionOS 1), no dependencies.
- Part of the Sidewatch package family; every package follows the same layout and PR rules.

## Module map

- `Core/` — `PaletteExtractor` (`extract(from:options:)` over a URL, a `CGImage` or OKLab samples; `PaletteOptions`), `ImageSampling` (load, draw down, un-premultiply, drop clear pixels)
- `Models/` — `Swatch` (sRGB bytes, share, OKLab lightness / chroma / hue, `hex` / `rgb` / `hsl`), `OKLab`
- `Support/` — `ColorFormats` (the string forms), `SplitMix` (the seeded generator)

## Rules

@CONTRIBUTING.md

- **Auditing? Read `AUDIT.md` first** — what the last full audit checked and fixed, and the known non-issues to skip; extend it, do not redo it.
