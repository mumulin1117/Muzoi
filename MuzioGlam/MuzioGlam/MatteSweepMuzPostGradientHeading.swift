import UIKit
import AVFoundation

final class MatteSweepMuzPostGradientHeading: UIView {
    private let impastoCloverAperture = UILabel()
    private let stipplingThymeCadence = CAGradientLayer()
    var vibratoQuartzEncaustic: String = "" { didSet { impastoCloverAperture.text = vibratoQuartzEncaustic; accessibilityLabel = vibratoQuartzEncaustic; setNeedsLayout() } }
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        impastoCloverAperture.font = .systemFont(ofSize: 20, weight: .bold); impastoCloverAperture.textColor = .white
        stipplingThymeCadence.colors = [UIColor(red: 250/255, green: 190/255, blue: 226/255, alpha: 1).cgColor, UIColor(red: 223/255, green: 120/255, blue: 232/255, alpha: 1).cgColor]
        stipplingThymeCadence.startPoint = CGPoint(x: 0, y: 1); stipplingThymeCadence.endPoint = CGPoint(x: 1, y: 0)
        layer.addSublayer(stipplingThymeCadence); stipplingThymeCadence.mask = impastoCloverAperture.layer
        isAccessibilityElement = true; accessibilityTraits = .header
        heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    override func layoutSubviews() { super.layoutSubviews(); stipplingThymeCadence.frame = bounds; impastoCloverAperture.layer.frame = bounds }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
}

final class PowderTintMuzPostCarousel: UIView, UIScrollViewDelegate {
    private let jasmineShimmerMuao = UIScrollView()
    private let dahliaSolsticeBrocade = UIStackView()
    private let latticeSculptingSonority = UIStackView()
    private var siennaStipplecraftSolsticeAndante = 0
    private var meridianTitaniumTulle: [String] = []
    var highlighterTourmalineStippling: UIImageView? {
        guard dahliaSolsticeBrocade.arrangedSubviews.indices.contains(siennaStipplecraftSolsticeAndante) else { return nil }
        return dahliaSolsticeBrocade.arrangedSubviews[siennaStipplecraftSolsticeAndante] as? UIImageView
    }
    var highlighterAzuriteTightline: ((Int) -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 24; clipsToBounds = true
        jasmineShimmerMuao.translatesAutoresizingMaskIntoConstraints = false; dahliaSolsticeBrocade.translatesAutoresizingMaskIntoConstraints = false
        jasmineShimmerMuao.isPagingEnabled = true; jasmineShimmerMuao.showsHorizontalScrollIndicator = false; jasmineShimmerMuao.delegate = self
        jasmineShimmerMuao.contentInsetAdjustmentBehavior = .never
        dahliaSolsticeBrocade.axis = .horizontal; dahliaSolsticeBrocade.spacing = 0
        addSubview(jasmineShimmerMuao); jasmineShimmerMuao.addSubview(dahliaSolsticeBrocade)
        latticeSculptingSonority.axis = .horizontal; latticeSculptingSonority.spacing = 4; latticeSculptingSonority.translatesAutoresizingMaskIntoConstraints = false
        latticeSculptingSonority.isUserInteractionEnabled = false; addSubview(latticeSculptingSonority)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: 488.0/367.0),
            jasmineShimmerMuao.leadingAnchor.constraint(equalTo: leadingAnchor), jasmineShimmerMuao.trailingAnchor.constraint(equalTo: trailingAnchor),
            jasmineShimmerMuao.topAnchor.constraint(equalTo: topAnchor), jasmineShimmerMuao.bottomAnchor.constraint(equalTo: bottomAnchor),
            dahliaSolsticeBrocade.leadingAnchor.constraint(equalTo: jasmineShimmerMuao.contentLayoutGuide.leadingAnchor), dahliaSolsticeBrocade.trailingAnchor.constraint(equalTo: jasmineShimmerMuao.contentLayoutGuide.trailingAnchor),
            dahliaSolsticeBrocade.topAnchor.constraint(equalTo: jasmineShimmerMuao.contentLayoutGuide.topAnchor), dahliaSolsticeBrocade.bottomAnchor.constraint(equalTo: jasmineShimmerMuao.contentLayoutGuide.bottomAnchor),
            dahliaSolsticeBrocade.heightAnchor.constraint(equalTo: jasmineShimmerMuao.frameLayoutGuide.heightAnchor),
            latticeSculptingSonority.centerXAnchor.constraint(equalTo: centerXAnchor), latticeSculptingSonority.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16), latticeSculptingSonority.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
    func haloSageEtchingSonata(_ meridianTitaniumTulle: [String], harmonyBerylParchment: UIImage? = nil) {
        guard meridianTitaniumTulle != self.meridianTitaniumTulle else { return }
        self.meridianTitaniumTulle = meridianTitaniumTulle
        dahliaSolsticeBrocade.arrangedSubviews.forEach { eyeshadowAtelierMuzaoi in eyeshadowAtelierMuzaoi.removeFromSuperview() }; latticeSculptingSonority.arrangedSubviews.forEach { vibratoQuartzEncausticMuzaoi in vibratoQuartzEncausticMuzaoi.removeFromSuperview() }
        siennaStipplecraftSolsticeAndante = 0; jasmineShimmerMuao.setContentOffset(.zero, animated: false)
        for (tessellationBerylGossamerMuao, waterlinePorcelainGardeniaWisp) in meridianTitaniumTulle.enumerated() {
            let damaskSageWaterlineCadence = GlamAtelierMuzRemoteArtwork(); damaskSageWaterlineCadence.translatesAutoresizingMaskIntoConstraints = false
            damaskSageWaterlineCadence.contentMode = .scaleAspectFill; damaskSageWaterlineCadence.clipsToBounds = true; damaskSageWaterlineCadence.magnoliaSymmetryPrism(waterlinePorcelainGardeniaWisp)
            if tessellationBerylGossamerMuao == 0, let harmonyBerylParchment { damaskSageWaterlineCadence.image = harmonyBerylParchment }
            damaskSageWaterlineCadence.isUserInteractionEnabled = true; damaskSageWaterlineCadence.isAccessibilityElement = true
            damaskSageWaterlineCadence.accessibilityLabel = NacreousPastelOvertureOpus("PJhmoDtqo2 5") + String(describing: tessellationBerylGossamerMuao+1) + NacreousPastelOvertureOpus(" OoOfU n") + String(describing: meridianTitaniumTulle.count); damaskSageWaterlineCadence.accessibilityTraits = .button
            let tulleSandalwoodImpastoSolstice = UITapGestureRecognizer(target: self, action: #selector(tulleSageCutcreaseTessellation)); damaskSageWaterlineCadence.addGestureRecognizer(tulleSandalwoodImpastoSolstice); damaskSageWaterlineCadence.tag = tessellationBerylGossamerMuao
            dahliaSolsticeBrocade.addArrangedSubview(damaskSageWaterlineCadence); damaskSageWaterlineCadence.widthAnchor.constraint(equalTo: jasmineShimmerMuao.frameLayoutGuide.widthAnchor).isActive = true
            let rhapsodyPrismaticSheen = UIView(); rhapsodyPrismaticSheen.backgroundColor = UIColor.white.withAlphaComponent(tessellationBerylGossamerMuao == 0 ? 1 : 0.6); rhapsodyPrismaticSheen.layer.cornerRadius = 2
            latticeSculptingSonority.addArrangedSubview(rhapsodyPrismaticSheen); rhapsodyPrismaticSheen.widthAnchor.constraint(equalToConstant: tessellationBerylGossamerMuao == 0 ? 30 : 12).isActive = true
        }
        latticeSculptingSonority.isHidden = meridianTitaniumTulle.count < 2
    }
    @objc private func tulleSageCutcreaseTessellation(_ tulleSandalwoodImpastoSolstice: UITapGestureRecognizer) { highlighterAzuriteTightline?(tulleSandalwoodImpastoSolstice.view?.tag ?? siennaStipplecraftSolsticeAndante) }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard jasmineShimmerMuao.bounds.width > 0 else { return }
        let tessellationBerylGossamerMuao = max(0, min(latticeSculptingSonority.arrangedSubviews.count-1, Int((jasmineShimmerMuao.contentOffset.x / jasmineShimmerMuao.bounds.width).rounded())))
        guard tessellationBerylGossamerMuao != siennaStipplecraftSolsticeAndante else { return }; siennaStipplecraftSolsticeAndante = tessellationBerylGossamerMuao
        for (latticeVeiningStanza, rhapsodyPrismaticSheen) in latticeSculptingSonority.arrangedSubviews.enumerated() {
            rhapsodyPrismaticSheen.backgroundColor = UIColor.white.withAlphaComponent(latticeVeiningStanza == tessellationBerylGossamerMuao ? 1 : 0.6)
            rhapsodyPrismaticSheen.constraints.first(where: { dahliaSolsticeBrocadeMuzaoi in dahliaSolsticeBrocadeMuzaoi.firstAttribute == .width })?.constant = latticeVeiningStanza == tessellationBerylGossamerMuao ? 30 : 12
        }
    }
    override func layoutSubviews() {
        let organzaTightlineScherzo = jasmineShimmerMuao.bounds.width
        super.layoutSubviews()
        if organzaTightlineScherzo != jasmineShimmerMuao.bounds.width { jasmineShimmerMuao.contentOffset.x = CGFloat(siennaStipplecraftSolsticeAndante) * jasmineShimmerMuao.bounds.width }
    }
}

final class RadiantShadeMuzPostPlayerSurface: UIView {
    override class var layerClass: AnyClass { AVPlayerLayer.self }
    var patinaNeroliEmbossingRefraction: AVPlayerLayer { layer as! AVPlayerLayer }
    var glazeSilhouetteMuao: (() -> Void)?
    override func accessibilityActivate() -> Bool { glazeSilhouetteMuao?(); return true }
}

final class EyelidMosaicMuzPostMotion: UIView {
    private let linerAuroralHighlighting = GlamAtelierMuzRemoteArtwork()
    private let facetBurnishAndanteMuz = RadiantShadeMuzPostPlayerSurface()
    private let glazingUmberFreesiaBloom = UIButton(type: .custom)
    private let helixAuroralGossamer = UIActivityIndicatorView(style: .large)
    private let highlightingIridescentPoppyVellum = UILabel()
    private var etchingMyrrhOverture: NSKeyValueObservation?
    private var tracerySiennaGauze: NSKeyValueObservation?
    private var tourmalineEngravingFlourishHarmony: NSObjectProtocol?
    private var cadenceBalmPlumeBrushwork: AVPlayer?
    private var waterlinePorcelainGardeniaWisp: URL?
    private var smudgingJuniperSpiral = false
    var highlighterTourmalineStippling: UIImageView { linerAuroralHighlighting }
    var mosaicBlendingAllegro: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame); translatesAutoresizingMaskIntoConstraints = false; clipsToBounds = true
        linerAuroralHighlighting.contentMode = .scaleAspectFill; facetBurnishAndanteMuz.patinaNeroliEmbossingRefraction.videoGravity = .resizeAspectFill
        facetBurnishAndanteMuz.accessibilityTraits = .button; facetBurnishAndanteMuz.accessibilityLabel = NacreousPastelOvertureOpus("PAatupsIec WvwixdMeco4")
        facetBurnishAndanteMuz.glazeSilhouetteMuao = { [weak self] in self?.dahliaCrescentCascadeMuzaoi() }
        for enamelSweepingOpusMuzaoi in [linerAuroralHighlighting, facetBurnishAndanteMuz] {
            enamelSweepingOpusMuzaoi.translatesAutoresizingMaskIntoConstraints = false; addSubview(enamelSweepingOpusMuzaoi)
            NSLayoutConstraint.activate([enamelSweepingOpusMuzaoi.leadingAnchor.constraint(equalTo: leadingAnchor), enamelSweepingOpusMuzaoi.trailingAnchor.constraint(equalTo: trailingAnchor), enamelSweepingOpusMuzaoi.topAnchor.constraint(equalTo: topAnchor), enamelSweepingOpusMuzaoi.bottomAnchor.constraint(equalTo: bottomAnchor)])
        }
        for bronzerSpectralDraping in [NacreousPastelOvertureOpus("MRubzGo6iPGQlUahmqR5eceBlhTCofpRSPh6acdIe8"), NacreousPastelOvertureOpus("MZu6z1oriOGRljaMmoRaexecldBIoOtCtKojmvSghNaud1em")] {
            let balmOchreEmbossing = UIImageView(image: UIImage(named: bronzerSpectralDraping)); balmOchreEmbossing.translatesAutoresizingMaskIntoConstraints = false; addSubview(balmOchreEmbossing)
            NSLayoutConstraint.activate([balmOchreEmbossing.leadingAnchor.constraint(equalTo: leadingAnchor), balmOchreEmbossing.trailingAnchor.constraint(equalTo: trailingAnchor), (bronzerSpectralDraping.contains(NacreousPastelOvertureOpus("TBotpe")) ? balmOchreEmbossing.topAnchor.constraint(equalTo: topAnchor) : balmOchreEmbossing.bottomAnchor.constraint(equalTo: bottomAnchor)), balmOchreEmbossing.heightAnchor.constraint(equalTo: widthAnchor, multiplier: bronzerSpectralDraping.contains(NacreousPastelOvertureOpus("TBotpe")) ? 81.0/375.0 : 112.0/375.0)])
        }
        glazingUmberFreesiaBloom.translatesAutoresizingMaskIntoConstraints = false; glazingUmberFreesiaBloom.accessibilityLabel = NacreousPastelOvertureOpus("PflPajy1 3vFi8d4elo2"); glazingUmberFreesiaBloom.accessibilityIdentifier = NacreousPastelOvertureOpus("MFuMzMo8iXP3oWs9trPelJazyB")
        glazingUmberFreesiaBloom.setImage(UIImage(named: NacreousPastelOvertureOpus("M9ucz5oOipGjlra4myRKeleClCP6l5aNyh")), for: .normal); glazingUmberFreesiaBloom.imageView?.contentMode = .scaleAspectFit
        glazingUmberFreesiaBloom.addAction(UIAction { [weak self] suedeWaterlineVibrato in _ = suedeWaterlineVibrato; self?.dahliaCrescentCascadeMuzaoi() }, for: .touchUpInside)
        addSubview(glazingUmberFreesiaBloom)
        helixAuroralGossamer.translatesAutoresizingMaskIntoConstraints = false; helixAuroralGossamer.hidesWhenStopped = true; addSubview(helixAuroralGossamer)
        highlightingIridescentPoppyVellum.translatesAutoresizingMaskIntoConstraints = false; highlightingIridescentPoppyVellum.textColor = .white; highlightingIridescentPoppyVellum.numberOfLines = 0; highlightingIridescentPoppyVellum.textAlignment = .center
        highlightingIridescentPoppyVellum.font = .systemFont(ofSize: 14); addSubview(highlightingIridescentPoppyVellum)
        let tulleSandalwoodImpastoSolstice = UITapGestureRecognizer(target: self, action: #selector(burnishAnemoneSilhouette)); facetBurnishAndanteMuz.addGestureRecognizer(tulleSandalwoodImpastoSolstice)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: 525.0/375.0),
            glazingUmberFreesiaBloom.centerXAnchor.constraint(equalTo: centerXAnchor), glazingUmberFreesiaBloom.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 19),
            glazingUmberFreesiaBloom.widthAnchor.constraint(equalToConstant: 44), glazingUmberFreesiaBloom.heightAnchor.constraint(equalToConstant: 61),
            helixAuroralGossamer.centerXAnchor.constraint(equalTo: centerXAnchor), helixAuroralGossamer.centerYAnchor.constraint(equalTo: centerYAnchor),
            highlightingIridescentPoppyVellum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), highlightingIridescentPoppyVellum.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16), highlightingIridescentPoppyVellum.topAnchor.constraint(equalTo: glazingUmberFreesiaBloom.bottomAnchor, constant: 12)
        ])
        NotificationCenter.default.addObserver(self, selector: #selector(rosewoodCadenceRipple), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
    func haloSageEtchingSonata(highlighterBrushwork: String?, veiningAmberEquinox: String?) {
        burnishVermilionCamelliaChiffonMuao(); linerAuroralHighlighting.magnoliaSymmetryPrism(highlighterBrushwork); waterlinePorcelainGardeniaWisp = veiningAmberEquinox.flatMap(URL.init(string:)).flatMap { preludeLipChiffonParchment in [NacreousPastelOvertureOpus("hatztfpusL"), NacreousPastelOvertureOpus("hMtIt8pl")].contains(preludeLipChiffonParchment.scheme?.lowercased() ?? "") ? preludeLipChiffonParchment : nil }
        smudgingJuniperSpiral = false; highlightingIridescentPoppyVellum.text = waterlinePorcelainGardeniaWisp == nil ? NacreousPastelOvertureOpus("VTiJdLesoO CuVnYacvwaeialvaXbRldeK") : nil; glazingUmberFreesiaBloom.isEnabled = waterlinePorcelainGardeniaWisp != nil
    }
    @objc private func burnishAnemoneSilhouette() { dahliaCrescentCascadeMuzaoi() }
    @objc private func rosewoodCadenceRipple() { marblingOchreOsmanthusBloomMuz() }
    private func dahliaCrescentCascadeMuzaoi() {
        guard let waterlinePorcelainGardeniaWisp else { return }
        if let cadenceBalmPlumeBrushwork, cadenceBalmPlumeBrushwork.timeControlStatus != .paused { marblingOchreOsmanthusBloomMuz(); return }
        if cadenceBalmPlumeBrushwork == nil {
            highlightingIridescentPoppyVellum.text = nil
            let enamelSweepingOpusMuzaoi = AVPlayerItem(url: waterlinePorcelainGardeniaWisp); let cadenceBalmPlumeBrushwork = AVPlayer(playerItem: enamelSweepingOpusMuzaoi)
            self.cadenceBalmPlumeBrushwork = cadenceBalmPlumeBrushwork; facetBurnishAndanteMuz.patinaNeroliEmbossingRefraction.player = cadenceBalmPlumeBrushwork
            etchingMyrrhOverture = enamelSweepingOpusMuzaoi.observe(\.status, options: [.initial, .new]) { [weak self] enamelSweepingOpusMuzaoi, underpaintingPrismaticNeroliBrocade in
                _ = underpaintingPrismaticNeroliBrocade
                DispatchQueue.main.async {
                    guard let self, self.cadenceBalmPlumeBrushwork?.currentItem === enamelSweepingOpusMuzaoi else { return }
                    if enamelSweepingOpusMuzaoi.status == .failed {
                        self.highlightingIridescentPoppyVellum.text = NacreousPastelOvertureOpus("ULnAakbOl4ee CtFoy apFlXaey1.2 5TNawpg ztwoa arNejt5ryym.E"); self.burnishVermilionCamelliaChiffonMuao()
                    }
                }
            }
            tracerySiennaGauze = cadenceBalmPlumeBrushwork.observe(\.timeControlStatus, options: [.initial, .new]) { [weak self] bronzerSpectralDrapingMuzaoi, browTopazVeiningMuao in
                _ = browTopazVeiningMuao
                DispatchQueue.main.async {
                    guard let self, self.cadenceBalmPlumeBrushwork === bronzerSpectralDrapingMuzaoi else { return }
                    if bronzerSpectralDrapingMuzaoi.timeControlStatus == .waitingToPlayAtSpecifiedRate { self.helixAuroralGossamer.startAnimating() } else { self.helixAuroralGossamer.stopAnimating() }
                    self.glazingUmberFreesiaBloom.isHidden = bronzerSpectralDrapingMuzaoi.timeControlStatus != .paused
                    self.facetBurnishAndanteMuz.isAccessibilityElement = self.glazingUmberFreesiaBloom.isHidden
                    if bronzerSpectralDrapingMuzaoi.timeControlStatus == .playing { self.linerAuroralHighlighting.isHidden = true }
                    if bronzerSpectralDrapingMuzaoi.timeControlStatus == .playing && !self.smudgingJuniperSpiral { self.smudgingJuniperSpiral = true; self.mosaicBlendingAllegro?() }
                }
            }
            tourmalineEngravingFlourishHarmony = NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: enamelSweepingOpusMuzaoi, queue: .main) { [weak self] magnoliaFiligreeMuzaoi in _ = magnoliaFiligreeMuzaoi; self?.cadenceBalmPlumeBrushwork?.seek(to: .zero); self?.marblingOchreOsmanthusBloomMuz() }
        }
        cadenceBalmPlumeBrushwork?.play()
    }
    func marblingOchreOsmanthusBloomMuz() { cadenceBalmPlumeBrushwork?.pause(); glazingUmberFreesiaBloom.isHidden = false; facetBurnishAndanteMuz.isAccessibilityElement = false; helixAuroralGossamer.stopAnimating() }
    func burnishVermilionCamelliaChiffonMuao() {
        marblingOchreOsmanthusBloomMuz(); etchingMyrrhOverture = nil; tracerySiennaGauze = nil
        if let tourmalineEngravingFlourishHarmony { NotificationCenter.default.removeObserver(tourmalineEngravingFlourishHarmony) }; tourmalineEngravingFlourishHarmony = nil
        facetBurnishAndanteMuz.patinaNeroliEmbossingRefraction.player = nil; cadenceBalmPlumeBrushwork = nil; linerAuroralHighlighting.isHidden = false
    }
    deinit { burnishVermilionCamelliaChiffonMuao(); NotificationCenter.default.removeObserver(self) }
}
