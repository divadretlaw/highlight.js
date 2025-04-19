//
//  Theme+Attribute.swift
//  Highlight.js
//
//  Created by David Walter on 19.04.25.
//

import Foundation

extension Theme {
    public struct Attribute: Sendable, ExpressibleByStringLiteral {
        /// A CSS color
        private let color: String
        /// Whether the `font-weight` should be bold
        private let isBold: Bool
        /// Whether the `font-style` should be italic
        private let isItalic: Bool

        public init(color: String, isBold: Bool = false, isItalic: Bool = false) {
            self.color = color
            self.isBold = isBold
            self.isItalic = isItalic
        }

        func generate(for selector: String) -> String {
            var styles = "color: \(color);"
            if isBold {
                styles += "font-weight: bold;"
            }
            if isItalic {
                styles += "font-style: italic;"
            }
            return "\(selector){\(styles)}"
        }

        // MARK: - ExpressibleByStringLiteral

        public init(stringLiteral string: String) {
            self.color = string
            self.isBold = false
            self.isItalic = false
        }
    }
}

// MARK: - Optional

extension Theme.Attribute? {
    func generate(for selector: String) -> String {
        guard let self else { return "" }
        return self.generate(for: selector)
    }
}
