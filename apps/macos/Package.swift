// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TracepadMac",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "TracepadMac", targets: ["TracepadMac"])
    ],
    targets: [
        .executableTarget(name: "TracepadMac")
    ]
)
