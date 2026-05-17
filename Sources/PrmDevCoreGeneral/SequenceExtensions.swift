// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

extension Sequence {
  public func prm_sorted(by keyPath: KeyPath<Element, some Comparable>) -> [Element] {
    sorted { lhs, rhs in
      lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
    }
  }

  public func prm_sorted(
    by keyPath1: KeyPath<Element, some Comparable>,
    then keyPath2: KeyPath<Element, some Comparable>
  ) -> [Element] {
    sorted { lhs, rhs in
      if lhs[keyPath: keyPath1] != rhs[keyPath: keyPath1] {
        lhs[keyPath: keyPath1] < rhs[keyPath: keyPath1]
      } else {
        lhs[keyPath: keyPath2] != rhs[keyPath: keyPath2]
      }
    }
  }

  public func prm_groupedBy<T: Hashable>(_ keyPath: KeyPath<Element, T>) -> [T: [Element]] {
    reduce(into: [T: [Element]]()) { accumulator, element in
      let key = element[keyPath: keyPath]
      accumulator[key, default: [Element]()]
        .append(element)
    }
  }
}
