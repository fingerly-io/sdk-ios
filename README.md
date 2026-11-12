<p align="center">
  <a href="https://fingerly.io">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/fingerly-io/.github/main/assets/logo-dark.svg">
      <img src="https://raw.githubusercontent.com/fingerly-io/.github/main/assets/logo-light.svg" alt="Fingerly" height="44">
    </picture>
  </a>
</p>

<p align="center"><b>Fingerly for iOS</b><br>Device intelligence and fraud signals for iOS and tvOS apps, from a Swift package that ships a compiled XCFramework.</p>

<p align="center">
  <a href="https://github.com/fingerly-io/sdk-ios/tags"><img src="https://img.shields.io/github/v/tag/fingerly-io/sdk-ios?style=flat-square&label=version" alt="Latest version"></a>
  <img src="https://img.shields.io/badge/iOS-13%2B-blue?style=flat-square" alt="iOS 13 or newer">
  <img src="https://img.shields.io/badge/tvOS-13%2B-blue?style=flat-square" alt="tvOS 13 or newer">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-Proprietary-lightgrey?style=flat-square" alt="Licence: proprietary"></a>
  <a href="https://docs.fingerly.io/docs/sdks/ios"><img src="https://img.shields.io/badge/docs-docs.fingerly.io-informational?style=flat-square" alt="Documentation"></a>
</p>

<p align="center"><img src="https://raw.githubusercontent.com/fingerly-io/.github/main/assets/banner.webp" alt="Fingerly" width="100%"></p>

## What is this

The Fingerly SDK for iOS and tvOS apps. It returns a request ID for each action you tag, such as a signup, a login or a checkout. Your backend uses that ID to read the result and decide. [Fingerly](https://fingerly.io) is a device intelligence API that helps you protect signups, logins and payments from fraud and abuse.

This is a binary distribution: the package here points at a compiled XCFramework and contains no source code.

## Getting started

1. **Get a key.** In the [Fingerly dashboard](https://dashboard.fingerly.io), open **Integration > SDK keys** and create a public key for your app. [How keys work](https://docs.fingerly.io/docs/api-keys).
2. **Install the package.** In Xcode, choose **File > Add Package Dependencies** and enter `https://github.com/fingerly-io/sdk-ios`. Or in `Package.swift`:

   ```swift
   dependencies: [
       .package(url: "https://github.com/fingerly-io/sdk-ios", from: "0.2.0"),
   ],
   targets: [
       .target(
           name: "YourApp",
           dependencies: [.product(name: "Fingerly", package: "sdk-ios")]
       ),
   ]
   ```

   See [INSTALL.md](INSTALL.md) for the details.

3. **Identify.**

   ```swift
   import Fingerly

   // Only once you have consent or another lawful basis.
   let fingerly = try await Fingerly.load(apiKey: "fly_pk_production_...", consent: .granted)
   let result = try await fingerly.identify(tag: "checkout")

   // Send result.requestId to your backend and decide there.
   ```

Use a publishable SDK key from the dashboard. Secret keys are refused.

## Requirements

iOS 13 or tvOS 13 or newer.

## Privacy

Nothing is collected until your app grants consent. The SDK reads no device configuration, no advertising or vendor identifier, and nothing outside your app's container; it never identifies the device from what it measures. Its privacy manifest ships inside the framework. [PRIVACY.md](PRIVACY.md) lists what is sent, the App Store privacy answers, text for your privacy policy and the `FingerlyPersistAcrossReinstall` option.

## Documentation

Guides and the API reference are at <https://docs.fingerly.io/docs/sdks/ios>.

## Help

Open an issue on this repository, or write to <support@fingerly.io>. Security issues: <security@fingerly.io>.

## Licence

The SDK is proprietary. Its use is governed by the terms in [LICENSE](LICENSE).
