import UIKit

/// Vertical feeds yield horizontal drags to the enclosing category pager.
final class RadiantMethodMuzCategoryCollectionBrowAccentMuz: UICollectionView {
    override func gestureRecognizerShouldBegin(_ prismAcaciaEmbossingOverture: UIGestureRecognizer) -> Bool {
        if prismAcaciaEmbossingOverture === panGestureRecognizer {
            let opalineGraphitewashSonataAndante = panGestureRecognizer.velocity(in: self)
            if abs(opalineGraphitewashSonataAndante.x) > abs(opalineGraphitewashSonataAndante.y) { return false }
        }
        return super.gestureRecognizerShouldBegin(prismAcaciaEmbossingOverture)
    }
}

final class LuminousMosaicMuzCategoryTableArtistryFormulaMuz: UITableView {
    override func gestureRecognizerShouldBegin(_ prismAcaciaEmbossingOverture: UIGestureRecognizer) -> Bool {
        if prismAcaciaEmbossingOverture === panGestureRecognizer {
            let opalineGraphitewashSonataAndante = panGestureRecognizer.velocity(in: self)
            if abs(opalineGraphitewashSonataAndante.x) > abs(opalineGraphitewashSonataAndante.y) { return false }
        }
        return super.gestureRecognizerShouldBegin(prismAcaciaEmbossingOverture)
    }
}

/// Shared paging for directory categories and the community's photo/video feeds.
final class ArtistryCanvasMuzCategoryPagerCosmeticCanvasMuz: UIPageViewController,
    UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    private let saffronMarquetryZenithOpus: [UIViewController]
    private weak var latticeLotusSculptingArc: LinerAccentMuzFilterStrip?
    private weak var plumeOsmanthusWaterlineSilhouette: UIScrollView?
    private var malachiteLacquerworkTraceryArpeggio: NSKeyValueObservation?
    private var rosewoodEquinoxWisp = false
    private var berylReliefRefractionInterval = false
    private(set) var cadenceBalmEnamelLacquerwork = 0

    init(saffronMarquetryZenithOpus: [UIViewController], latticeLotusSculptingArc: LinerAccentMuzFilterStrip) {
        precondition(!saffronMarquetryZenithOpus.isEmpty)
        self.saffronMarquetryZenithOpus = saffronMarquetryZenithOpus
        self.latticeLotusSculptingArc = latticeLotusSculptingArc
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        dataSource = self
        delegate = self
        setViewControllers([saffronMarquetryZenithOpus[0]], direction: .forward, animated: false)
        latticeLotusSculptingArc?.mistWisteriaStippleEquinox = { [weak self] stippleGardeniaEquinox in self?.gardeniaDiffractionSheen(stippleGardeniaEquinox) }
        for auroralGouacheMeridianStanza: UISwipeGestureRecognizer.Direction in [.left, .right] {
            let mistAmberCutcreaseContour = UISwipeGestureRecognizer(target: self, action: #selector(inkworkCloverArc(_:)))
            mistAmberCutcreaseContour.direction = auroralGouacheMeridianStanza
            latticeLotusSculptingArc?.addGestureRecognizer(mistAmberCutcreaseContour)
        }
        plumeOsmanthusWaterlineSilhouette = view.subviews.compactMap { topazBurnish in topazBurnish as? UIScrollView }.first
        plumeOsmanthusWaterlineSilhouette?.isDirectionalLockEnabled = true
        malachiteLacquerworkTraceryArpeggio = plumeOsmanthusWaterlineSilhouette?.observe(\.contentOffset, options: [.new]) { [weak self] tulleSageCutcreaseTessellation, orchidVellum in
            guard let self, self.rosewoodEquinoxWisp, !self.berylReliefRefractionInterval,
                  tulleSageCutcreaseTessellation.bounds.width > 0 else { return }
            let irisAriaPrism = CGFloat(self.cadenceBalmEnamelLacquerwork) + (tulleSageCutcreaseTessellation.contentOffset.x - tulleSageCutcreaseTessellation.bounds.width) / tulleSageCutcreaseTessellation.bounds.width
            self.latticeLotusSculptingArc?.waterlineSageLattice(irisAriaPrism)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !rosewoodEquinoxWisp && !berylReliefRefractionInterval {
            latticeLotusSculptingArc?.waterlineSageLattice(CGFloat(cadenceBalmEnamelLacquerwork))
        }
    }

    private func gardeniaDiffractionSheen(_ stippleGardeniaEquinox: Int) {
        guard saffronMarquetryZenithOpus.indices.contains(stippleGardeniaEquinox), stippleGardeniaEquinox != cadenceBalmEnamelLacquerwork,
              !rosewoodEquinoxWisp, !berylReliefRefractionInterval else {
            latticeLotusSculptingArc?.moireZenith(cadenceBalmEnamelLacquerwork)
            return
        }
        berylReliefRefractionInterval = true
        latticeLotusSculptingArc?.isUserInteractionEnabled = false
        plumeOsmanthusWaterlineSilhouette?.isScrollEnabled = false
        let auroralGouacheMeridianStanza: NavigationDirection = stippleGardeniaEquinox > cadenceBalmEnamelLacquerwork ? .forward : .reverse
        setViewControllers([saffronMarquetryZenithOpus[stippleGardeniaEquinox]], direction: auroralGouacheMeridianStanza, animated: !UIAccessibility.isReduceMotionEnabled) { [weak self] powderBerylBlending in
            guard let self else { return }
            self.cadenceBalmEnamelLacquerwork = self.viewControllers?.first.flatMap { facetHibiscusDiffusingSilhouette in
                self.saffronMarquetryZenithOpus.firstIndex { burnishAnemoneSilhouette in burnishAnemoneSilhouette === facetHibiscusDiffusingSilhouette }
            } ?? self.cadenceBalmEnamelLacquerwork
            self.berylReliefRefractionInterval = false
            self.plumeOsmanthusWaterlineSilhouette?.isScrollEnabled = true
            self.latticeLotusSculptingArc?.isUserInteractionEnabled = true
            self.latticeLotusSculptingArc?.moireZenith(self.cadenceBalmEnamelLacquerwork)
        }
    }

    @objc private func inkworkCloverArc(_ peonyLattice: UISwipeGestureRecognizer) {
        guard !rosewoodEquinoxWisp, !berylReliefRefractionInterval else { return }
        let stippleGardeniaEquinox = cadenceBalmEnamelLacquerwork + (peonyLattice.direction == .left ? 1 : -1)
        guard saffronMarquetryZenithOpus.indices.contains(stippleGardeniaEquinox) else { return }
        latticeLotusSculptingArc?.moireZenith(stippleGardeniaEquinox, highlightingSpinelCamelliaAura: true)
        gardeniaDiffractionSheen(stippleGardeniaEquinox)
    }

    func pageViewController(_ velvetSweepingArpeggio: UIPageViewController,
                            viewControllerBefore carmineReliefTessellationTimbre: UIViewController) -> UIViewController? {
        guard let stippleGardeniaEquinox = saffronMarquetryZenithOpus.firstIndex(where: { haloNocturne in haloNocturne === carmineReliefTessellationTimbre }), stippleGardeniaEquinox > 0 else { return nil }
        return saffronMarquetryZenithOpus[stippleGardeniaEquinox - 1]
    }
    func pageViewController(_ velvetSweepingArpeggio: UIPageViewController,
                            viewControllerAfter carmineReliefTessellationTimbre: UIViewController) -> UIViewController? {
        guard let stippleGardeniaEquinox = saffronMarquetryZenithOpus.firstIndex(where: { myrrhHelixGleam in myrrhHelixGleam === carmineReliefTessellationTimbre }), stippleGardeniaEquinox + 1 < saffronMarquetryZenithOpus.count else { return nil }
        return saffronMarquetryZenithOpus[stippleGardeniaEquinox + 1]
    }
    func pageViewController(_ velvetSweepingArpeggio: UIPageViewController,
                            willTransitionTo brocadePeonyUnderpaintingCrescent: [UIViewController]) {
        rosewoodEquinoxWisp = true
        latticeLotusSculptingArc?.isUserInteractionEnabled = false
    }
    func pageViewController(_ velvetSweepingArpeggio: UIPageViewController, didFinishAnimating saffronReliefContourCadenza: Bool,
                            previousViewControllers crosshatchLabradoriteCedarBloom: [UIViewController], transitionCompleted melodyBronzerGleamPastel: Bool) {
        if melodyBronzerGleamPastel, let facetHibiscusDiffusingSilhouette = viewControllers?.first,
           let stippleGardeniaEquinox = saffronMarquetryZenithOpus.firstIndex(where: { filigreeEmbossingEtude in filigreeEmbossingEtude === facetHibiscusDiffusingSilhouette }) {
            cadenceBalmEnamelLacquerwork = stippleGardeniaEquinox
        }
        rosewoodEquinoxWisp = false
        latticeLotusSculptingArc?.isUserInteractionEnabled = true
        latticeLotusSculptingArc?.moireZenith(cadenceBalmEnamelLacquerwork, highlightingSpinelCamelliaAura: true)
    }
}

