//
//  Style.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation
import SwiftUI

public struct Style: Hashable, Equatable, Sendable {
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
    
    /// The light variant (if available)
    var light: String {
        _light ?? _css
    }
    
    /// The dark variant (if available)
    var dark: String {
        _dark ?? _css
    }

    func css(for colorScheme: ColorScheme?) -> String {
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
}
