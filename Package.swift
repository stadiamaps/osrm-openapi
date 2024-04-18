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
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.16.0")
    ],
    targets: [
        .target(
            name: "OSRM",
            dependencies: [
                "AnyCodable"
            ],
            path: "apple/Sources/OSRM"
        ),
        .testTarget(
            name: "OSRMTests",
            dependencies: [
                "OSRM",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            path: "apple/Tests/OSRM",
            resources: [
                .copy("TestData")
            ]
        ),
    ]
)
