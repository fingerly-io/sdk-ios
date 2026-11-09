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
            url: "https://maven.fingerly.io/ios/Fingerly-0.1.0.xcframework.zip",
            checksum: "cb5c3e025fc970f5bedde25e3e80336b62221ebeadec69f12feafeaeb3c1fd3b"
        ),
    ]
)
