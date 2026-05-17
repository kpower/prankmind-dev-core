// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

extension URL {
  /// Check if current path is directory or file
  /// - Throws: When path doesn't exist
  public func prm_checkPathIsDirectory() throws -> Bool {
    guard let isDirectory = try isDirectoryResourceValue() else {
      throw DescribedError("Can't fetch isDirectory resource value for '\(self)'")
    }
    return isDirectory
  }

  public func prm_pathExistance() -> PathExistance {
    if let isDirectory = try? isDirectoryResourceValue() {
      .exist(isDirectory: isDirectory)
    } else {
      .unavailable
    }
  }

  private func isDirectoryResourceValue() throws -> Bool? {
    try resourceValues(forKeys: [ .isDirectoryKey ]).isDirectory
  }
}
