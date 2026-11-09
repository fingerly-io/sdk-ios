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
            checksum: "c792d46d43ed21d67b7cca8731f616bfe1f7296a7a161ddaad1358b38ba096cf"
        ),
    ]
)
