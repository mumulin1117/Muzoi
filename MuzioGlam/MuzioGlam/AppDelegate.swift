
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

        // Every cold launch is dispatched exclusively by the new Open contract.
        muzoiWindow.rootViewController = MuzoiGlamShowingCoordinator()
        muzoiWindow.makeKeyAndVisible()

        if TesseraCeruleanAtelierMuao.prismJasmineCadenceMuao {
            LvetiGdewyPalettere.chromaticPaletteMuzoi.beginGlamObservationMuzoi()
        }
        return true
    }

    func glamunderEyeSet(brighteningVeil: Bool) {
        guard let window else { return }
        let gateway = window.rootViewController as? MuzoiGlamShowingCoordinator
        let showMain = {
            gateway?.close()
            window.rootViewController = SoilashCombCdewySweep()
            window.layoutIfNeeded()
        }
        if brighteningVeil && !UIAccessibility.isReduceMotionEnabled {
            UIView.transition(with: window, duration: 0.30,
                              options: [.transitionCrossDissolve, .allowAnimatedContent], animations: showMain)
        } else { showMain() }
    }

    func glamShowGatewayCanvas() {
        guard let window else { return }
        CContourAccentbakingPuffom.glamCommon.glamSealEntry()
        if let gateway = window.rootViewController as? MuzoiGlamShowingCoordinator {
            gateway.signedOut()
        } else {
            let backdrop = window.rootViewController?.view.snapshotView(afterScreenUpdates: false)
            let gateway = MuzoiGlamShowingCoordinator(registration: true, backdrop: backdrop)
            UIView.transition(with: window, duration: 0.28, options: [.transitionCrossDissolve, .allowAnimatedContent]) {
                window.rootViewController = gateway
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        (window?.rootViewController as? MuzoiGlamShowingCoordinator)?.suspend()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        (window?.rootViewController as? MuzoiGlamShowingCoordinator)?.enterBackground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        (window?.rootViewController as? MuzoiGlamShowingCoordinator)?.resume()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        UserDefaults.standard.set(deviceToken.map { String(format: "%02x", $0) }.joined(), forKey: "muzoiGlam.gateway.pushToken")
    }

    @objc private func glamCoverSessionExpired() {
        glamShowGatewayCanvas()
    }
}
