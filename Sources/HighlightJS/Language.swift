//
//  Language.swift
//  Highlight.js
//
//  Created by David Walter on 18.04.25.
//

import Foundation

/// List of supported languages
public enum Language: String, Identifiable, Hashable, Equatable, CaseIterable, Sendable {
    case abnf = "abnf"
    case accesslog = "accesslog"
    case actionscript = "actionscript"
    case ada = "ada"
    case angelscript = "angelscript"
    case apache = "apache"
    case applescript = "applescript"
    case arcade = "arcade"
    case arduino = "arduino"
    case armasm = "armasm"
    case asciidoc = "asciidoc"
    case aspectj = "aspectj"
    case autohotkey = "autohotkey"
    case autoit = "autoit"
    case avrasm = "avrasm"
    case awk = "awk"
    case axapta = "axapta"
    case bash = "bash"
    case basic = "basic"
    case bnf = "bnf"
    case brainfuck = "brainfuck"
    case c = "c"
    case cal = "cal"
    case capnproto = "capnproto"
    case ceylon = "ceylon"
    case clean = "clean"
    case clojure = "clojure"
    case clojureRepl = "clojure-repl"
    case cmake = "cmake"
    case coffeescript = "coffeescript"
    case coq = "coq"
    case cos = "cos"
    case cpp = "cpp"
    case crmsh = "crmsh"
    case crystal = "crystal"
    case csharp = "csharp"
    case csp = "csp"
    case css = "css"
    case d = "d"
    case dart = "dart"
    case delphi = "delphi"
    case diff = "diff"
    case django = "django"
    case dns = "dns"
    case dockerfile = "dockerfile"
    case dos = "dos"
    case dsconfig = "dsconfig"
    case dts = "dts"
    case dust = "dust"
    case ebnf = "ebnf"
    case elixir = "elixir"
    case elm = "elm"
    case erb = "erb"
    case erlang = "erlang"
    case erlangRepl = "erlang-repl"
    case excel = "excel"
    case fix = "fix"
    case flix = "flix"
    case fortran = "fortran"
    case fsharp = "fsharp"
    case gams = "gams"
    case gauss = "gauss"
    case gcode = "gcode"
    case gherkin = "gherkin"
    case glsl = "glsl"
    case gml = "gml"
    case go = "go"
    case golo = "golo"
    case gradle = "gradle"
    case graphql = "graphql"
    case groovy = "groovy"
    case haml = "haml"
    case handlebars = "handlebars"
    case haskell = "haskell"
    case haxe = "haxe"
    case hsp = "hsp"
    case http = "http"
    case hy = "hy"
    case inform7 = "inform7"
    case ini = "ini"
    case irpf90 = "irpf90"
    case isbl = "isbl"
    case java = "java"
    case javascript = "javascript"
    case jbossCli = "jboss-cli"
    case json = "json"
    case julia = "julia"
    case juliaRepl = "julia-repl"
    case kotlin = "kotlin"
    case lasso = "lasso"
    case latex = "latex"
    case ldif = "ldif"
    case leaf = "leaf"
    case less = "less"
    case lisp = "lisp"
    case livecodeserver = "livecodeserver"
    case livescript = "livescript"
    case llvm = "llvm"
    case lsl = "lsl"
    case lua = "lua"
    case makefile = "makefile"
    case markdown = "markdown"
    case mathematica = "mathematica"
    case matlab = "matlab"
    case maxima = "maxima"
    case mel = "mel"
    case mercury = "mercury"
    case mipsasm = "mipsasm"
    case mizar = "mizar"
    case mojolicious = "mojolicious"
    case monkey = "monkey"
    case moonscript = "moonscript"
    case n1ql = "n1ql"
    case nestedtext = "nestedtext"
    case nginx = "nginx"
    case nim = "nim"
    case nix = "nix"
    case nodeRepl = "node-repl"
    case nsis = "nsis"
    case objectivec = "objectivec"
    case ocaml = "ocaml"
    case openscad = "openscad"
    case oxygene = "oxygene"
    case parser3 = "parser3"
    case perl = "perl"
    case pf = "pf"
    case pgsql = "pgsql"
    case php = "php"
    case phpTemplate = "php-template"
    case plaintext = "plaintext"
    case pony = "pony"
    case powershell = "powershell"
    case processing = "processing"
    case profile = "profile"
    case prolog = "prolog"
    case properties = "properties"
    case protobuf = "protobuf"
    case puppet = "puppet"
    case purebasic = "purebasic"
    case python = "python"
    case pythonRepl = "python-repl"
    case q = "q"
    case qml = "qml"
    case r = "r"
    case reasonml = "reasonml"
    case rib = "rib"
    case roboconf = "roboconf"
    case routeros = "routeros"
    case rsl = "rsl"
    case ruby = "ruby"
    case ruleslanguage = "ruleslanguage"
    case rust = "rust"
    case sas = "sas"
    case scala = "scala"
    case scheme = "scheme"
    case scilab = "scilab"
    case scss = "scss"
    case shell = "shell"
    case smali = "smali"
    case smalltalk = "smalltalk"
    case sml = "sml"
    case sqf = "sqf"
    case sql = "sql"
    case stan = "stan"
    case stata = "stata"
    case step21 = "step21"
    case stylus = "stylus"
    case subunit = "subunit"
    case swift = "swift"
    case taggerscript = "taggerscript"
    case tap = "tap"
    case tcl = "tcl"
    case thrift = "thrift"
    case tp = "tp"
    case twig = "twig"
    case typescript = "typescript"
    case vala = "vala"
    case vbnet = "vbnet"
    case vbscript = "vbscript"
    case vbscriptHtml = "vbscript-html"
    case verilog = "verilog"
    case vhdl = "vhdl"
    case vim = "vim"
    case wasm = "wasm"
    case wren = "wren"
    case x86asm = "x86asm"
    case xl = "xl"
    case xml = "xml"
    case xquery = "xquery"
    case yaml = "yaml"
    case zephir = "zephir"
    case _1c = "1c"

    public init?(rawValue: String?) {
        if let rawValue, let value = Self(rawValue: rawValue) {
            self = value
        } else {
            return nil
        }
    }

    public init?(rawValue: String) {
        if let value = Self.allCases.first(where: { $0.rawValue == rawValue.lowercased() }) {
            self = value
        } else if let value = Self.allCases.first(where: { $0.aliases.contains(rawValue.lowercased()) }) {
            self = value
        } else {
            return nil
        }
    }

    var aliases: [String] {
        switch self {
        case .applescript:
            ["osascript"]
        case .objectivec:
            ["objc", "obj-c", "obj-c++", "objective-c++", "mm"]
        case .markdown:
            ["md", "mkdown", "mkd"]
        case .javascript:
            ["js", "jsx"]
        case .typescript:
            ["ts", "tsx"]
        case .c:
            ["h"]
        case .cpp:
            ["hpp", "c++", "h++", "cxx", "hxx"]
        case .csharp:
            ["cs"]
        case .bash:
            ["zsh", "sh"]
        case .shell:
            ["console"]
        case .dos:
            ["bat", "cmd"]
        case .ruby:
            ["rb"]
        case .rust:
            ["rs"]
        case .kotlin:
            ["kt"]
        case .protobuf:
            ["proto"]
        case .haskell:
            ["hs"]
        case .xml:
            ["html", "xhtml", "rss", "atom", "xjb", "xsd", "xsl", "plist", "svg"]
        case .plaintext:
            ["txt", "text"]
        default:
            []
        }
    }

    // MARK: - Identifiable

    public var id: String {
        rawValue
    }
}
