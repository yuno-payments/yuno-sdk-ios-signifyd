# YunoAntifraudSignifyd for iOS

Optional antifraud module for the [Yuno iOS SDK](https://github.com/yuno-payments/yuno-sdk-ios). It adds Signifyd device profiling to Yuno checkouts.

Add the package and the module registers itself when the app starts: the app makes no Signifyd call and writes no Signifyd code. When Signifyd is a fraud screening provider in your Yuno payment route, the Yuno SDK profiles the device during checkout and sends the session ID with the payment.

## Requirements

| | Version |
|---|---|
| iOS | 14.0+ |
| Xcode | 26.2+ |
| Yuno SDK (`YunoSDK`) | 2.30.0+, added through Swift Package Manager |
| Signifyd Profiling SDK | 5.1.x, from Signifyd's private repository |
| Signifyd SDK download token | Issued by your Signifyd solution engineer |

Swift Package Manager only. There is no CocoaPods distribution for this module.

The Yuno SDK must also come from Swift Package Manager. An app that gets `YunoSDK` from CocoaPods would load two copies of it, and the module would register in a copy that checkout does not use.

## Installation (Swift Package Manager)

This package declares two dependencies: the Yuno SDK and Signifyd's Profiling SDK. The Signifyd SDK is downloaded from Signifyd's private repository, `https://github.com/Signifyd-sdks/ios-sdk-dist.git`, so your build needs your Signifyd token.

### 1. Add your Signifyd token

Never commit the token, and never put it in `Package.swift` or in a package URL.

- **Xcode 26:** Xcode > Settings > **Source Control** > **+** > GitHub. Enter the GitHub account that owns the token and the token itself. On earlier Xcode versions the same option is under Settings > Accounts.
- **CI:** write the token to `~/.netrc` before the build and remove the file afterwards:

  ```
  machine github.com
    login x-access-token
    password <your-signifyd-token>
  ```

- **Command line, scoped to Signifyd only:** instead of `~/.netrc`, you can add a git rule that only applies to Signifyd's repositories, and build with `xcodebuild -scmProvider system`:

  ```bash
  git config --global url."https://x-access-token:<your-signifyd-token>@github.com/Signifyd-sdks/".insteadOf "https://github.com/Signifyd-sdks/"
  ```

### 2. Add the package

In Xcode, choose **File > Add Package Dependencies**, enter:

```
https://github.com/yuno-payments/yuno-sdk-ios-signifyd.git
```

and add the **YunoAntifraudSignifyd** product to your app target. Xcode resolves the Yuno SDK and the Signifyd SDK automatically.

In a `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yuno-payments/yuno-sdk-ios-signifyd.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "YunoAntifraudSignifyd", package: "yuno-sdk-ios-signifyd")
        ]
    )
]
```

### 3. Enable Signifyd in Yuno

Ask your Yuno account team to add Signifyd as a fraud screening provider in your payment route. Yuno's backend sends the profiling key to the module during checkout: your app never handles it.

## How it works

1. At app start, the module registers the Signifyd provider with the Yuno SDK.
2. During checkout, when Signifyd is in your payment route, the Yuno SDK calls the module.
3. The module profiles the device with the Signifyd SDK and returns the session ID it profiled under.
4. The Yuno SDK sends that session ID with the payment, and Yuno's backend forwards it to Signifyd with the order.

If profiling fails or takes longer than the checkout allows, the payment continues without the Signifyd fingerprint.

## License

`YunoAntifraudSignifyd` is released under the MIT license. See [LICENSE](LICENSE). The Signifyd Profiling SDK is distributed by Signifyd under its own terms and is not included in this repository.
