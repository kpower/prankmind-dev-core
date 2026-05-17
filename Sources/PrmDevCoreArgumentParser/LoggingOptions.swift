// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import ArgumentParser
import Foundation
import Logging
internal import PrmDevCoreGeneral

public struct LoggingOptions: ParsableArguments {
  @Option(help: "Logging level", transform: Logger.Level.make(rawValue:))
  public var logLevel = Self.logLevel

  public init() {}

  private static var logLevel: Logger.Level {
    #if DEBUG
    .debug
    #else
    .info
    #endif
  }
}

extension Logger.Level {
  fileprivate static func make(rawValue: RawValue) throws -> Self {
    guard let result = Self(rawValue: rawValue) else {
      throw DescribedError("Unknown log level: \(rawValue)")
    }
    return result
  }
}
