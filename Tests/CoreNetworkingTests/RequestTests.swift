// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import Testing
@_spi(Testing) import PrmDevCoreNetworking

struct RequestTests {
  @Test func endpoint() throws {
    let endpoint = RequestEndpoint(scheme: .https, host: "ya.ru", path: "/temp", queryItems: [
      .queryItem(name: "key_string", "value"),
      .queryItem(name: "key_int", 1),
      .queryItem(name: "key_bool", true)
    ])
    #expect(
      try endpoint.url.absoluteString == "https://ya.ru/temp?key_string=value&key_int=1&key_bool=true"
    )
  }

  @Test func headers() {
    var headers = RequestHeaders([
      "header0": "4",
      "header1": "1",
    ])
    var result = [ "header1": "1", "header0": "4" ]
    #expect(headers.contents == result)

    headers = headers.applyingBearerAuth(token: "bearer")
    result["Authorization"] = "Bearer bearer"
    #expect(headers.contents == result)

    headers = headers.applyingOAuth(token: "oauth")
    result["Authorization"] = "OAuth oauth"
    #expect(headers.contents == result)
  }
}
