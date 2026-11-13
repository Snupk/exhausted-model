// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ExhaustedModel",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "ExhaustedModel", targets: ["ExhaustedModel"])
    ],
    targets: [
        .executableTarget(
            name: "ExhaustedModel",
            path: "Sources/ExhaustedModel",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ExhaustedModelTests",
            dependencies: ["ExhaustedModel"],
            path: "Tests/ExhaustedModelTests"
        ),
    ]
)
