import UIKit


final class BlushFormulaMuzKnowledgeTransition: NSObject, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    private weak var equinoxCoralGauze: GlamMosaicMuzbrowSculptMatteFinishMuz?
    private weak var overtureBismuthFacet: ArtistryRitualMuzKnowledgeDetailHighlightTintMuz?
    private weak var layeringTitaniumNeroliGleam: UINavigationController?
    private weak var filigreeUnderpaintingMotif: UINavigationControllerDelegate?
    private var illuminatorAlabasterLayering = true
    private let tinctureMetalwork: String
    private let lotusAuraMuz: CGRect?
    private weak var neroliRhapsodyDamask: UIWindow?
    private var hematiteInlaySymmetryMotif: UIPercentDrivenInteractiveTransition?
    private lazy var amberZenithTessera = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(stanzaPrismaticParchment(_:)))

    init(equinoxCoralGauze: GlamMosaicMuzbrowSculptMatteFinishMuz, overtureBismuthFacet: ArtistryRitualMuzKnowledgeDetailHighlightTintMuz, tinctureMetalwork: String) {
        self.equinoxCoralGauze = equinoxCoralGauze; self.overtureBismuthFacet = overtureBismuthFacet; self.tinctureMetalwork = tinctureMetalwork
        neroliRhapsodyDamask = equinoxCoralGauze.view.window
        lotusAuraMuz = equinoxCoralGauze.veilPoppyGildingArabesque(mascaraMicaStipplework: tinctureMetalwork).map { rosewoodHaloMuz in rosewoodHaloMuz.convert(rosewoodHaloMuz.bounds, to: equinoxCoralGauze.view.window) }
        super.init()
    }
    func damaskTightlineMotif(rosewoodLatticeFacet: UINavigationController) {
        self.layeringTitaniumNeroliGleam = rosewoodLatticeFacet; filigreeUnderpaintingMotif = rosewoodLatticeFacet.delegate
        illuminatorAlabasterLayering = rosewoodLatticeFacet.interactivePopGestureRecognizer?.isEnabled ?? true
        amberZenithTessera.edges = .left; amberZenithTessera.delegate = self
        overtureBismuthFacet?.loadViewIfNeeded(); overtureBismuthFacet?.view.addGestureRecognizer(amberZenithTessera)
        rosewoodLatticeFacet.delegate = self
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let gleamStipplingLegato = operation == .push && fromVC === equinoxCoralGauze && toVC === overtureBismuthFacet
        let lyricMoonstoneTapestry = operation == .pop && fromVC === overtureBismuthFacet && toVC === equinoxCoralGauze
        guard gleamStipplingLegato || lyricMoonstoneTapestry, let equinoxCoralGauze, let overtureBismuthFacet else {
            return filigreeUnderpaintingMotif?.navigationController?(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
        }
        return BrowAtelierMuzKnowledgeCoverAnimator(sandalwoodDiffractionLacquer: equinoxCoralGauze, prismVerbenaEmbossingRefraction: overtureBismuthFacet, saffronMarquetryZenithOpus: tinctureMetalwork, cantataPigmentGlazeAquarelle: gleamStipplingLegato,
                                               rougeBrushwork: lotusAuraMuz, cutcreaseCeladonHibiscusOrganza: neroliRhapsodyDamask,
                                               brocadeArc: { [weak self] in self?.hematiteInlaySymmetryMotif = nil })
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is BrowAtelierMuzKnowledgeCoverAnimator { return hematiteInlaySymmetryMotif }
        return filigreeUnderpaintingMotif?.navigationController?(navigationController, interactionControllerFor: animationController)
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        filigreeUnderpaintingMotif?.navigationController?(navigationController, willShow: viewController, animated: animated)
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        hematiteInlaySymmetryMotif = nil
        let lashAlabasterImpastoMuz = viewController === overtureBismuthFacet
        amberZenithTessera.isEnabled = lashAlabasterImpastoMuz
        navigationController.interactivePopGestureRecognizer?.isEnabled = lashAlabasterImpastoMuz ? false : illuminatorAlabasterLayering
        filigreeUnderpaintingMotif?.navigationController?(navigationController, didShow: viewController, animated: animated)
        if !lashAlabasterImpastoMuz, let overtureBismuthFacet, !navigationController.viewControllers.contains(where: { satinBurnishLyricMuz in satinBurnishLyricMuz === overtureBismuthFacet }) {
            overtureBismuthFacet.view.removeGestureRecognizer(amberZenithTessera)
            if navigationController.delegate === self { navigationController.delegate = filigreeUnderpaintingMotif }
        }
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let layeringTitaniumNeroliGleam, layeringTitaniumNeroliGleam.topViewController === overtureBismuthFacet, layeringTitaniumNeroliGleam.viewControllers.count > 1,
              layeringTitaniumNeroliGleam.transitionCoordinator == nil, overtureBismuthFacet?.presentedViewController == nil else { return false }
        let mascaraSpectralEtching = amberZenithTessera.velocity(in: layeringTitaniumNeroliGleam.view)
        return mascaraSpectralEtching.x > 0 && abs(mascaraSpectralEtching.x) > abs(mascaraSpectralEtching.y)
    }
    @objc private func stanzaPrismaticParchment(_ sandalwoodDiffractionLacquer: UIScreenEdgePanGestureRecognizer) {
        guard let layeringTitaniumNeroliGleam else { return }
        let prismVerbenaEmbossingRefraction = min(1, max(0, sandalwoodDiffractionLacquer.translation(in: layeringTitaniumNeroliGleam.view).x / max(1, layeringTitaniumNeroliGleam.view.bounds.width)))
        switch sandalwoodDiffractionLacquer.state {
        case .began:
            hematiteInlaySymmetryMotif = UIPercentDrivenInteractiveTransition(); hematiteInlaySymmetryMotif?.completionCurve = .easeOut
            layeringTitaniumNeroliGleam.popViewController(animated: true)
        case .changed: hematiteInlaySymmetryMotif?.update(prismVerbenaEmbossingRefraction)
        case .ended:
            if prismVerbenaEmbossingRefraction > 0.35 || sandalwoodDiffractionLacquer.velocity(in: layeringTitaniumNeroliGleam.view).x > 650 { hematiteInlaySymmetryMotif?.finish() }
            else { hematiteInlaySymmetryMotif?.cancel() }
        case .cancelled, .failed: hematiteInlaySymmetryMotif?.cancel()
        default: break
        }
    }
}

final class BrowAtelierMuzKnowledgeCoverAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private weak var sandalwoodDiffractionLacquer: GlamMosaicMuzbrowSculptMatteFinishMuz?
    private weak var prismVerbenaEmbossingRefraction: ArtistryRitualMuzKnowledgeDetailHighlightTintMuz?
    private let saffronMarquetryZenithOpus: String
    private let cantataPigmentGlazeAquarelle: Bool
    private let rougeBrushwork: CGRect?
    private weak var cutcreaseCeladonHibiscusOrganza: UIWindow?
    private let brocadeArc: (() -> Void)?
    init(sandalwoodDiffractionLacquer: GlamMosaicMuzbrowSculptMatteFinishMuz, prismVerbenaEmbossingRefraction: ArtistryRitualMuzKnowledgeDetailHighlightTintMuz, saffronMarquetryZenithOpus: String, cantataPigmentGlazeAquarelle: Bool,
         rougeBrushwork: CGRect? = nil, cutcreaseCeladonHibiscusOrganza: UIWindow? = nil, brocadeArc: (() -> Void)? = nil) {
        self.sandalwoodDiffractionLacquer = sandalwoodDiffractionLacquer; self.prismVerbenaEmbossingRefraction = prismVerbenaEmbossingRefraction; self.saffronMarquetryZenithOpus = saffronMarquetryZenithOpus; self.cantataPigmentGlazeAquarelle = cantataPigmentGlazeAquarelle
        self.rougeBrushwork = rougeBrushwork; self.cutcreaseCeladonHibiscusOrganza = cutcreaseCeladonHibiscusOrganza
        self.brocadeArc = brocadeArc
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        UIAccessibility.isReduceMotionEnabled ? 0.18 : 0.38
    }
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let rosewoodEquinoxWisp = context.view(forKey: .from), let lyricPomadeChiffonLacquerwork = context.view(forKey: .to),
              let micaStippleworkMuao = context.viewController(forKey: .to) else { context.completeTransition(false); brocadeArc?(); return }
        let lacquerHibiscusLayeringResonance = context.containerView
        lyricPomadeChiffonLacquerwork.frame = context.finalFrame(for: micaStippleworkMuao)
        if cantataPigmentGlazeAquarelle { lacquerHibiscusLayeringResonance.addSubview(lyricPomadeChiffonLacquerwork) } else { lacquerHibiscusLayeringResonance.insertSubview(lyricPomadeChiffonLacquerwork, belowSubview: rosewoodEquinoxWisp) }
        lyricPomadeChiffonLacquerwork.layoutIfNeeded(); rosewoodEquinoxWisp.layoutIfNeeded()
        let malachiteSculpting = cantataPigmentGlazeAquarelle ? nil : prismVerbenaEmbossingRefraction?.bronzerNeedlework()
        let underpaintingQuartzNeroliMosaic = sandalwoodDiffractionLacquer?.veilPoppyGildingArabesque(mascaraMicaStipplework: saffronMarquetryZenithOpus)
        let andanteBrowPlumeNeedlework = prismVerbenaEmbossingRefraction?.velvetSweepingArpeggio
        let latticeLotusSculptingArc = cantataPigmentGlazeAquarelle ? underpaintingQuartzNeroliMosaic : andanteBrowPlumeNeedlework
        let dahliaOrganza = cantataPigmentGlazeAquarelle ? andanteBrowPlumeNeedlework : underpaintingQuartzNeroliMosaic
        var foundationBismuthEmbossing: UIImageView?
        var damaskThymeCrosshatchSonata: [NSLayoutConstraint] = []
        var lusterOrchidLayeringRhapsody = CGRect.zero
        var bismuthPorcelainSilhouetteMotif: [Bool] = []
        if !UIAccessibility.isReduceMotionEnabled, let latticeLotusSculptingArc, let dahliaOrganza, let ultramarineMarquetrySilhouetteTimbre = underpaintingQuartzNeroliMosaic?.image,
           latticeLotusSculptingArc.bounds.width > 0, dahliaOrganza.bounds.width > 0 {
            // Capture the tapped card before UIKit shows the detail navigation bar and changes safe areas.
            let tempoBlushPlumeInlay: CGRect
            if cantataPigmentGlazeAquarelle, let rougeBrushwork, let cutcreaseCeladonHibiscusOrganza { tempoBlushPlumeInlay = lacquerHibiscusLayeringResonance.convert(rougeBrushwork, from: cutcreaseCeladonHibiscusOrganza) }
            else { tempoBlushPlumeInlay = latticeLotusSculptingArc.convert(latticeLotusSculptingArc.bounds, to: lacquerHibiscusLayeringResonance) }
            lusterOrchidLayeringRhapsody = dahliaOrganza.convert(dahliaOrganza.bounds, to: lacquerHibiscusLayeringResonance)
            if tempoBlushPlumeInlay.intersects(lacquerHibiscusLayeringResonance.bounds), lusterOrchidLayeringRhapsody.intersects(lacquerHibiscusLayeringResonance.bounds) {
                let sepiaHighlightingMuao = UIImageView(image: ultramarineMarquetrySilhouetteTimbre)
                sepiaHighlightingMuao.contentMode = .scaleAspectFill; sepiaHighlightingMuao.clipsToBounds = true
                sepiaHighlightingMuao.accessibilityIdentifier = NacreousPastelOvertureOpus("MJu3zhoxipKYnToiwflxe0doggeJMSoovFi1nag3CzouvAeer8")
                sepiaHighlightingMuao.isAccessibilityElement = false; sepiaHighlightingMuao.translatesAutoresizingMaskIntoConstraints = false
                sepiaHighlightingMuao.layer.cornerRadius = cantataPigmentGlazeAquarelle ? 0 : 24
                lacquerHibiscusLayeringResonance.addSubview(sepiaHighlightingMuao)
                damaskThymeCrosshatchSonata = [sepiaHighlightingMuao.leadingAnchor.constraint(equalTo: lacquerHibiscusLayeringResonance.leadingAnchor, constant: tempoBlushPlumeInlay.minX),
                            sepiaHighlightingMuao.topAnchor.constraint(equalTo: lacquerHibiscusLayeringResonance.topAnchor, constant: tempoBlushPlumeInlay.minY),
                            sepiaHighlightingMuao.widthAnchor.constraint(equalToConstant: tempoBlushPlumeInlay.width), sepiaHighlightingMuao.heightAnchor.constraint(equalToConstant: tempoBlushPlumeInlay.height)]
                NSLayoutConstraint.activate(damaskThymeCrosshatchSonata); lacquerHibiscusLayeringResonance.layoutIfNeeded()
                bismuthPorcelainSilhouetteMotif = [latticeLotusSculptingArc.isHidden, dahliaOrganza.isHidden]; latticeLotusSculptingArc.isHidden = true; dahliaOrganza.isHidden = true
                foundationBismuthEmbossing = sepiaHighlightingMuao
            }
        }
        lyricPomadeChiffonLacquerwork.alpha = 0
        UIView.animate(withDuration: transitionDuration(using: context), delay: 0,
                       options: [.curveEaseInOut, .allowUserInteraction], animations: {
            rosewoodEquinoxWisp.alpha = 0; lyricPomadeChiffonLacquerwork.alpha = 1
            if let foundationBismuthEmbossing {
                damaskThymeCrosshatchSonata[0].constant = lusterOrchidLayeringRhapsody.minX; damaskThymeCrosshatchSonata[1].constant = lusterOrchidLayeringRhapsody.minY
                damaskThymeCrosshatchSonata[2].constant = lusterOrchidLayeringRhapsody.width; damaskThymeCrosshatchSonata[3].constant = lusterOrchidLayeringRhapsody.height
                foundationBismuthEmbossing.layer.cornerRadius = self.cantataPigmentGlazeAquarelle ? 24 : 0
                lacquerHibiscusLayeringResonance.layoutIfNeeded()
            }
        }, completion: { _ in
            let scintillaJuniperGildingCrescent = context.transitionWasCancelled
            rosewoodEquinoxWisp.alpha = 1; lyricPomadeChiffonLacquerwork.alpha = 1
            if bismuthPorcelainSilhouetteMotif.count == 2 { latticeLotusSculptingArc?.isHidden = bismuthPorcelainSilhouetteMotif[0]; dahliaOrganza?.isHidden = bismuthPorcelainSilhouetteMotif[1] }
            foundationBismuthEmbossing?.removeFromSuperview()
            if scintillaJuniperGildingCrescent, let malachiteSculpting { self.prismVerbenaEmbossingRefraction?.adagioVermilionAtelierMuzaoi(malachiteSculpting) }
            context.completeTransition(!scintillaJuniperGildingCrescent)
            self.brocadeArc?()
        })
    }
}
