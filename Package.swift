// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SdkAntifraudSignifyd",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SdkAntifraudSignifyd",
            targets: ["SdkAntifraudSignifydWrapper", "SdkAntifraudSignifydTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/yuno-payments/yuno-sdk-ios.git", from: "3.2.0"),
        .package(url: "https://github.com/Signifyd-sdks/ios-sdk-dist.git", .upToNextMinor(from: "5.1.4"))
    ],
    targets: [
        .target(
            name: "SdkAntifraudSignifydWrapper",
            dependencies: [
                "SdkAntifraudSignifyd",
                .product(name: "ProfilingSdk", package: "ios-sdk-dist")
            ],
            path: "Sources/SdkAntifraudSignifydWrapper",
            publicHeadersPath: "include"
        ),
        .target(
            name: "SdkAntifraudSignifydTarget",
            path: "Sources/SdkAntifraudSignifydTarget"
        ),
        .binaryTarget(
            name: "SdkAntifraudSignifyd",
            url: "https://github.com/yuno-payments/yuno-sdk-ios-signifyd/releases/download/2.0.0/SdkAntifraudSignifyd.xcframework.zip",
            checksum: "347914db986af4aecee4e2014a93b443430d572c804435713311b7c1d1ae591d"
        )
    ]
)
