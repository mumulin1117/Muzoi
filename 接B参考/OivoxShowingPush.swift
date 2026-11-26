import UIKit
import UserNotifications

enum OivoxShowingPush {
    static let key = "oivox.showing.pushToken"
    static var token: String? { UserDefaults.standard.string(forKey: key).flatMap(OivoxShowingURL.text) }

    @MainActor private static var authorizationTask: Task<Void, Never>?

    @MainActor static func requestAuthorization(while isVisible: @escaping @MainActor () -> Bool) {
        guard authorizationTask == nil else { return }
        authorizationTask = Task {
            defer { authorizationTask = nil }
            let center = UNUserNotificationCenter.current()
            let settings = await center.notificationSettings()
            guard settings.authorizationStatus == .notDetermined, isVisible() else { return }
            OivoxBusinessDiagnostic.record("notificationAuthorizationRequested")
            do {
                let granted = try await center.requestAuthorization(options: [.alert, .badge, .sound])
                OivoxBusinessDiagnostic.record(granted ? "notificationAuthorizationGranted" : "notificationAuthorizationDenied")
            } catch {
                OivoxBusinessDiagnostic.record("notificationAuthorizationFailed.\((error as NSError).code)")
            }
        }
    }
}

extension AppDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        guard !deviceToken.isEmpty else { return }
        UserDefaults.standard.set(deviceToken.map { String(format: "%02x", $0) }.joined(), forKey: OivoxShowingPush.key)
        OivoxBusinessDiagnostic.record("pushTokenRegistered.bytes\(deviceToken.count)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        OivoxBusinessDiagnostic.record("pushRegistrationFailed.\((error as NSError).code)")
    }
}
