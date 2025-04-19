//
//  AttributedString+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation

extension AttributedString {
    /// Create a attributed string from a highlighted string.
    ///
    /// - Parameter string: The highlighted string to use.
    public init(_ string: HighlightedString) {
        self = string.wrappedValue
    }
}
