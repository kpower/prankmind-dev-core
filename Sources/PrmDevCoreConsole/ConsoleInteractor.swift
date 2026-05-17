// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

public struct ConsoleInteractor: Sendable {
  public var category: String

  public init(category: String = ">") {
    self.category = category
  }

  public func readBool(message: String = "Apply changes?") -> Bool {
    readFormatted(
      beforeRead: {
        out("Apply changes? Y/n ", params: .inline)
      }, transform: {
        switch $0 {
        case "y": true
        case "n": false
        default: nil
        }
      }
    )
  }

  public func readFormatted<T>(
    prepare: ConsoleStringTransform = ConsoleStringTransform()
      .trim(.illegalCharacters)
      .trim(.symbols)
      .trim(.whitespacesAndNewlines)
      .lowercase(),
    beforeRead: () -> Void,
    transform: (String) -> T? = { $0 }
  ) -> T {
    while true {
      beforeRead()

      let input = readLine().map(prepare.process(string:)) ?? ""
      guard let result = transform(input) else { continue }

      return result
    }
  }

  /// Print message to console (not depending on log level)
  public func out(_ message: String, params: ConsoleOutParams = ConsoleOutParams()) {
    let msg = params.trim ? message.trimmingCharacters(in: .whitespacesAndNewlines) : message
    guard !msg.isEmpty || !params.skipEmpty else { return }

    print(category.isEmpty ? msg : "[" + category + "] " + msg, terminator: params.terminator)
  }

  /// Print empty line to console
  public func outEmptyLine() {
    out("", params: ConsoleOutParams(skipEmpty: false))
  }

  public func makeNested(subcategory: String) -> Self {
    Self(category: category.isEmpty ? subcategory : category + "." + subcategory)
  }
}
