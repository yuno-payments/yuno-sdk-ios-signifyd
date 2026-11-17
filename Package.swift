// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "YunoAntifraudSignifyd",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "YunoAntifraudSignifyd",
            targets: ["YunoAntifraudSignifydWrapper", "YunoAntifraudSignifydTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/yuno-payments/yuno-sdk-ios.git", from: "2.31.0"),
        .package(url: "https://github.com/Signifyd-sdks/ios-sdk-dist.git", .upToNextMinor(from: "5.1.4"))
    ],
    targets: [
        .target(
            name: "YunoAntifraudSignifydWrapper",
            dependencies: [
                "YunoAntifraudSignifyd",
                .product(name: "ProfilingSdk", package: "ios-sdk-dist")
            ],
            path: "Sources/YunoAntifraudSignifydWrapper",
            publicHeadersPath: "include"
        ),
        .target(
            name: "YunoAntifraudSignifydTarget",
            path: "Sources/YunoAntifraudSignifydTarget"
        ),
        .binaryTarget(
            name: "YunoAntifraudSignifyd",
            url: "https://github.com/yuno-payments/yuno-sdk-ios-signifyd/releases/download/1.1.0/YunoAntifraudSignifyd.xcframework.zip",
            checksum: "310ffcc5953d338ceb96274571d6ea0662b1b4b81ac79f400a97982d5fbb8591"
        )
    ]
)
