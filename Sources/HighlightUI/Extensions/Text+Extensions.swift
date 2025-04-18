//
//  Text+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import HighlightJS
#if canImport(SwiftUI)
import SwiftUI

extension Text {
    /// Creates a text view that displays styled highlighted content.
    ///
    /// - Parameters:
    ///     - highlightedContent: An highlighted string to style and display, in accordance with its attributes.
    public init(_ highlightedContent: HighlightedString) {
        self.init(highlightedContent.wrappedValue)
    }
}
#endif
