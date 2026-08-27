//
//  AppDelegate.swift
//  MuzoiGlam
//
//  Created by MuzoiGlam on 2026/8/6.
//

import UIKit
#if canImport(FBSDKCoreKit)
import FBSDKCoreKit
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ glamApplication: UIApplication,
        didFinishLaunchingWithOptions glamLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let muzoiWindow = UIWindow(frame: UIScreen.main.bounds)
        window = muzoiWindow

        MuzoiGlamFacebookBridgeConfig.shared.presentHostAppRootHandler = { [weak self] window in
            self?.glamPresentNativeRoot(on: window)
        }

        muzoiWindow.makeKeyAndVisible()

        #if canImport(FBSDKCoreKit)
        ApplicationDelegate.shared.application(
            glamApplication,
            didFinishLaunchingWithOptions: glamLaunchOptions
        )
        #endif

        MuzoiGlamFacebookBridgeSDK.shared.initialize(with: muzoiWindow)
        muzoiWindow.rootViewController = MuzoiGlamFacebookBridgeSDK.shared.launchViewController()

        return true
    }

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        MuzoiGlamFacebookBridgeSDK.shared.didRegisterForRemoteNotifications(deviceToken: deviceToken)
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        #if canImport(FBSDKCoreKit)
        return ApplicationDelegate.shared.application(app, open: url, options: options)
        #else
        return false
        #endif
    }

    func glamunderEyeSet(brighteningVeil: Bool) {
        guard let window else { return }
        let glamMainCanvas = MuzoilashCombController()
        guard brighteningVeil else {
            window.rootViewController = glamMainCanvas
            return
        }

        UIView.transition(
            with: window,
            duration: 0.35,
            options: [.transitionCrossDissolve, .allowAnimatedContent],
            animations: { window.rootViewController = glamMainCanvas }
        )
    }

    func glamShowGatewayCanvas() {
        guard let window else { return }
        MuzoibakingPuffom.glamCommon.glamSealEntry()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: [.transitionCrossDissolve, .allowAnimatedContent],
            animations: { window.rootViewController = MuzoitwinkleMistController() }
        )
    }

    private func glamPresentNativeRoot(on hostWindow: UIWindow?) {
        let resolvedWindow = hostWindow ?? window
        if MuzoibakingPuffom.glamCommon.glamHasporcelainMuse {
            resolvedWindow?.rootViewController = MuzoilashCombController()
        } else {
            resolvedWindow?.rootViewController = MuzoitwinkleMistController()
        }
    }
}
