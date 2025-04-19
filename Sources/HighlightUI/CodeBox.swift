//
//  CodeBox.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI
import HighlightJS

public struct CodeBox: View {
    @Environment(\.highlightJS) private var highlightJS
    @Environment(\.codeStyle) private var style
    @Environment(\.codeBoxInsets) private var insets

    @Environment(\.font) private var font
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.backgroundStyle) private var backgroundStyle

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
        Group {
            if let backgroundStyle {
                VStack {
                    content
                }
                .backgroundStyle(backgroundStyle)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            } else if let color = highlightedString?.backgroundcolor {
                VStack {
                    content
                }
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            } else {
                VStack {
                    content
                }
                .background(.secondary.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
        }
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

    var content: some View {
        Text(attributedString)
            .font(font ?? .callout)
            .monospaced()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(insets ?? EdgeInsets(.all, 10))
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
    CodeBox(#"print("Hello World")"#, language: .swift)
        .padding()
}
