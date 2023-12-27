// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalAuthenticationKit",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LocalAuthenticationKit",
            targets: ["LocalAuthenticationKit"]),
    ],
    targets: [
        .target(
            name: "LocalAuthenticationKit"),
        .testTarget(
            name: "LocalAuthenticationKitTests",
            dependencies: ["LocalAuthenticationKit"]),
    ]
)
