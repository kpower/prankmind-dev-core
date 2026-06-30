// swift-tools-version: 6.2
// Copyright © 2026 PrankMind (Andrey Yakushev). All rights reserved.

import PackageDescription

let package = Package(
  name: "PrankMindDevCore",
  platforms: [
    .iOS(.v18),
    .macOS(.v15),
  ],
  products: [
    .library(name: "PrmDevCoreArgumentParser",  targets: [ "PrmDevCoreArgumentParser" ]),
    .library(name: "PrmDevCoreAsyncSequence",   targets: [ "PrmDevCoreAsyncSequence" ]),
    .library(name: "PrmDevCoreConsole",         targets: [ "PrmDevCoreConsole" ]),
    .library(name: "PrmDevCoreGeneral",         targets: [ "PrmDevCoreGeneral" ]),
    .library(name: "PrmDevCoreInterpolation",   targets: [ "PrmDevCoreInterpolation" ]),
    .library(name: "PrmDevCoreLogging",         targets: [ "PrmDevCoreLogging" ]),
    .library(name: "PrmDevCoreNetworking",      targets: [ "PrmDevCoreNetworking" ]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.8.2"),
    .package(url: "https://github.com/apple/swift-log", from: "1.14.0"),
  ],
  targets: [
    .target(name: "PrmDevCoreArgumentParser", dependencies: [
      .product(name: "ArgumentParser", package: "swift-argument-parser"),
      .product(name: "Logging", package: "swift-log"),
      "PrmDevCoreGeneral",
    ]),
    .target(name: "PrmDevCoreAsyncSequence"),
    .target(name: "PrmDevCoreConsole"),
    .target(name: "PrmDevCoreGeneral", dependencies: [ "PrmDevCoreInterpolation" ]),
    .target(name: "PrmDevCoreInterpolation"),
    .target(name: "PrmDevCoreLogging", dependencies: [
      .product(name: "Logging", package: "swift-log"),
    ]),
    .target(name: "PrmDevCoreNetworking", dependencies: [
      .product(name: "Logging", package: "swift-log"),
      "PrmDevCoreGeneral", "PrmDevCoreInterpolation",
    ]),

    .testTarget(name: "CoreAsyncSequenceTests", dependencies: [ "PrmDevCoreAsyncSequence" ]),
    .testTarget(name: "CoreGeneralTests",       dependencies: [ "PrmDevCoreGeneral" ]),
    .testTarget(name: "CoreInterpolationTests", dependencies: [ "PrmDevCoreGeneral", "PrmDevCoreInterpolation" ]),
    .testTarget(name: "CoreLoggingTests",       dependencies: [ "PrmDevCoreLogging" ]),
    .testTarget(name: "CoreNetworkingTests",    dependencies: [ "PrmDevCoreNetworking" ]),
  ]
)
