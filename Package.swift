// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KTCenterFlowLayout",
    products: [
        .library(
            name: "KTCenterFlowLayout",
            targets: ["KTCenterFlowLayout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KTCenterFlowLayout",
            path: "KTCenterFlowLayout"
        ),
    ]
)
