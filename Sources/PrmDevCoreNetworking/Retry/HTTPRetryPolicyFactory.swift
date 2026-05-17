// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum HTTPRetryPolicyFactory {
  public static let defaultProcessUrlResponse: DefaultHTTPRetryPolicy.ProcessURLResponse = {
    switch $0.statusCode {
    case HTTPStatusCodeGroup.successful.statusCodes: .success
    case HTTPStatusCodeGroup.serverError.statusCodes: .retry
    default: .failure
    }
  }
}
