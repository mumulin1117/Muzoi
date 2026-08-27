import Security
import UIKit

@objc
final class MuzoiGlamFacebookBridgeKeychain: NSObject {
    private static var serviceName: String {
        (Bundle.main.bundleIdentifier ?? "com.muzoi.glam") + ".fbbridge"
    }

    private static let deviceIDAccount = serviceName + ".deviceID"
    private static let passwordAccount = serviceName + ".loginPassword"

    static func deviceID() -> String {
        if let savedID = load(account: deviceIDAccount) {
            return savedID
        }

        let newID = (UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString) + MuzoiGlamFacebookBridgeConfig.shared.appID
        save(value: newID, account: deviceIDAccount)
        return newID
    }

    static func saveLoginPassword(_ password: String) {
        save(value: password, account: passwordAccount)
    }

    static func loginPassword() -> String? {
        load(account: passwordAccount)
    }

    private static func load(account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard
            status == errSecSuccess,
            let data = result as? Data,
            let value = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return value
    }

    private static func save(value: String, account: String) {
        delete(account: account)
        guard let data = value.data(using: .utf8) else { return }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: account,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]

        SecItemAdd(query as CFDictionary, nil)
    }

    private static func delete(account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: account
        ]

        SecItemDelete(query as CFDictionary)
    }
}

