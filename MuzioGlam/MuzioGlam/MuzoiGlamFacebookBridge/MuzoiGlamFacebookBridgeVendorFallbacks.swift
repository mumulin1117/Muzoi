import Foundation
import UIKit


final class Settings {
    static let shared = Settings()
    var appID: String?
    var clientToken: String?
    var displayName: String?
    var isAutoLogAppEventsEnabled = false
}

final class ApplicationDelegate {
    static let shared = ApplicationDelegate()

    func initializeSDK() {}

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {}

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        false
    }
}

//final class AppEvents {
//    struct ParameterName: Hashable, ExpressibleByStringLiteral {
//        let rawValue: String
//
//        init(stringLiteral value: String) {
//            rawValue = value
//        }
//
//        init(_ rawValue: String) {
//            self.rawValue = rawValue
//        }
//    }
//
//    static let shared = AppEvents()
//
//    func logPurchase(amount: Double, currency: String, parameters: [ParameterName: Any]?) {}
//}


