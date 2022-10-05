// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Teapot",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Teapot",
            targets: ["Teapot"]
        ),
        .library(
            name: "SwiftTea",
            targets: ["SwiftTea"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/vapor/vapor", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Teapot",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .target(
            name: "SwiftTea",
            dependencies: []
        ),
        .testTarget(
            name: "TeapotTests",
            dependencies: [
                "Teapot",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SwiftTeaTests",
            dependencies: ["SwiftTea"]
        )
    ]
)
