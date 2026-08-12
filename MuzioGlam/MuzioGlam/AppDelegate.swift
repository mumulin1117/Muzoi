//
//  AppDelegate.swift
//  MuzoiGlam
//
//  Created by MuzoiGlam on 2026/8/6.
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
        if MuzoibakingPuffom.glamCommon.glamHasporcelainMuse {
            muzoiWindow.rootViewController = MuzoilashCombController()
        } else {
            muzoiWindow.rootViewController = MuzoitwinkleMistController()
        }
        muzoiWindow.makeKeyAndVisible()
        window = muzoiWindow

        return true
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
}
