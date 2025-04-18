//
//  View+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI

extension View {
    // MARK: - Insets

    /// Applies an inset to the code texts.
    ///
    /// Use `codeTextInsets(_:)` to change the default padding of the content of code texts.
    ///
    /// - Parameter insets: The ``EdgeInsets`` to apply to the edges of the view.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeTextInsets(_ insets: EdgeInsets) -> some View {
        environment(\.codeTextInsets, insets)
    }

    /// Applies an inset to the code texts.
    ///
    /// Use `codeTextInsets(_:)` to change the default padding of the content of code texts.
    ///
    /// - Parameters:
    ///     - edges: The set of edges to inset for this view. The default is `Edge.Set.all`.
    ///     - length: An amount, given in points, to inset this view on the
    ///               specified edges. If you set the value to `nil`, SwiftUI uses
    ///               a platform-specific default amount.
    ///               The default value of this parameter is `nil`.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeTextInsets(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
        environment(\.codeTextInsets, EdgeInsets(edges, length))
    }

    /// Applies an inset to the code texts.
    ///
    /// Use `codeTextInsets(_:)` to change the default padding of the content of code texts.
    ///
    /// - Parameter length: An amount, given in points, to inset this view on the
    ///                     specified edges. If you set the value to `nil`, SwiftUI uses
    ///                     a platform-specific default amount.
    /// - Returns: A view that uses the given edge insets when used as a code text.
    public func codeTextInsets(_ length: CGFloat) -> some View {
        environment(\.codeTextInsets, EdgeInsets(.all, length))
    }

    // MARK: - Background

    /// Specifies the visibility of the background for code text views within this view.
    ///
    /// - Parameters:
    ///     - visibility: The visibility to use for the background.
    public func codeTextBackground(_ visibility: Visibility) -> some View {
        environment(\.codeTextBackground, visibility)
    }
}
