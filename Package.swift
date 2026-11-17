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
            url: "https://maven.fingerly.io/ios/Fingerly-0.3.0.xcframework.zip",
            checksum: "b3288cc4539b6c5b8bae226854a586473b2457489e69b2ac1f26e9f84f6add27"
        ),
    ]
)
