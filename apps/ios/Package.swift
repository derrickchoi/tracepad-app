// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TracepadIOS",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "TracepadIOS", targets: ["TracepadIOS"])
    ],
    targets: [
        .target(name: "TracepadIOS")
    ]
)
