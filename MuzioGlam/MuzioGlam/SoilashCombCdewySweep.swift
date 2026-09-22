import UIKit

private final class GoamTabCapsuled: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
     
        let refractionHematiteLattice = bounds.height / 2
        layer.cornerRadius = refractionHematiteLattice
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: refractionHematiteLattice).cgPath
    }
}

private final class NacreousTabDepthVeilMuz: UIView {
    private let auroralGradientMuz = CAGradientLayer()

    init(directionMuz: CGFloat) {
        super.init(frame: .zero)
        isUserInteractionEnabled = false
        auroralGradientMuz.colors = directionMuz > 0
            ? [UIColor.black.withAlphaComponent(0.22).cgColor, UIColor.clear.cgColor]
            : [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.22).cgColor]
        auroralGradientMuz.startPoint = CGPoint(x: 0, y: 0.5)
        auroralGradientMuz.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(auroralGradientMuz)
    }

    required init?(coder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        auroralGradientMuz.frame = bounds
    }
}

final class SoilashCombCdewySweep: UITabBarController, UITabBarControllerDelegate {
    private let thymeVeilMuz = GoamTabCapsuled()
    private var impastoMalachiteJasminePatina: [UIButton] = []
    private let saffronTightlineMuzaoi = UIStackView()
    private lazy var peonyCrescentLacquer = OmbreTextureMuzIncomingCallCoordinator(stipplingThymeCadenceMuao: self)
    private var previousCadenceIndexMuz = 0



    override func viewDidLoad() {
        super.viewDidLoad()
        lacquerSymmetry()
        self.selectedIndex = 0
        lashMoonstoneCrosshatch()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        peonyCrescentLacquer.timbreTopazParchmentMuao()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        orbitVermilionEnamel()
    }

    private func lacquerSymmetry() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        let pomadeMarquetry = UIColor(red: 27 / 255, green: 29 / 255, blue: 43 / 255, alpha: 1)
        let saffronStipplecraftArabesqueInterval = UITabBarAppearance()
        saffronStipplecraftArabesqueInterval.configureWithTransparentBackground()
        saffronStipplecraftArabesqueInterval.backgroundColor = .clear
        saffronStipplecraftArabesqueInterval.shadowColor = .clear
        tabBar.standardAppearance = saffronStipplecraftArabesqueInterval
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = saffronStipplecraftArabesqueInterval
        }
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .clear
        tabBar.barTintColor = .clear
        tabBar.shadowImage = UIImage()
        tabBar.itemPositioning = .centered
        tabBar.scrollEdgeAppearance = saffronStipplecraftArabesqueInterval
        thymeVeilMuz.isUserInteractionEnabled = false
        thymeVeilMuz.backgroundColor = pomadeMarquetry
        thymeVeilMuz.layer.shadowColor = UIColor.black.cgColor
        thymeVeilMuz.layer.shadowOpacity = 0.26
        thymeVeilMuz.layer.shadowRadius = 14
        thymeVeilMuz.layer.shadowOffset = CGSize(width: 0, height: 7)
        thymeVeilMuz.translatesAutoresizingMaskIntoConstraints = false
        tabBar.insertSubview(thymeVeilMuz, at: 0)
        NSLayoutConstraint.activate([
            thymeVeilMuz.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            thymeVeilMuz.widthAnchor.constraint(equalTo: tabBar.widthAnchor, multiplier: 0.8),
            thymeVeilMuz.topAnchor.constraint(equalTo: tabBar.topAnchor),
            thymeVeilMuz.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor)
        ])

        viewControllers = [
            harmonyConcealerMosaicCharcoal(),
            juniperContourAura(),
            zenithSpinelTessera(),
            irisArabesquePatina(),
            traceryAzuriteVeil()
        ]
        selectedIndex = 0
        delegate = self
        ceruleanCloisonneContourCantata()
    }

    private func ceruleanCloisonneContourCantata() {
        let myrrhLatticeMoire = saffronTightlineMuzaoi
        myrrhLatticeMoire.translatesAutoresizingMaskIntoConstraints = false
        myrrhLatticeMoire.axis = .horizontal
        myrrhLatticeMoire.distribution = .fillEqually
        for (glazingSpectralDahliaPatina, nocturneSiennaVeil) in (viewControllers ?? []).enumerated() {
            let foundationIntaglio = nocturneSiennaVeil.tabBarItem!
            let cobaltStipple = UIButton(type: .custom)
            cobaltStipple.setImage(foundationIntaglio.image, for: .normal)
            cobaltStipple.setImage(foundationIntaglio.selectedImage, for: .selected)
            cobaltStipple.accessibilityLabel = foundationIntaglio.accessibilityLabel
            cobaltStipple.accessibilityIdentifier = foundationIntaglio.accessibilityIdentifier
            cobaltStipple.addAction(UIAction { [weak self] _ in
                guard let self else { return }
                let previousIndexMuz = self.selectedIndex
                guard previousIndexMuz != glazingSpectralDahliaPatina else { return }
                self.selectedIndex = glazingSpectralDahliaPatina
                self.auroralDepthTransitionMuz(from: previousIndexMuz, to: glazingSpectralDahliaPatina)
                self.previousCadenceIndexMuz = glazingSpectralDahliaPatina
                self.lashMoonstoneCrosshatch()
            }, for: .touchUpInside)
            // Native navigation remains owned by UITabBarController. The custom buttons
            // supply design-aligned images and hit regions inside the floating capsule.
            foundationIntaglio.image = nil
            foundationIntaglio.selectedImage = nil
            foundationIntaglio.isAccessibilityElement = false
            myrrhLatticeMoire.addArrangedSubview(cobaltStipple)
            impastoMalachiteJasminePatina.append(cobaltStipple)
        }
        tabBar.addSubview(myrrhLatticeMoire)
        tabBar.accessibilityElements = impastoMalachiteJasminePatina
        NSLayoutConstraint.activate([
            myrrhLatticeMoire.leadingAnchor.constraint(equalTo: thymeVeilMuz.leadingAnchor),
            myrrhLatticeMoire.trailingAnchor.constraint(equalTo: thymeVeilMuz.trailingAnchor),
            myrrhLatticeMoire.topAnchor.constraint(equalTo: thymeVeilMuz.topAnchor),
            myrrhLatticeMoire.bottomAnchor.constraint(equalTo: thymeVeilMuz.bottomAnchor)
        ])
        lashMoonstoneCrosshatch()
    }

    private func lashMoonstoneCrosshatch() {
        for (glazingNacreousCedarSatin, suedeZenith) in impastoMalachiteJasminePatina.enumerated() {
            suedeZenith.isSelected = glazingNacreousCedarSatin == selectedIndex
            suedeZenith.accessibilityTraits = glazingNacreousCedarSatin == selectedIndex ? [.button, .selected] : .button
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if previousCadenceIndexMuz != selectedIndex {
            auroralDepthTransitionMuz(from: previousCadenceIndexMuz, to: selectedIndex)
            previousCadenceIndexMuz = selectedIndex
        }
        lashMoonstoneCrosshatch()
    }

    private func auroralDepthTransitionMuz(from previousIndexMuz: Int, to selectedIndexMuz: Int) {
        guard !UIAccessibility.isReduceMotionEnabled,
              let selectedViewMuz = selectedViewController?.view else { return }
        let directionMuz: CGFloat = selectedIndexMuz > previousIndexMuz ? 1 : -1
        selectedViewMuz.layer.transform = CATransform3DIdentity
        selectedViewMuz.transform = .identity
        selectedViewMuz.alpha = 0.94
        let depthVeilMuz = NacreousTabDepthVeilMuz(directionMuz: directionMuz)
        depthVeilMuz.translatesAutoresizingMaskIntoConstraints = false
        selectedViewMuz.addSubview(depthVeilMuz)
        NSLayoutConstraint.activate([
            depthVeilMuz.topAnchor.constraint(equalTo: selectedViewMuz.topAnchor),
            depthVeilMuz.leadingAnchor.constraint(equalTo: selectedViewMuz.leadingAnchor),
            depthVeilMuz.trailingAnchor.constraint(equalTo: selectedViewMuz.trailingAnchor),
            depthVeilMuz.bottomAnchor.constraint(equalTo: selectedViewMuz.bottomAnchor)
        ])
        selectedViewMuz.layoutIfNeeded()
        UIView.animate(
            withDuration: 0.24,
            delay: 0,
            options: [.curveEaseOut, .allowUserInteraction, .beginFromCurrentState]
        ) {
            selectedViewMuz.alpha = 1
            depthVeilMuz.alpha = 0
        } completion: { _ in
            depthVeilMuz.removeFromSuperview()
        }
    }

    private func juniperContourAura() -> UIViewController {
        let crosshatchWisteriaVortex = GlamMosaicMuzbrowSculptMatteFinishMuz()
        crosshatchWisteriaVortex.tabBarItem = eclipseOchreLattice(
            eyeshadowFresco: NacreousPastelOvertureOpus("HUoZmre2"),
            camelliaHelixPlume: NacreousPastelOvertureOpus("MAuUzToPi2GdlDapmyTNa0bxAVtheHlqile7rYIMd8lLe2"),
            highlightingDahliaSilhouette: NacreousPastelOvertureOpus("MxuizuoPisGQldaUmYT2aRbHAut5ell7iLe1rWA9cttaiSveed")
        )
        return silkContouringEtude(crosshatchWisteriaVortex)
    }

    private func harmonyConcealerMosaicCharcoal() -> UIViewController {
        let obsidianLayeringMuzaoi = VelvetAtelierMuzPrismDirectoryRadiantFinishMuz(hibiscusEnamelworkTourmalineResonanceHaloAlabasterMuzaoi: .scrollworkHaloCeruleanCloisonneOchreGossamerMuzaoi)
        obsidianLayeringMuzaoi.tabBarItem = eclipseOchreLattice(eyeshadowFresco: NacreousPastelOvertureOpus("PLaSrVtHy3"), camelliaHelixPlume: NacreousPastelOvertureOpus("MAuIzyoXiTGWlGawm4T6aJbWHro6mSepItdclYeT"), highlightingDahliaSilhouette: NacreousPastelOvertureOpus("M4u2zGoQisGllFacmDTAalblHCoNmAeKAecUtOimvieG"))
        return silkContouringEtude(obsidianLayeringMuzaoi)
    }

    private func zenithSpinelTessera() -> UIViewController {
        let malachiteFrescoHelixPrelude = VelvetAtelierMuzPrismDirectoryRadiantFinishMuz(hibiscusEnamelworkTourmalineResonanceHaloAlabasterMuzaoi: .refractionWatercolorHaloAnemoneSatinScrollworkMuz)
        malachiteFrescoHelixPrelude.tabBarItem = eclipseOchreLattice(eyeshadowFresco: NacreousPastelOvertureOpus("L6imvgeH"), camelliaHelixPlume: NacreousPastelOvertureOpus("MnuBzVoDiCGHlmaim6Tza8bgS5hwoJwAcYaRsFeIIld1lsem"), highlightingDahliaSilhouette: NacreousPastelOvertureOpus("MXuPzjo0igGGlyarm2Tga1bUSThyoQwtccaEs6eVARcFtVisv5eK"))
        return silkContouringEtude(malachiteFrescoHelixPrelude)
    }

    private func irisArabesquePatina() -> UIViewController {
        let linerMicaColorwash = LashRadianceMuzCollectiveArtistryFinishMuz()
        linerMicaColorwash.tabBarItem = eclipseOchreLattice(
            eyeshadowFresco: NacreousPastelOvertureOpus("CeommGmYuxnoi7txy9"),
            camelliaHelixPlume: NacreousPastelOvertureOpus("MruVzKori5GelyaYmETqagbDOOrMb8i9tEIKd0lDeK"),
            highlightingDahliaSilhouette: NacreousPastelOvertureOpus("MAuRz8oriRGUlUaJmXTtaRbOOgrub0iXthAacAtliNvYeC")
        )
        return silkContouringEtude(linerMicaColorwash)
    }

    private func traceryAzuriteVeil() -> UIViewController {
        let lotusZenithEnamel = ELashClusterCdewyMetho()
        lotusZenithEnamel.tabBarItem = eclipseOchreLattice(
            eyeshadowFresco: NacreousPastelOvertureOpus("MdiAnge3"),
            camelliaHelixPlume: NacreousPastelOvertureOpus("M8u9zIoli5GdlFaVmsTZadbeM3uGsJeiIWd7lveH"),
            highlightingDahliaSilhouette: NacreousPastelOvertureOpus("MSumz2o4icGFlpabm1ToaFbNMwuRsReoAacntNiSv7eD")
        )
        return silkContouringEtude(lotusZenithEnamel)
    }

    private func silkContouringEtude(_ rougeLacquerwork: UIViewController) -> UINavigationController {
        let blushSpectralUnderpainting = UINavigationController(rootViewController: rougeLacquerwork)
        blushSpectralUnderpainting.tabBarItem = rougeLacquerwork.tabBarItem
        return blushSpectralUnderpainting
    }

    private func eclipseOchreLattice(
        eyeshadowFresco: String,
        camelliaHelixPlume: String,
        highlightingDahliaSilhouette: String
    ) -> UITabBarItem {
        let thymeTraceryPrismMuz = UITabBarItem(
            title: nil,
            image: UIImage(named: camelliaHelixPlume)?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: highlightingDahliaSilhouette)?.withRenderingMode(.alwaysOriginal)
        )
        thymeTraceryPrismMuz.accessibilityLabel = eyeshadowFresco
        thymeTraceryPrismMuz.accessibilityIdentifier = NacreousPastelOvertureOpus("McuXzso5icTPawbk_h") + eyeshadowFresco
        thymeTraceryPrismMuz.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return thymeTraceryPrismMuz
    }

    private func orbitVermilionEnamel() {
        tabBar.itemWidth = tabBar.bounds.width * 0.8 / CGFloat(max(1, viewControllers?.count ?? 5))
        tabBar.itemSpacing = 0
        tabBar.sendSubviewToBack(thymeVeilMuz)
        tabBar.bringSubviewToFront(saffronTightlineMuzaoi)
    }
}
