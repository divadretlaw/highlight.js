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

/// A String with highlights from Highlight.js
public struct HighlightedString: AttributedStringProtocol, ExpressibleByStringLiteral {
    package var wrappedValue: AttributedString

    #if canImport(AppKit)
    public let nsBackgroundColor: NSColor?
    #endif
    #if canImport(UIKit)
    public let uiBackgroundColor: UIColor?
    #endif
    #if canImport(SwiftUI)
    public let backgroundcolor: Color?
    #endif

    public init(_ text: String, css: String) throws {
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

    // MARK: - AttributedStringProtocol

    public var startIndex: AttributedString.Index {
        wrappedValue.startIndex
    }

    public var endIndex: AttributedString.Index {
        wrappedValue.endIndex
    }

    public var runs: AttributedString.Runs {
        wrappedValue.runs
    }

    public var characters: AttributedString.CharacterView {
        wrappedValue.characters
    }

    public var unicodeScalars: AttributedString.UnicodeScalarView {
        wrappedValue.unicodeScalars
    }

    public subscript<K>(value: K.Type) -> K.Value? where K : AttributedStringKey, K.Value : Sendable {
        get {
            wrappedValue[value]
        }
        set {
            wrappedValue[value] = newValue
        }
    }

    public subscript<K>(dynamicMember keyPath: KeyPath<AttributeDynamicLookup, K>) -> K.Value? where K : AttributedStringKey, K.Value : Sendable {
        get {
            wrappedValue[dynamicMember: keyPath]
        }
        set {
            wrappedValue[dynamicMember: keyPath] = newValue
        }
    }

    public subscript<S>(dynamicMember keyPath: KeyPath<AttributeScopes, S.Type>) -> ScopedAttributeContainer<S> where S : AttributeScope {
        get {
            wrappedValue[dynamicMember: keyPath]
        }
        set {
            wrappedValue[dynamicMember: keyPath] = newValue
        }
    }

    public subscript<R>(bounds: R) -> AttributedSubstring where R : RangeExpression, R.Bound == AttributedString.Index {
        wrappedValue[bounds]
    }

    public mutating func setAttributes(_ attributes: AttributeContainer) {
        wrappedValue.setAttributes(attributes)
    }

    public mutating func mergeAttributes(_ attributes: AttributeContainer, mergePolicy: AttributedString.AttributeMergePolicy) {
        wrappedValue.mergeAttributes(attributes, mergePolicy: mergePolicy)
    }

    public mutating func replaceAttributes(_ attributes: AttributeContainer, with others: AttributeContainer) {
        wrappedValue.replaceAttributes(attributes, with: others)
    }
}
