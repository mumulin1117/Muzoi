import UIKit

//final class MuzoiGlamCapsuleBar: UITabBar {
//    override func sizeThatFits(_ glamCanvasSize: CGSize) -> CGSize {
//        var glamFittedSize = super.sizeThatFits(glamCanvasSize)
//        glamFittedSize.height = max(glamFittedSize.height, 64 + safeAreaInsets.bottom)
//        return glamFittedSize
//    }
//}

final class MuzoiGlamMainTabController: UITabBarController {
    private let glamCapsule = UIView()

//    init() {
//        super.init(nibName: nil, bundle: nil)
//        setValue(MuzoiGlamCapsuleBar(), forKey: "tabBar")
//    }
//
//    required init?(coder glamCoder: NSCoder) {
//        super.init(coder: glamCoder)
//        setValue(MuzoiGlamCapsuleBar(), forKey: "tabBar")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildTabs()
        self.selectedIndex = 0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamAlignCapsule()
    }

    private func glamBuildTabs() {
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
            glamMakeHomeCanvas(),
            glamMakeShowcaseCanvas(),
            glamMakeStreamCanvas(),
            glamMakeMineCanvas()
        ]
        selectedIndex = 0
    }

    private func glamMakeHomeCanvas() -> UIViewController {
        let glamController = MuzoiGlamHomeController()
        glamController.tabBarItem = glamMakeItem(
            glamLabel: "Home",
            glamIdleAsset: "MuzoiGlamTabHomeIdle",
            glamActiveAsset: "MuzoiGlamTabHomeActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamMakeShowcaseCanvas() -> UIViewController {
        let glamController = MuzoiGlamShowcaseController()
        glamController.tabBarItem = glamMakeItem(
            glamLabel: "Discover",
            glamIdleAsset: "MuzoiGlamTabShowcaseIdle",
            glamActiveAsset: "MuzoiGlamTabShowcaseActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamMakeStreamCanvas() -> UIViewController {
        let glamController = MuzoiGlamCanvasStreamController()
        glamController.tabBarItem = glamMakeItem(
            glamLabel: "Community",
            glamIdleAsset: "MuzoiGlamTabOrbitIdle",
            glamActiveAsset: "MuzoiGlamTabOrbitActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamMakeMineCanvas() -> UIViewController {
        let glamController = MuzoiGlamMineController()
        glamController.tabBarItem = glamMakeItem(
            glamLabel: "Mine",
            glamIdleAsset: "MuzoiGlamTabMuseIdle",
            glamActiveAsset: "MuzoiGlamTabMuseActive"
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamMakeCanvas(
        glamTitle: String,
        glamIdleAsset: String,
        glamActiveAsset: String
    ) -> UIViewController {
        let glamController = UIViewController()
        glamController.view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamController.title = glamTitle
        glamController.tabBarItem = glamMakeItem(
            glamLabel: glamTitle,
            glamIdleAsset: glamIdleAsset,
            glamActiveAsset: glamActiveAsset
        )
        return UINavigationController(rootViewController: glamController)
    }

    private func glamMakeItem(
        glamLabel: String,
        glamIdleAsset: String,
        glamActiveAsset: String
    ) -> UITabBarItem {
        let glamItem = UITabBarItem(
            title: nil,
            image: UIImage(named: glamIdleAsset)?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: glamActiveAsset)?.withRenderingMode(.alwaysOriginal)
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
