import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "../swift-bindings", majorVersion: 1)
    ]
)
