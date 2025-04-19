import UIKit
import Testing
@testable import HighlightJS
@testable import HighlightUI

@MainActor struct UIKitTests {
    let hljs = Highlight()

    @Test func uiLabel() async throws {
        let code = #"print("Hello World")"#
        let string = try await hljs.highlightedString(code, language: .swift, css: "")

        let label = UILabel()
        #expect(label.highlightedText == nil)
        label.highlightedText = string
        #expect(label.highlightedText == string)
        #expect(label.attributedText != nil)
        #expect(label.text == string.string)
    }
}
