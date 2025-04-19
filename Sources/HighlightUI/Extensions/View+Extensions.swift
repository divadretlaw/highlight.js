//
//  View+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI
import HighlightJS

extension View {
    // MARK: - Insets

    /// Applies an inset to the code boxes.
    ///
    /// Use `codeBoxInsets(_:)` to change the default padding of the content of code boxes.
    ///
    /// - Parameter insets: The ``EdgeInsets`` to apply to the edges of the view.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeBoxInsets(_ insets: EdgeInsets) -> some View {
        environment(\.codeBoxInsets, insets)
    }

    /// Applies an inset to the code boxes.
    ///
    /// Use `codeBoxInsets(_:)` to change the default padding of the content of code boxes.
    ///
    /// - Parameters:
    ///     - edges: The set of edges to inset for this view. The default is `Edge.Set.all`.
    ///     - length: An amount, given in points, to inset this view on the
    ///               specified edges. If you set the value to `nil`, SwiftUI uses
    ///               a platform-specific default amount.
    ///               The default value of this parameter is `nil`.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeBoxInsets(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
        environment(\.codeBoxInsets, EdgeInsets(edges, length))
    }

    /// Applies an inset to the code boxes.
    ///
    /// Use `codeBoxInsets(_:)` to change the default padding of the content of code boxes.
    ///
    /// - Parameter length: An amount, given in points, to inset this view on the
    ///                     specified edges. If you set the value to `nil`, SwiftUI uses
    ///                     a platform-specific default amount.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeBoxInsets(_ length: CGFloat) -> some View {
        environment(\.codeBoxInsets, EdgeInsets(.all, length))
    }

    // MARK: - Style

    /// Sets the style to use in ``CodeText`` and ``CodeBlock``
    ///
    /// - Parameter style: The style to use
    public func codeStyle(_ style: Style) -> some View {
        environment(\.codeStyle, style)
    }
}
