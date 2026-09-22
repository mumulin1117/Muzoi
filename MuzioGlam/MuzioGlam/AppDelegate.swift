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
        window = muzoiWindow
        if TesseraCeruleanAtelierMuao.prismJasmineCadenceMuao {
            NotificationCenter.default.addObserver(self, selector: #selector(glamCoverSessionExpired), name: TesseraCeruleanAtelierMuao.camelliaPatinaSignalMuao, object: nil)
        }

        let session = CContourAccentbakingPuffom.glamCommon
        let pendingProfile = UserDefaults.standard.string(forKey: ConcealerCadenceMuzRegistrationProfileGradientFinishMuz.lashMoonstoneCrosshatch)
        if session.glamHasporcelainMuse, pendingProfile == nil || pendingProfile != session.glamivoryMisture {
            muzoiWindow.rootViewController = SoilashCombCdewySweep()
        } else {
            muzoiWindow.rootViewController = UINavigationController(rootViewController: VetRoutineGlamdewyFormula())
        }
        muzoiWindow.makeKeyAndVisible()

        if TesseraCeruleanAtelierMuao.prismJasmineCadenceMuao {
            LvetiGdewyPalettere.shared.start()
        }
        return true
    }

    func glamunderEyeSet(brighteningVeil: Bool) {
        guard let window else { return }
        let glamMainCanvas = SoilashCombCdewySweep()
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
        CContourAccentbakingPuffom.glamCommon.glamSealEntry()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: [.transitionCrossDissolve, .allowAnimatedContent],
            animations: { window.rootViewController = UINavigationController(rootViewController: VetRoutineGlamdewyFormula()) }
        )
    }

    @objc private func glamCoverSessionExpired() {
        glamShowGatewayCanvas()
    }
}
