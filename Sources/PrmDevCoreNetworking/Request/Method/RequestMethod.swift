// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
internal import PrmDevCoreInterpolation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum RequestMethod: CustomStringConvertible {
  case delete
  case get
  case post(Post)

  public var description: String {
    switch self {
    case .delete, .get:
      httpMethod
    case let .post(payload):
      """
        \(httpMethod)
          \(multiline: payload, glue: "  ")
        """
    }
  }

  var contentType: ContentType? {
    switch self {
    case .delete, .get: nil
    case let .post(post): post.contentType
    }
  }

  var httpBody: Data? {
    get throws {
      switch self {
      case .delete, .get: nil
      case let .post(post): try post.httpBody
      }
    }
  }

  var httpMethod: String {
    switch self {
    case .delete: "DELETE"
    case .get: "GET"
    case .post: "POST"
    }
  }
}
