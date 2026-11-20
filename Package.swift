// swift-tools-version: 5.9
//
// The package customers depend on. It carries no source: the one target is the
// compiled framework, and the checksum makes SwiftPM refuse a download that is
// not byte for byte the published file.

import PackageDescription

let package = Package(
    name: "Fingerly",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "Fingerly", targets: ["Fingerly"]),
    ],
    targets: [
        .binaryTarget(
            name: "Fingerly",
            url: "https://maven.fingerly.io/ios/Fingerly-0.4.1.xcframework.zip",
            checksum: "74bb15a4b72b55524f4d2cb8567037c7f76088747bb5c866dfee61eb5f7d056e"
        ),
    ]
)
