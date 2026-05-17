// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

extension Collection {
  public var prm_single: Element {
    get throws(DescribedError) {
      guard let first, count == 1 else {
        throw DescribedError("Single element expected, got \(self)")
      }
      return first
    }
  }

  public var prm_singleOrNil: Element? {
    get throws(DescribedError) {
      isEmpty ? nil : try prm_single
    }
  }
}
