import Foundation
import Testing
@testable import HighlightJS

struct LanguageTests {
    @Test func rawValue() {
        let language = Language(rawValue: "swift")
        #expect(language == .swift)
    }

    @Test func unknown() {
        let language = Language(rawValue: "unknown")
        #expect(language == nil)
    }

    @Test func alias() {
        let language = Language(rawValue: "rs" as? String)
        #expect(language == .rust)
    }
}
