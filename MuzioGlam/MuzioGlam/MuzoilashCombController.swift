import UIKit

final class MuzoilashCombController: UITabBarController {
    private let glamCapsule = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        glamArrangeGlamTabRunway()
        self.selectedIndex = 0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamAlignCapsule()
    }

    private func glamArrangeGlamTabRunway() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        let glamBarColor = UIColor(red: 20 / 255, green: 17 / 255, blue: 28 / 255, alpha: 1)
        let glamAppearance = UITabBarAppearance()
        glamAppearance.configureWithOpaqueBackground()
        glamAppearance.backgroundColor = glamBarColor
        glamAppearance.shadowColor = .clear
        tabBar.standardAppearance = glamAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = glamAppearance
        }
        tabBar.isTranslucent = false
        tabBar.backgroundColor = glamBarColor
        tabBar.barTintColor = glamBarColor
        tabBar.shadowImage = UIImage()
        tabBar.itemPositioning = .centered
        tabBar.scrollEdgeAppearance = glamAppearance
        glamCapsule.isUserInteractionEnabled = false
        glamCapsule.backgroundColor = glamBarColor
        glamCapsule.layer.shadowColor = UIColor.black.cgColor
        glamCapsule.layer.shadowOpacity = 0.26
        glamCapsule.layer.shadowRadius = 14
        glamCapsule.layer.shadowOffset = CGSize(width: 0, height: 7)
        tabBar.insertSubview(glamCapsule, at: 0)

        viewControllers = [
            glamCastHomeAtelier(),
            glamCastInspireLookbook(),
            glamCastGalleryRunway(),
            glamCastPersonalVanity()
        ]
        selectedIndex = 0
    }

    private func glamCastHomeAtelier() -> UIViewController {
        let glamController = MuzoibrowSculptController()
        glamController.tabBarItem = glamForgeTabCharm(
            glamLabel: MuzoiGlamVeil("HUoZmre2"),
            glamIdleRune: "MuzoiGlamTabHomeIdle",
            glamActiveRune: "MuzoiGlamTabHomeActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamCastInspireLookbook() -> UIViewController {
        let glamController = MuzoiGlamLookDeckController()
        glamController.tabBarItem = glamForgeTabCharm(
            glamLabel: MuzoiGlamVeil("DLi3sDcao5vRe8rs"),
            glamIdleRune: "MuzoiGlamTabShowcaseIdle",
            glamActiveRune: "MuzoiGlamTabShowcaseActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamCastGalleryRunway() -> UIViewController {
        let glamController = MuzoiGleamDustController()
        glamController.tabBarItem = glamForgeTabCharm(
            glamLabel: MuzoiGlamVeil("CeommGmYuxnoi7txy9"),
            glamIdleRune: "MuzoiGlamTabOrbitIdle",
            glamActiveRune: "MuzoiGlamTabOrbitActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamCastPersonalVanity() -> UIViewController {
        let glamController = MuzoLashClusterController()
        glamController.tabBarItem = glamForgeTabCharm(
            glamLabel: MuzoiGlamVeil("MdiAnge3"),
            glamIdleRune: "MuzoiGlamTabMuseIdle",
            glamActiveRune: "MuzoiGlamTabMuseActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamCastPlaceholderAtelier(
        glamTitle: String,
        glamIdleRune: String,
        glamActiveRune: String
    ) -> UIViewController {
        let glamController = UIViewController()
        glamController.view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamController.title = glamTitle
        glamController.tabBarItem = glamForgeTabCharm(
            glamLabel: glamTitle,
            glamIdleRune: glamIdleRune,
            glamActiveRune: glamActiveRune
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamForgeTabCharm(
        glamLabel: String,
        glamIdleRune: String,
        glamActiveRune: String
    ) -> UITabBarItem {
        let glamItem = UITabBarItem(
            title: nil,
            image: UIImage(named: glamIdleRune)?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: glamActiveRune)?.withRenderingMode(.alwaysOriginal)
        )
        glamItem.accessibilityLabel = glamLabel
        glamItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return glamItem
    }

    private func glamAlignCapsule() {
        let glamSafeFloor = tabBar.safeAreaInsets.bottom
        let glamIconBandHeight = tabBar.bounds.height - glamSafeFloor
        let glamSideInset = max(24, min(36, tabBar.bounds.width * 0.096))
        let glamCapsuleHeight = min(58, max(48, glamIconBandHeight - 4))
        glamCapsule.frame = CGRect(
            x: glamSideInset,
            y: max(0, (glamIconBandHeight - glamCapsuleHeight) / 2),
            width: tabBar.bounds.width - (glamSideInset * 2),
            height: glamCapsuleHeight
        )
        glamCapsule.layer.cornerRadius = glamCapsuleHeight / 2
        tabBar.itemWidth = glamCapsule.bounds.width / 4
        tabBar.itemSpacing = 0
        tabBar.sendSubviewToBack(glamCapsule)
    }
}
