// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

extension FileManager {
  /// better use URL's prm_extensions for checks - they can be cached better
  public func prm_fileExistance(at url: URL) -> PathExistance {
    var isDirectory: ObjCBool = true
    let exists = fileExists(atPath: url.path(percentEncoded: false), isDirectory: &isDirectory)
    return exists
      ? .exist(isDirectory: isDirectory.boolValue)
      : .unavailable
  }
}
