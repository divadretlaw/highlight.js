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
    public init(_ string: HighlightedString) {
        self.init(string.wrappedValue)
    }
}
#endif
