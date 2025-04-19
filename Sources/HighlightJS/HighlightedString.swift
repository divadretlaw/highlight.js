//
//  HighlightedString.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
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

/// A string with highlights from Highlight.js
public struct HighlightedString: Hashable, Equatable, Sendable, ExpressibleByStringLiteral {
    package var wrappedValue: AttributedString

    #if canImport(AppKit)
    /// The preferred background color of the highlighted string
    public let nsBackgroundColor: NSColor?
    #endif
    #if canImport(UIKit)
    /// The preferred background color of the highlighted string
    public let uiBackgroundColor: UIColor?
    #endif
    #if canImport(SwiftUI)
    /// The preferred background color of the highlighted string
    public let backgroundcolor: Color?
    #endif

    public init(_ result: Highlight.Result, css: String) throws {
        try self.init(result.value, css: css)
    }

    init(_ text: String, css: String) throws {
        let html = """
            <style>\(css)</style>
            <pre><code class="hljs">\(text)</code></pre>
            """

        let string = try NSMutableAttributedString(
            data: Data(html.utf8),
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
        let range = NSRange(location: 0, length: string.length - 1) // Remove trailing new-line
        // Read attributes before adapting
        let attributes = string.attributes(at: 0, longestEffectiveRange: nil, in: range)
        // Remove certain attributes
        string.removeAttribute(.font, range: range)
        string.removeAttribute(.backgroundColor, range: range)
        let attributedString = string.attributedSubstring(from: range)

        #if canImport(AppKit)
        wrappedValue = try AttributedString(attributedString, including: \.appKit)
        #elseif canImport(UIKit)
        wrappedValue = try AttributedString(attributedString, including: \.uiKit)
        #else
        wrappedValue = AttributedString(attributedString)
        #endif

        #if canImport(AppKit)
        nsBackgroundColor = attributes[.backgroundColor] as? NSColor
            #if canImport(SwiftUI)
            backgroundcolor = Color(nsBackgroundColor)
            #endif
        #endif

        #if canImport(UIKit)
        uiBackgroundColor = attributes[.backgroundColor] as? UIColor
            #if canImport(SwiftUI)
            backgroundcolor = Color(uiBackgroundColor)
            #endif
        #endif
    }

    /// Create a highlighted string from an attributed string.
    ///
    /// - Parameter attributedString: The attributed string to use.
    public init(_ attributedString: AttributedString) throws {
        try self.init(NSMutableAttributedString(attributedString))
    }

    /// Create a highlighted string from an attributed string.
    ///
    /// - Parameter attributedString: The attributed string to use.
    public init(_ attributedString: NSAttributedString) throws {
        try self.init(NSMutableAttributedString(attributedString: attributedString))
    }

    private init(_ string: NSMutableAttributedString) throws {
        let range = NSRange(location: 0, length: string.length)
        // Read attributes before adapting
        let attributes = string.attributes(at: 0, longestEffectiveRange: nil, in: range)
        // Remove certain attributes
        string.removeAttribute(.font, range: range)
        string.removeAttribute(.backgroundColor, range: range)
        let attributedString = string.attributedSubstring(from: range)

        #if canImport(AppKit)
        wrappedValue = try AttributedString(attributedString, including: \.appKit)
        #elseif canImport(UIKit)
        wrappedValue = try AttributedString(attributedString, including: \.uiKit)
        #else
        wrappedValue = AttributedString(attributedString)
        #endif

        #if canImport(AppKit)
        nsBackgroundColor = attributes[.backgroundColor] as? NSColor
            #if canImport(SwiftUI)
            backgroundcolor = Color(nsBackgroundColor)
            #endif
        #endif

        #if canImport(UIKit)
        uiBackgroundColor = attributes[.backgroundColor] as? UIColor
            #if canImport(SwiftUI)
            backgroundcolor = Color(uiBackgroundColor)
            #endif
        #endif
    }

    /// The character contents of the highlighted string as a string.
    public var string: String {
        NSAttributedString(wrappedValue).string
    }

    // MARK: - ExpressibleByStringLiteral

    public init(stringLiteral value: String) {
        wrappedValue = AttributedString(value)

        #if canImport(AppKit)
        nsBackgroundColor = nil
        #endif

        #if canImport(UIKit)
        uiBackgroundColor = nil
        #endif

        #if canImport(SwiftUI)
        backgroundcolor = nil
        #endif
    }
}
