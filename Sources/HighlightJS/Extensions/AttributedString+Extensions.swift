//
//  AttributedString+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation

extension AttributedString {
    public init(_ string: HighlightedString) {
        self = string.wrappedValue
    }
}
