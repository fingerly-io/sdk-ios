# Installing Fingerly for iOS

## Swift Package Manager

In Xcode, choose **File > Add Package Dependencies**, enter
`https://github.com/fingerly-io/sdk-ios` and add the **Fingerly** library to your
app target.

In a `Package.swift`, depend on the package and name its product. The package's
identity comes from the URL, so it is `sdk-ios`:

```swift
.package(url: "https://github.com/fingerly-io/sdk-ios", from: "0.2.0")
```

```swift
.product(name: "Fingerly", package: "sdk-ios")
```

SwiftPM downloads the compiled framework and refuses it if it does not match the
checksum in this repository's `Package.swift`.

## What you get

A dynamic XCFramework with slices for iOS and tvOS devices and simulators. It is
embedded in your app for you, and its privacy manifest is inside it, so Xcode
includes it in your app's privacy report. [PRIVACY.md](PRIVACY.md) has the App
Store privacy answers.

## Checking the signature

Releases are signed with Fingerly's Apple Distribution certificate once it is
in place. Select `Fingerly.xcframework` in Xcode's project navigator: the
inspector shows the team that signed it, and Xcode stops the build if a later
version is signed by anyone else. From a terminal:

```sh
codesign --verify --strict --verbose=2 Fingerly.xcframework
codesign --display --verbose=2 Fingerly.xcframework   # Authority= and TeamIdentifier=
```

## Upgrading

Change the version, or let Xcode update the package. Every published version
stays available, and a published version never changes.

## Next

Follow the guide at <https://docs.fingerly.io/docs/sdks/ios> to make your first
identification.
