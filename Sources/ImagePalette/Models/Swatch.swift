//
//  Swatch.swift
//  ImagePalette
//
//  Created by David Sherlock on 2026.
//

import Foundation

/// One colour of a palette and how much of the picture it covers.
public struct Swatch: Sendable, Equatable, Codable {
    /// Red, sRGB 0–255.
    public let red: UInt8
    /// Green, sRGB 0–255.
    public let green: UInt8
    /// Blue, sRGB 0–255.
    public let blue: UInt8
    /// The fraction of sampled pixels nearest this colour, 0…1. A palette's
    /// shares sum to 1 unless tiny clusters were dropped.
    public let share: Double
    /// OKLab lightness 0…1 — how light it looks.
    public let lightness: Double
    /// OKLab chroma — how far from grey. Above ~0.1 reads as a colour;
    /// below ~0.03 reads as a neutral.
    public let chroma: Double
    /// OKLab hue in degrees, 0…360. Meaningless for neutrals.
    public let hue: Double

    /// A swatch from sRGB bytes and its share of the picture.
    public init(red: UInt8, green: UInt8, blue: UInt8, share: Double) {
        self.red = red; self.green = green; self.blue = blue; self.share = share
        let lab = OKLab(r: red, g: green, b: blue)
        lightness = lab.l; chroma = lab.chroma; hue = lab.hue
    }

    /// `#RRGGBB`, upper case.
    public var hex: String { String(format: "#%02X%02X%02X", red, green, blue) }

    /// `rgb(r, g, b)`.
    public var rgb: String { "rgb(\(red), \(green), \(blue))" }

    /// `hsl(h, s%, l%)` — the CSS numbers, from sRGB.
    public var hsl: String {
        let r = Double(red) / 255, g = Double(green) / 255, b = Double(blue) / 255
        let maxC = max(r, g, b), minC = min(r, g, b), d = maxC - minC
        let l = (maxC + minC) / 2
        var h = 0.0, s = 0.0
        if d > 0 {
            s = d / (1 - abs(2 * l - 1))
            switch maxC {
            case r: h = 60 * (((g - b) / d).truncatingRemainder(dividingBy: 6))
            case g: h = 60 * ((b - r) / d + 2)
            default: h = 60 * ((r - g) / d + 4)
            }
            if h < 0 { h += 360 }
        }
        return String(format: "hsl(%.0f, %.0f%%, %.0f%%)", h, s * 100, l * 100)
    }

    /// Whether this reads as a grey rather than a colour.
    public var isNeutral: Bool { chroma < 0.03 }

    /// The swatch in OKLab, for distances.
    public var oklab: OKLab { OKLab(r: red, g: green, b: blue) }
}
