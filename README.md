# Fingerly for iOS

Device intelligence and fraud signals for iOS and tvOS apps. This is a binary
distribution: the package here points at a compiled XCFramework and contains no
source code.

Requires iOS 13 or tvOS 13 or newer.

## Install

In Xcode, choose **File > Add Package Dependencies** and enter
`https://github.com/fingerly-io/sdk-ios`.

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/fingerly-io/sdk-ios", from: "0.1.0"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "Fingerly", package: "sdk-ios")]
    ),
]
```

See [INSTALL.md](INSTALL.md) for the details.

## Use

```swift
import Fingerly

// Only once you have consent or another lawful basis.
let fingerly = try await Fingerly.load(apiKey: "fly_pk_production_...", consent: .granted)
let result = try await fingerly.identify(tag: "checkout")

// Send result.requestId to your backend and decide there.
```

Use a publishable SDK key from the dashboard. Secret keys are refused.

## Documentation

Guides and the API reference are at <https://docs.fingerly.io/docs/sdks/ios>.

## Support

Email <support@fingerly.io>.

## Licence

The SDK is proprietary. Its use is governed by the terms in [LICENSE](LICENSE).
