//
//  File.swift
//  HighlightJS
//
//  Created by David Walter on 18.04.25.
//

import Foundation
import Testing
@testable import HighlightJS

struct HighlightJS {
    let hljs = Highlight()

    @Test func version() async throws {
        let result = try await hljs.version
        #expect(result == "11.9.0")
    }

    @Test func empty() async throws {
        let result = try await hljs.highlightAuto("")
        #expect(result.value == "")
        #expect(result.language == nil)
        #expect(result.relevance == 0)
        #expect(result.illegal == false)
    }

    @Test func automaticHelloWorld() async throws {
        let code = "Hello World"
        let result = try await hljs.highlightAuto(code)
        #expect(result.value == "Hello World")
        #expect(result.language == nil)
        #expect(result.relevance == 0)
        #expect(result.illegal == false)
    }

    @Test func swiftHelloWorld() async throws {
        let code = #"print("Hello World")"#
        let result = try await hljs.highlight(code, language: .swift)
        #expect(result.value == #"<span class="hljs-built_in">print</span>(<span class="hljs-string">&quot;Hello World&quot;</span>)"#)
        #expect(result.language == .swift)
        #expect(result.relevance == 2)
        #expect(result.illegal == false)
    }
}
