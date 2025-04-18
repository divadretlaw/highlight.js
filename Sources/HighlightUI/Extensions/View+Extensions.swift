//
//  View+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI

extension View {
    // MARK: - Insets

    public func codeTextInsets(_ insets: EdgeInsets) -> some View {
        environment(\.codeTextInsets, insets)
    }

    public func codeTextInsets(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
        environment(\.codeTextInsets, EdgeInsets(edges, length))
    }

    public func codeTextInsets(_ length: CGFloat) -> some View {
        environment(\.codeTextInsets, EdgeInsets(.all, length))
    }

    // MARK: - Background

    public func codeTextBackground(_ visibility: Visibility) -> some View {
        environment(\.codeTextBackground, visibility)
    }
}
