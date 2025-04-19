//
//  Style.swift
//  Highlight.js
//
//  Created by David Walter on 19.04.25.
//

import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif

/// An adaptive style for Highlight.js content
public struct Style: Hashable, Equatable, Sendable {
    public static let `default` = Style(
        light: ".hljs{color:#24292e;background:#ffffff}.hljs-doctag,.hljs-keyword,.hljs-meta .hljs-keyword,.hljs-template-tag,.hljs-template-variable,.hljs-type,.hljs-variable.language_{color:#d73a49}.hljs-title,.hljs-title.class_,.hljs-title.class_.inherited__,.hljs-title.function_{color:#6f42c1}.hljs-attr,.hljs-attribute,.hljs-literal,.hljs-meta,.hljs-number,.hljs-operator,.hljs-selector-attr,.hljs-selector-class,.hljs-selector-id,.hljs-variable{color:#005cc5}.hljs-meta .hljs-string,.hljs-regexp,.hljs-string{color:#032f62}.hljs-built_in,.hljs-symbol{color:#e36209}.hljs-code,.hljs-comment,.hljs-formula{color:#6a737d}.hljs-name,.hljs-quote,.hljs-selector-pseudo,.hljs-selector-tag{color:#22863a}.hljs-subst{color:#24292e}.hljs-section{color:#005cc5;font-weight:bold}.hljs-bullet{color:#735c0f}.hljs-emphasis{color:#24292e;font-style:italic}.hljs-strong{color:#24292e;font-weight:bold}.hljs-addition{color:#22863a;background-color:#f0fff4}.hljs-deletion{color:#b31d28;background-color:#ffeef0}.hljs-char.escape_,.hljs-link,.hljs-params,.hljs-property,.hljs-punctuation,.hljs-tag{}",
        dark: ".hljs{color:#adbac7;background:#22272e}.hljs-doctag,.hljs-keyword,.hljs-meta .hljs-keyword,.hljs-template-tag,.hljs-template-variable,.hljs-type,.hljs-variable.language_{color:#f47067}.hljs-title,.hljs-title.class_,.hljs-title.class_.inherited__,.hljs-title.function_{color:#dcbdfb}.hljs-attr,.hljs-attribute,.hljs-literal,.hljs-meta,.hljs-number,.hljs-operator,.hljs-selector-attr,.hljs-selector-class,.hljs-selector-id,.hljs-variable{color:#6cb6ff}.hljs-meta .hljs-string,.hljs-regexp,.hljs-string{color:#96d0ff}.hljs-built_in,.hljs-symbol{color:#f69d50}.hljs-code,.hljs-comment,.hljs-formula{color:#768390}.hljs-name,.hljs-quote,.hljs-selector-pseudo,.hljs-selector-tag{color:#8ddb8c}.hljs-subst{color:#adbac7}.hljs-section{color:#316dca;font-weight:bold}.hljs-bullet{color:#eac55f}.hljs-emphasis{color:#adbac7;font-style:italic}.hljs-strong{color:#adbac7;font-weight:bold}.hljs-addition{color:#b4f1b4;background-color:#1b4721}.hljs-deletion{color:#ffd8d3;background-color:#78191b}.hljs-char.escape_,.hljs-link,.hljs-params,.hljs-property,.hljs-punctuation,.hljs-tag{}"
    )

    /// The default style
    private var _css: String
    /// The dark variant
    private var _dark: String?
    /// The light variant
    private var _light: String?

    /// Create a style
    ///
    /// - Parameter css: The CSS of the style
    public init(_ css: String) {
        _css = css
    }

    /// Create a style
    ///
    /// - Parameter css: The ``Theme`` of the style
    public init(_ css: Theme) {
        _css = css.generate()
    }

    /// Create a style
    ///
    /// - Parameters:
    ///   - light: The CSS of the light variant of the style
    ///   - dark: The CSS of the dark variant of the style
    public init(light: String, dark: String) {
        _css = light
        _dark = dark
    }

    /// Create a style
    ///
    /// - Parameters:
    ///   - light: The ``Theme`` of the light variant of the style
    ///   - dark: The ``Theme`` of the dark variant of the style
    public init(light: Theme, dark: Theme) {
        _css = light.generate()
        _dark = dark.generate()
    }

    /// Create a style
    ///
    /// - Parameters:
    ///   - css: The CSS of the default variant of the style
    ///   - light: The CSS of the light variant of the style
    ///   - dark: The CSS of the dark variant of the style
    ///
    /// > Note:
    /// > The default variant would only be used if the color scheme is neither light nor dark.
    public init(_ css: String, light: String, dark: String) {
        _css = css
        _light = light
        _dark = dark
    }

    /// Create a style
    ///
    /// - Parameters:
    ///   - css: The ``Theme`` of the default variant of the style
    ///   - light: The ``Theme`` of the light variant of the style
    ///   - dark: The ``Theme`` of the dark variant of the style
    ///
    /// > Note:
    /// > The default variant would only be used if the color scheme is neither light nor dark.
    public init(_ css: Theme, light: Theme, dark: Theme) {
        _css = css.generate()
        _light = light.generate()
        _dark = dark.generate()
    }

    /// The light variant (if available)
    var light: String {
        _light ?? _css
    }

    /// The dark variant (if available)
    var dark: String {
        _dark ?? _css
    }

    public func css() -> String {
        _css
    }

    #if canImport(AppKit)
    public func css(for appearance: NSAppearance) -> String {
        switch appearance.name {
        case .aqua, .vibrantLight, .accessibilityHighContrastAqua, .accessibilityHighContrastVibrantLight:
            light
        case .darkAqua, .vibrantDark, .accessibilityHighContrastDarkAqua, .accessibilityHighContrastVibrantDark:
            dark
        default:
            _css
        }
    }
    #endif

    #if canImport(UIKit)
    public func css(for colorScheme: UIUserInterfaceStyle?) -> String {
        switch colorScheme {
        case .light:
            light
        case .dark:
            dark
        case .unspecified:
            _css
        default:
            _css
        }
    }
    #endif

    #if canImport(SwiftUI)
    public func css(for colorScheme: ColorScheme?) -> String {
        switch colorScheme {
        case .light:
            light
        case .dark:
            dark
        case nil:
            _css
        @unknown default:
            _css
        }
    }
    #endif
}
