// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import PrmDevCoreNetworking
import Testing

struct JSONTests {
  @Test func decoding() async throws {
    let payload = try JSONDecoder().decode(JSONValue.self, from: testJSON.data(using: .utf8)!)

    let compared = JSONValue.object([
      "foo": [
        .number(int: 1),
        .bool(true),
        .bool(false),
        .string("1231"),
        .null,
        .number(float: 15.31),
        .number(float: 182),
        .object([
          "bar": .array([
            .number(int: 1),
            .number(float: 0),
            .number(float: 4.0),
          ]),
          "baz": .object([
            "a": .string("b"),
            "c": .null
          ]),
        ])
      ],
      "bar": [ .null, .null, .null, ],
    ])

    #expect(payload == compared)
  }

  @Test func description() async throws {
    let payload = try JSONDecoder().decode(JSONValue.self, from: testJSON.data(using: .utf8)!)

    let compared = """
      {
       bar: [
        null
        null
        null
       ]
       foo: [
        1
        true
        false
        "1231"
        null
        15.31
        182
        {
         bar: [
          1
          0
          4
         ]
         baz: {
          a: "b"
          c: null
         }
        }
       ]
      }
      """

    let payloadLines = payload.description.split(separator: "\n")
    let comparedLines = compared.split(separator: "\n")
    for (i, (payloadLine, compareLine)) in zip(payloadLines, comparedLines).enumerated() {
      #expect(payloadLine == compareLine, "at \(i)")
    }

    #expect(payload.description == compared)
  }

  private let testJSON = """
    {
      "foo": [
        1,
        true,
        false,
        "1231",
        null,
        15.31,
        182,
        {
          "baz": {
            "a": "b",
            "c": null
          },
          "bar": [ 1, 0, 4 ]
        } 
      ],
      "bar": [ null, null, null ]
    }
    """
}
