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

    var codeTextStyle: Style {
        get { self[CodeTextStyleKey.self] }
        set { self[CodeTextStyleKey.self] = newValue }
    }
}

// MARK: - Private

private struct HighlightEnvironmentKey: EnvironmentKey {
    static let defaultValue: Highlight = Highlight()
}

private struct codeBoxInsetsKey: EnvironmentKey {
    static let defaultValue: EdgeInsets? = nil
}

private struct CodeTextStyleKey: EnvironmentKey {
    static let defaultValue: Style = Style("pre code.hljs{display:block;overflow-x:auto;padding:1em}code.hljs{padding:3px 5px}pre code.hljs{display:block;overflow-x:auto;padding:1em}code.hljs{padding:3px 5px}.hljs{color:#E7E8EB;background:#292A2F}.hljs ::selection,.hljs::selection{background-color:#363945}.hljs-formula,.hljs-params,.hljs-property{}.hljs-comment{color:#6C7986;font-style:italic}.hljs-tag{color:#7E8086}.hljs-operator,.hljs-punctuation,.hljs-subst{color:#E7E8EB}.hljs-bullet,.hljs-deletion,.hljs-name,.hljs-selector-tag,.hljs-template-variable,.hljs-variable{color:#EF82B1}.hljs-attr,.hljs-literal,.hljs-number,.hljs-symbol,.hljs-variable.constant_{color:#A4A0F1}.hljs-link{color:#74B6F6}.hljs-class .hljs-title,.hljs-title,.hljs-title.class_{color:#ADD681}.hljs-strong{font-weight:bold;color:#ADD681}.hljs-addition,.hljs-code,.hljs-string,.hljs-title.class_.inherited__{color:#FC6A5D}.hljs-built_in,.hljs-doctag,.hljs-keyword.hljs-atrule,.hljs-quote,.hljs-regexp{color:#74B6F6}.hljs-attribute,.hljs-function .hljs-title,.hljs-section,.hljs-title.function_,.ruby .hljs-property{color:#99E8D5}.diff .hljs-meta,.hljs-template-tag,.hljs-type{color:#99E8D5}.hljs-keyword{color:#EF82B1}.hljs-emphasis{color:#EF82B1;font-style:italic}.hljs-meta,.hljs-meta .hljs-keyword,.hljs-meta .hljs-string{color:#D38D5E}.hljs-meta .hljs-keyword,.hljs-meta-keyword{font-weight:bold}")
}
