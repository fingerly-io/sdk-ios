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
            url: "https://maven.fingerly.io/ios/Fingerly-0.2.0.xcframework.zip",
            checksum: "af5be333b61f1e125fe8dbd9ce7ee32f616378bb62f5061c864e03dad7100ba5"
        ),
    ]
)
