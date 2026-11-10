// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "YunoAntifraudSignifyd",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "YunoAntifraudSignifyd",
            targets: ["YunoAntifraudSignifydWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/yuno-payments/yuno-sdk-ios.git", from: "2.30.0"),
        .package(url: "https://github.com/Signifyd-sdks/ios-sdk-dist.git", .upToNextMinor(from: "5.1.4"))
    ],
    targets: [
        .target(
            name: "YunoAntifraudSignifydWrapper",
            dependencies: [
                "YunoAntifraudSignifyd",
                .product(name: "YunoSDK", package: "yuno-sdk-ios"),
                .product(name: "ProfilingSdk", package: "ios-sdk-dist")
            ],
            path: "Sources/YunoAntifraudSignifydWrapper",
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "YunoAntifraudSignifyd",
            url: "https://github.com/yuno-payments/yuno-sdk-ios-signifyd/releases/download/1.0.0/YunoAntifraudSignifyd.xcframework.zip",
            checksum: "d5c1686a078c2f389cbdb78559b5060cadbaa9b5c9a4245b41b1c24148cc1a13"
        )
    ]
)
