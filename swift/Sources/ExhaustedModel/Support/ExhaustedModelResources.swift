import Foundation

/// Resolves SwiftPM resources in both execution modes:
/// - packaged app: Contents/Resources/ExhaustedModel_ExhaustedModel.bundle
/// - direct SwiftPM executable/tests: generated Bundle.module location
enum ExhaustedModelResources {
    static let bundle: Bundle = {
        if let resourceURL = Bundle.main.resourceURL,
           let packagedBundle = Bundle(
               url: resourceURL.appendingPathComponent("ExhaustedModel_ExhaustedModel.bundle", isDirectory: true)
           )
        {
            return packagedBundle
        }
        return Bundle.module
    }()
}
