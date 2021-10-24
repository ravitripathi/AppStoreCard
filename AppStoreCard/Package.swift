// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppStoreCard",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppStoreCard",
            targets: ["AppStoreCard"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppStoreCard",
            dependencies: []),
        .testTarget(
            name: "AppStoreCardTests",
            dependencies: ["AppStoreCard"]),
    ]
)
