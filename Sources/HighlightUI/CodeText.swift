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
    @Environment(\.codeTextInsets) private var insets
    @Environment(\.codeTextStyle) private var style

    @Environment(\.font) private var font
    @Environment(\.colorScheme) private var colorScheme

    let text: String
    let language: Language?

    @State private var attributedString: HighlightedString?
    @State private var color: Color?

    public init(_ text: String, language: Language? = nil) {
        self.text = text
        self.language = language
    }

    public init(language: Language? = nil, text: () -> String) {
        self.text = text()
        self.language = language
    }

    public var body: some View {
        Text(renderedText)
            .font(font ?? .callout)
            .monospaced()
            .task(id: identifier) {
                do {
                    attributedString = if let language {
                        try await highlightJS.highlightedString(text, language: language, css: style.css(for: colorScheme))
                    } else {
                        try await highlightJS.highlightedString(text, css: style.css(for: colorScheme))
                    }
                } catch {
                    attributedString = HighlightedString(stringLiteral: text)
                }
            }
            .padding(insets)
            .modifier(BackgroundModifier(color: attributedString?.backgroundcolor))
    }

    private var renderedText: HighlightedString {
        attributedString ?? HighlightedString(stringLiteral: text)
    }

    private var identifier: Int {
        var hasher = Hasher()
        hasher.combine(text)
        hasher.combine(style)
        hasher.combine(colorScheme)
        return hasher.finalize()
    }
}

private struct BackgroundModifier: ViewModifier {
    @Environment(\.codeTextBackground) private var visibility

    let color: Color?

    func body(content: Content) -> some View {
        switch visibility {
        case .automatic, .visible:
            content.background(color)
        case .hidden:
            content
        }
    }
}

#Preview {
    CodeText(#"print("Hello World")"#, language: .swift)
        .codeTextInsets()
        .padding()
}
