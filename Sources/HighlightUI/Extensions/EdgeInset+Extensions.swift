//
//  EdgeInset+Extensions.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import SwiftUI

extension EdgeInsets {
    init(_ edges: Edge.Set = .all, _ length: CGFloat?) {
        let top: CGFloat = if edges.contains(.top) {
            length ?? 20
        } else {
            0
        }

        let leading: CGFloat = if edges.contains(.leading) {
            length ?? 20
        } else {
            0
        }

        let bottom: CGFloat = if edges.contains(.bottom) {
            length ?? 20
        } else {
            0
        }

        let trailing: CGFloat = if edges.contains(.trailing) {
            length ?? 20
        } else {
            0
        }

        self.init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}
