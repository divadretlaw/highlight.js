//
//  Color+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

#if canImport(SwiftUI)
import SwiftUI

extension Color {
    #if canImport(AppKit)
    init?(_ color: NSColor?) {
        guard let color else { return nil }
        self = Color(nsColor: color)
    }
    #endif

    #if canImport(UIKit)
    init?(_ color: UIColor?) {
        guard let color else { return nil }
        self = Color(uiColor: color)
    }
    #endif
}
#endif
