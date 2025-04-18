//
//  Error.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

extension Highlight {
    /// Errors thrown by Highlight.js
    public enum Error: Swift.Error {
        /// Unable to properly load 'highlight.min.js'
        case notLoaded
        /// Highlight.js returned no value
        case valueNotFound
    }
}
