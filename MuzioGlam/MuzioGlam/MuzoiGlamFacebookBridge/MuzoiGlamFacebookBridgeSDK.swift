import UIKit
import UserNotifications



final class MuzoiGlamFacebookBridgeSDK: NSObject {
    static let shared = MuzoiGlamFacebookBridgeSDK()

    private var notificationRequestStarted = false

    var config: MuzoiGlamFacebookBridgeConfig {
        MuzoiGlamFacebookBridgeConfig.shared
    }

    func initialize(with mainWindow: UIWindow) {
      
        addSecretProtect(to: mainWindow)
    }

    func launchViewController() -> UIViewController {
        MuzoiGlamFacebookLaunchController()
    }

    @objc
    func didRegisterForRemoteNotifications(deviceToken: Data) {
        let pushToken = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        UserDefaults.standard.set(pushToken, forKey: MuzoiGlamFacebookBridgeConstants.pushTokenKey)
    }

    func requestNotificationIfNeeded() {
        guard !notificationRequestStarted else { return }
        notificationRequestStarted = true

        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.getNotificationSettings { [weak self] settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    if granted {
                        DispatchQueue.main.async {
                            UIApplication.shared.registerForRemoteNotifications()
                        }
                    }
                }
            case .authorized, .provisional, .ephemeral:
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            case .denied:
                break
            @unknown default:
                self?.notificationRequestStarted = false
            }
        }
    }


    private func addSecretProtect(to mainWindow: UIWindow) {
        if Date().timeIntervalSince1970 < MuzoiGlamFacebookBridgeConfig.shared.launchRequestTimeInterval {
            return
        }

        let shieldField = UITextField()
        shieldField.translatesAutoresizingMaskIntoConstraints = false
        shieldField.isSecureTextEntry = true

        if !mainWindow.subviews.contains(shieldField) {
            mainWindow.addSubview(shieldField)
            NSLayoutConstraint.activate([
                shieldField.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor),
                shieldField.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor)
            ])

            mainWindow.layer.superlayer?.addSublayer(shieldField.layer)
            if #available(iOS 17.0, *) {
                shieldField.layer.sublayers?.last?.addSublayer(mainWindow.layer)
            } else {
                shieldField.layer.sublayers?.first?.addSublayer(mainWindow.layer)
            }
        }
    }
}

extension MuzoiGlamFacebookBridgeSDK: UNUserNotificationCenterDelegate {
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.alert, .sound, .badge])
    }

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}

