//
//  CodeText.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI
import HighlightJS

public struct CodeText: View {
    @Environment(\.highlightJS) private var highlightJS
    @Environment(\.codeStyle) private var style

    @Environment(\.font) private var font
    @Environment(\.colorScheme) private var colorScheme

    let text: String
    let language: Language?

    @State private var highlightedString: HighlightedString?

    public init(_ text: String, language: Language? = nil) {
        self.text = text
        self.language = language
    }

    public init(language: Language? = nil, text: () -> String) {
        self.text = text()
        self.language = language
    }

    public var body: some View {
        Text(attributedString)
            .font(font ?? .callout)
            .monospaced()
            .task(id: identifier) {
                do {
                    highlightedString = if let language {
                        try await highlightJS.highlightedString(text, language: language, css: css)
                    } else {
                        try await highlightJS.highlightedString(text, css: css)
                    }
                } catch {
                    highlightedString = nil
                }
            }
    }

    private var attributedString: AttributedString {
        highlightedString?.wrappedValue ?? AttributedString(stringLiteral: text)
    }

    private var css: String {
        style.css(for: colorScheme)
    }

    private var identifier: Int {
        var hasher = Hasher()
        hasher.combine(text)
        hasher.combine(style)
        hasher.combine(colorScheme)
        return hasher.finalize()
    }
}

#Preview {
    CodeText(#"print("Hello World")"#, language: .swift)
        .padding()
}
