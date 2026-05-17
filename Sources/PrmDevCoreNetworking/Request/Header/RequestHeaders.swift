// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct RequestHeaders: Sendable {
  @_spi(Testing)
  public var contents: [String: String]

  public var description: String {
    contents
      .prm_sorted(by: \.key)
      .map { key, value in
        "\(key): \(value)"
      }.joined(separator: "\n")
  }

  public init(_ contents: [String : String] = [:]) {
    self.contents = contents
  }

  public func modifying(name: String, value: String) -> Self {
    var copy = self
    copy.contents[name] = value
    return copy
  }

  public func applyingBearerAuth(token: String) -> Self {
    modifying(name: Self.authName, value: "Bearer \(token)")
  }

  public func applyingOAuth(token: String) -> Self {
    modifying(name: Self.authName, value: "OAuth \(token)")
  }

  private static let authName = "Authorization"
}
