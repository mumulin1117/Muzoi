//
//  AppDelegate.swift
//  MuzioGlam
//
//  Created by MuzioGlam on 2026/8/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ glamApplication: UIApplication,
        didFinishLaunchingWithOptions glamLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let muzoiWindow = UIWindow(frame: UIScreen.main.bounds)
        if MuzoiGlamSessionStore.glamShared.glamIsSignedIn {
            muzoiWindow.rootViewController = MuzoiGlamMainTabController()
        } else {
            muzoiWindow.rootViewController = MuzoiGlamAuthEntryController()
        }
        muzoiWindow.makeKeyAndVisible()
        window = muzoiWindow

        return true
    }

    func glamShowMainCanvas(glamAnimated: Bool) {
        guard let window else { return }
        let glamMainCanvas = MuzoiGlamMainTabController()
        guard glamAnimated else {
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

    func glamShowAuthCanvas() {
        guard let window else { return }
        MuzoiGlamSessionStore.glamShared.glamSignOut()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: [.transitionCrossDissolve, .allowAnimatedContent],
            animations: { window.rootViewController = MuzoiGlamAuthEntryController() }
        )
    }
}
