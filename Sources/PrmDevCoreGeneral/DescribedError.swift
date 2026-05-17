// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

public struct DescribedError: CustomStringConvertible, Error {
  public var description: String

  public init(_ description: String) {
    self.description = description
  }
}
