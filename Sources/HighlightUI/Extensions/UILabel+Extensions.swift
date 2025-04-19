//
//  UILabel+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import HighlightJS
#if canImport(UIKit)
import UIKit

extension UILabel {
    private static var AssociatedHighlightedString: UInt8 = 0

    public var highlightedText: HighlightedString? {
        get {
            objc_getAssociatedObject(self, &UILabel.AssociatedHighlightedString) as? HighlightedString
        }
        set {
            objc_setAssociatedObject(self, &UILabel.AssociatedHighlightedString, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let newValue {
                attributedText = NSAttributedString(newValue.wrappedValue)
                backgroundColor = newValue.uiBackgroundColor
            }
        }
    }
}
#endif
