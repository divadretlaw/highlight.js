//
//  Theme.swift
//  Highlight.js
//
//  Created by David Walter on 19.04.25.
//

import Foundation

public struct Theme {
    private let text: String
    private let background: String

    private let keyword: Attribute?
    private let string: Attribute?
    private let comment: Attribute?
    private let number: Attribute?
    private let literal: Attribute?
    private let builtIn: Attribute?
    private let type: Attribute?
    private let className: Attribute?
    private let function: Attribute?
    private let title: Attribute?
    private let params: Attribute?
    private let attribute: Attribute?
    private let variable: Attribute?
    private let meta: Attribute?
    private let section: Attribute?
    private let tag: Attribute?
    private let name: Attribute?
    private let selectorId: Attribute?
    private let selectorClass: Attribute?
    private let emphasis: Attribute?
    private let strong: Attribute?

    init(
        text: String,
        background: String,
        keyword: Attribute? = nil,
        string: Attribute? = nil,
        comment: Attribute? = nil,
        number: Attribute? = nil,
        literal: Attribute? = nil,
        builtIn: Attribute? = nil,
        type: Attribute? = nil,
        className: Attribute? = nil,
        function: Attribute? = nil,
        title: Attribute? = nil,
        params: Attribute? = nil,
        attribute: Attribute? = nil,
        variable: Attribute? = nil,
        meta: Attribute? = nil,
        section: Attribute? = nil,
        tag: Attribute? = nil,
        name: Attribute? = nil,
        selectorId: Attribute? = nil,
        selectorClass: Attribute? = nil,
        emphasis: Attribute? = nil,
        strong: Attribute? = nil
    ) {
        self.text = text
        self.background = background

        self.keyword = keyword
        self.string = string
        self.comment = comment
        self.number = number
        self.literal = literal
        self.builtIn = builtIn
        self.type = type
        self.className = className
        self.function = function
        self.title = title
        self.params = params
        self.attribute = attribute
        self.variable = variable
        self.meta = meta
        self.section = section
        self.tag = tag
        self.name = name
        self.selectorId = selectorId
        self.selectorClass = selectorClass
        self.emphasis = emphasis
        self.strong = strong
    }

    func generate() -> String {
        """
        pre code.hljs{display:block;overflow-x:auto;padding:1em}
        code.hljs{padding:3px 5px}
        pre code.hljs{display:block;overflow-x:auto;padding:1em}
        code.hljs{padding:3px 5px}
        .hljs {
            color: \(text);
            background: \(background);
        }
        \(keyword.generate(for: ".hljs-keyword"))
        \(string.generate(for: ".hljs-string"))
        \(comment.generate(for: ".hljs-comment"))
        \(number.generate(for: ".hljs-number"))
        \(literal.generate(for: ".hljs-literal"))
        \(builtIn.generate(for: ".hljs-built_in"))
        \(type.generate(for: ".hljs-type"))
        \(className.generate(for: ".hljs-class"))
        \(function.generate(for: ".hljs-function"))
        \(title.generate(for: ".hljs-title"))
        \(params.generate(for: ".hljs-params"))
        \(attribute.generate(for: ".hljs-attribute"))
        \(variable.generate(for: ".hljs-variable"))
        \(meta.generate(for: ".hljs-meta"))
        \(section.generate(for: ".hljs-section"))
        \(tag.generate(for: ".hljs-tag"))
        \(name.generate(for: ".hljs-name"))
        \(selectorId.generate(for: ".hljs-selector-id"))
        \(selectorClass.generate(for: ".hljs-selector-class"))
        \(emphasis.generate(for: ".hljs-emphasis"))
        \(strong.generate(for: ".hljs-strong"))
        """
    }
}
