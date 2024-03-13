// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OSRM",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "OSRM",
            targets: ["OSRM"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.1"),
    ],
    targets: [
        .target(
            name: "OSRM",
            dependencies: [
                "AnyCodable"
            ],
            path: "apple/Sources/OSRM"
        )
    ]
)
