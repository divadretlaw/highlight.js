//
//  Result.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation
import JavaScriptCore

extension Highlight {
    /// A result of a Highlight.js method invocation
    public struct Result: Sendable {
        /// HTML string with highlighting markup
        public let value: String
        /// Detected language
        public let language: Language?
        /// Integer value representing the relevance score
        public let relevance: Int
        /// Boolean representing whether any illegal matches were found
        public let illegal: Bool
        
        /// Create a Hightlight.js result
        /// - Parameters:
        ///   - value:  HTML string with highlighting markup
        ///   - language: The language of the highlighting markup
        ///   - relevance: Integer value representing the relevance score
        ///   - illegal: Boolean representing whether any illegal matches were found
        public init(value: String, language: Language?, relevance: Int, illegal: Bool) {
            self.value = value
            self.language = language
            self.relevance = relevance
            self.illegal = illegal
        }
        
        /// Create a Hightlight.js result from a `JSValue`
        /// - Parameter jsValue: The value
        public init(_ jsValue: JSValue?) throws {
            guard
                let jsValue,
                let value = jsValue.objectForKeyedSubscript("value").toString()
            else {
                throw Error.valueNotFound
            }
            self.value = value == "undefined" ? jsValue.objectForKeyedSubscript("code").toString() : value
            let language = jsValue.objectForKeyedSubscript("language").toString()
            self.language = Language(rawValue: language)
            self.relevance = Int(jsValue.objectForKeyedSubscript("relevance").toInt32())
            self.illegal = jsValue.objectForKeyedSubscript("illegal").toBool()
        }

        /// Create a Hightlight.js result from a `JSValue`
        /// - Parameter jsValue: The value
        init(_ jsValue: JSValue?, fallback: String) throws {
            guard
                let jsValue,
                let value = jsValue.objectForKeyedSubscript("value").toString()
            else {
                throw Error.valueNotFound
            }
            self.value = value == "undefined" ? fallback : value
            let language = jsValue.objectForKeyedSubscript("language").toString()
            self.language = Language(rawValue: language)
            self.relevance = Int(jsValue.objectForKeyedSubscript("relevance").toInt32())
            self.illegal = jsValue.objectForKeyedSubscript("illegal").toBool()
        }
    }
}
