//
//  Environment.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI
import HighlightJS

extension EnvironmentValues {
    // MARK: - Public

    /// The Highlight.js instance to use
    public var highlightJS: Highlight {
        get { self[HighlightEnvironmentKey.self] }
        set { self[HighlightEnvironmentKey.self] = newValue }
    }

    // MARK: - Internal

    var codeBoxInsets: EdgeInsets? {
        get { self[codeBoxInsetsKey.self] }
        set { self[codeBoxInsetsKey.self] = newValue }
    }

    var codeStyle: Style {
        get { self[CodeStyleKey.self] }
        set { self[CodeStyleKey.self] = newValue }
    }
}

// MARK: - Private

private struct HighlightEnvironmentKey: EnvironmentKey {
    static let defaultValue: Highlight = Highlight()
}

private struct codeBoxInsetsKey: EnvironmentKey {
    static let defaultValue: EdgeInsets? = nil
}

private struct CodeStyleKey: EnvironmentKey {
    static let defaultValue: Style = Style.default
}
