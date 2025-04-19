//
//  Highlight.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation
import JavaScriptCore

/// `Highlight` exports a few functions as methods of the [Highlight.js](https://highlightjs.readthedocs.io) object.
public final actor Highlight {
    private var _hljs: JSValue?
    var hljs: JSValue {
        get throws {
            if let _hljs {
                return _hljs
            } else {
                guard
                    let context = JSContext(),
                    let highlightPath = Bundle.module.path(forResource: "highlight.min", ofType: "js")
                else {
                    throw Error.notLoaded
                }
                let highlightScript = try String(contentsOfFile: highlightPath)
                context.evaluateScript(highlightScript)
                guard let hljs = context.objectForKeyedSubscript("hljs") else {
                    throw Error.notLoaded
                }
                self._hljs = hljs
                return hljs
            }
        }
    }

    public init() {
    }

    // MARK: - Methods

    /// Core highlighting function.
    ///
    /// - Parameters:
    ///   - text: The code to highlight
    ///   - language: The language to use for highlighting
    ///   - ignoreIllegals: Force highlighting to finish even in case of detecting illegal syntax for the language. Defaults to `true`.
    /// - Returns: The result of the Highlight.js operation
    public func highlight(_ text: String, language: Language, ignoreIllegals: Bool = false) throws -> Result {
        let options: [String: Any] = [
            "language": language.rawValue,
            "ignoreIllegals": ignoreIllegals
        ]

        let result = try hljs.invokeMethod("highlight", withArguments: [text, options])
        return try Result(result, fallback: text)
    }

    /// Highlighting with language detection.
    ///
    /// - Parameters
    ///     - text: The code to highlight
    ///     - languages: Optional list of languages restricting detection to only those languages.
    ///
    /// - Returns: The result of the Highlight.js operation
    public func highlightAuto(_ text: String, languages: [Language]? = nil) throws -> Result {
        let result = if let languages {
            try hljs.invokeMethod("highlightAuto", withArguments: [text, languages.map(\.rawValue)])
        } else {
            try hljs.invokeMethod("highlightAuto", withArguments: [text])
        }
        return try Result(result, fallback: text)
    }
    /// Returns the full Highlight.js version
    public var version: String {
        get throws {
            guard let result = try hljs.objectForKeyedSubscript("versionString") else {
                throw Error.valueNotFound
            }
            return result.toString()
        }
    }

    // MARK: - HighlightedString

    /// Create a ``HighlightedString`` with a specified language.
    ///
    /// - Parameters:
    ///   - text: The code to highlight.
    ///   - language: The language to use for highlighting.
    ///   - ignoreIllegals: Force highlighting to finish even in case of detecting illegal syntax for the language. Defaults to `true`.
    ///   - css: The CSS to apply.
    /// - Returns: The result of the Highlight.js operation
    public func highlightedString(
        _ text: String,
        language: Language,
        ignoreIllegals: Bool = true,
        css: String
    ) throws -> HighlightedString {
        let result = try highlight(text, language: language, ignoreIllegals: ignoreIllegals)
        return try HighlightedString(result.value, css: css)
    }

    /// Create a ``HighlightedString`` with language detection.
    ///
    /// - Parameters:
    ///   - text: The code to highlight.
    ///   - languages: Optional list of languages restricting detection to only those languages.
    ///   - css: The CSS to apply.
    /// - Returns: The result of the Highlight.js operation
    public func highlightedString(
        _ text: String,
        languages: [Language]? = nil,
        css: String
    ) throws -> HighlightedString {
        let result = try highlightAuto(text, languages: languages)
        return try HighlightedString(result.value, css: css)
    }
}
