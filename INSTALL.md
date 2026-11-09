# Installing Fingerly for iOS

## Swift Package Manager

In Xcode, choose **File > Add Package Dependencies**, enter
`https://github.com/fingerly-io/sdk-ios` and add the **Fingerly** library to your
app target.

In a `Package.swift`, depend on the package and name its product. The package's
identity comes from the URL, so it is `sdk-ios`:

```swift
.package(url: "https://github.com/fingerly-io/sdk-ios", from: "0.1.0")
```

```swift
.product(name: "Fingerly", package: "sdk-ios")
```

SwiftPM downloads the compiled framework and refuses it if it does not match the
checksum in this repository's `Package.swift`.

## What you get

A dynamic XCFramework with slices for iOS and tvOS devices and simulators. It is
embedded in your app for you, and its privacy manifest is inside it, so Xcode
includes it in your app's privacy report.

## Upgrading

Change the version, or let Xcode update the package. Every published version
stays available, and a published version never changes.

## Next

Follow the guide at <https://docs.fingerly.io/docs/sdks/ios> to make your first
identification.
