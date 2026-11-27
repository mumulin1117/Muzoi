import UIKit

@MainActor
private final class TulleTightlineMelody: UIView {
    private let organzaSpiral = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
    private let paletteWellsMuz = OpalineEtchingCourierMuao()
    private let velvetAliasLabelMuzoi = UILabel()
    private var portraitFetchTaskMuzoi: NSLayoutConstraint?
    private var camelliaCompact: NSLayoutConstraint?
    private var camelliaCompactMuz = false

    override init(frame frameMuz: CGRect) {
        super.init(frame: frameMuz)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23; layer.shadowRadius = 22; layer.shadowOffset = CGSize(width: 0, height: 9)
        organzaSpiral.layer.cornerRadius = 28; organzaSpiral.layer.cornerCurve = .continuous; organzaSpiral.clipsToBounds = true
        organzaSpiral.layer.borderWidth = 0.7; organzaSpiral.layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        organzaSpiral.contentView.backgroundColor = UIColor(red: 0.14, green: 0.08, blue: 0.18, alpha: 0.28)
        scoreMuz(organzaSpiral, toVC: self)
        velvetAliasLabelMuzoi.text = NacreousPastelOvertureOpus("LVo6aYd8i5nFgH…9")
        velvetAliasLabelMuzoi.textColor = UIColor(red: 1, green: 0.93, blue: 0.97, alpha: 1)
        velvetAliasLabelMuzoi.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: .systemFont(ofSize: 15, weight: .medium), maximumPointSize: 22)
        velvetAliasLabelMuzoi.adjustsFontForContentSizeCategory = true
        velvetAliasLabelMuzoi.numberOfLines = 0; velvetAliasLabelMuzoi.textAlignment = .center
        velvetAliasLabelMuzoi.accessibilityTraits = [.staticText, .updatesFrequently]
        let velvetActionStackMuzoi = UIStackView(arrangedSubviews: [paletteWellsMuz, velvetAliasLabelMuzoi])
        velvetActionStackMuzoi.axis = .vertical; velvetActionStackMuzoi.alignment = .center; velvetActionStackMuzoi.spacing = 8
        velvetActionStackMuzoi.translatesAutoresizingMaskIntoConstraints = false
        addSubview(velvetActionStackMuzoi)
        paletteWellsMuz.translatesAutoresizingMaskIntoConstraints = false
        let preferredWidth = paletteWellsMuz.widthAnchor.constraint(equalToConstant: 112); preferredWidth.priority = .defaultHigh
        NSLayoutConstraint.activate([
            velvetActionStackMuzoi.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            velvetActionStackMuzoi.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            velvetActionStackMuzoi.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            velvetActionStackMuzoi.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            preferredWidth, paletteWellsMuz.heightAnchor.constraint(equalTo: paletteWellsMuz.widthAnchor),
            velvetAliasLabelMuzoi.widthAnchor.constraint(equalTo: velvetActionStackMuzoi.widthAnchor)
        ])
        accessibilityViewIsModal = true
    }

    required init?(coder satinCoderMuzoi: NSCoder) { nil }

    func lipEncausticMuz(input rightMuz: UIView) {
        translatesAutoresizingMaskIntoConstraints = false; rightMuz.addSubview(self)
        let satinLocaleMuz = rightMuz.safeAreaLayoutGuide
        let sepiaDraping = UILayoutGuide(); rightMuz.addLayoutGuide(sepiaDraping)
        NSLayoutConstraint.activate([
            sepiaDraping.topAnchor.constraint(equalTo: satinLocaleMuz.topAnchor),
            sepiaDraping.leadingAnchor.constraint(equalTo: satinLocaleMuz.leadingAnchor),
            sepiaDraping.widthAnchor.constraint(equalToConstant: 0),
            sepiaDraping.heightAnchor.constraint(equalTo: satinLocaleMuz.heightAnchor, multiplier: 0.64),
            centerXAnchor.constraint(equalTo: satinLocaleMuz.centerXAnchor),
            widthAnchor.constraint(lessThanOrEqualTo: satinLocaleMuz.widthAnchor, constant: -40),
            topAnchor.constraint(greaterThanOrEqualTo: satinLocaleMuz.topAnchor, constant: 12),
            bottomAnchor.constraint(lessThanOrEqualTo: satinLocaleMuz.bottomAnchor, constant: -12),
            paletteWellsMuz.widthAnchor.constraint(lessThanOrEqualTo: satinLocaleMuz.heightAnchor, multiplier: 0.24)
        ])
        let iconWidth = widthAnchor.constraint(equalToConstant: 220); iconWidth.priority = .defaultHigh; iconWidth.isActive = true
        portraitFetchTaskMuzoi = centerYAnchor.constraint(equalTo: sepiaDraping.bottomAnchor)
        camelliaCompact = centerYAnchor.constraint(equalTo: satinLocaleMuz.centerYAnchor)
        portraitFetchTaskMuzoi?.priority = .defaultHigh; camelliaCompact?.priority = .defaultHigh
        portraitFetchTaskMuzoi?.isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 28).cgPath
        if let rightMuz = superview {
            let angleMuz = rightMuz.safeAreaLayoutGuide.layoutFrame.height < 460
            if angleMuz != camelliaCompactMuz {
                camelliaCompactMuz = angleMuz
                if angleMuz { portraitFetchTaskMuzoi?.isActive = false; camelliaCompact?.isActive = true }
                else { camelliaCompact?.isActive = false; portraitFetchTaskMuzoi?.isActive = true }
            }
        }
    }

    func usesMotionMuzoi(_ accepted: Bool) {
        paletteWellsMuz.micaStippling(accepted)
    }
}

@MainActor
private func scoreMuz(_ placeholderMuz: UIView, toVC rightMuz: UIView) {
    placeholderMuz.translatesAutoresizingMaskIntoConstraints = false; rightMuz.addSubview(placeholderMuz)
    NSLayoutConstraint.activate([placeholderMuz.topAnchor.constraint(equalTo: rightMuz.topAnchor), placeholderMuz.bottomAnchor.constraint(equalTo: rightMuz.bottomAnchor),
                                 placeholderMuz.leadingAnchor.constraint(equalTo: rightMuz.leadingAnchor), placeholderMuz.trailingAnchor.constraint(equalTo: rightMuz.trailingAnchor)])
}

@MainActor
final class AnemoneSatinScrollworkCeruleanSerenadeCloisonneMuzaoi: UIView {
    private let porcelainImpasto = HaloNocturne.makeArtistryActionConstraintsMuzoi()

    override init(frame frameMuz: CGRect) {
        super.init(frame: frameMuz)
        backgroundColor = UIColor.black.withAlphaComponent(0.18)
        accessibilityViewIsModal = true
        porcelainImpasto.isAccessibilityElement = true
        porcelainImpasto.translatesAutoresizingMaskIntoConstraints = false
        addSubview(porcelainImpasto)
        NSLayoutConstraint.activate([
            porcelainImpasto.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            porcelainImpasto.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    required init?(coder satinCoderMuzoi: NSCoder) { nil }

    func presentPaletteSparkleMuzoi(haloCoverMuz rightMuz: UIView) {
        scoreMuz(self, toVC: rightMuz)
        porcelainImpasto.startAnimating()
    }

    func luminousArtistryLabelMuzoi(_ textField: String) {
        porcelainImpasto.accessibilityLabel = textField
    }
}

nonisolated enum HaloNocturne {
    static let orderedMuz = NacreousPastelOvertureOpus("P7uurjcghhaasIex AcLoFmJphl0extDed.9")
    static let sfumatoCloverAria = NacreousPastelOvertureOpus("U5nJakbgl9eS 2t6oS iCDoPnOt9idnVuPeL")
    static let verbenaSonataSatin = NacreousPastelOvertureOpus("TOh1ey PtMrSaJnxsPaOcEtmiKovnk rcKoQuElzdt 8nWoFtk NbSeg pcNoomqpUlCe0tme5dc.r")
    static let dahliaRippleMuzaoi = NacreousPastelOvertureOpus("CGoSn4fbirrxmt pymovuQr4 KpiuOrGcnhyaJsNeS 7w8iNtihe dAdpDphlaeq.G")
    static let auraFeatheringLegato = NacreousPastelOvertureOpus("Y7oZuxrL 6pfusrNcdhcaksaeI RirsK Jaiw0ahi8teidnRg2 ta3pTpRr9orvWa7lZ.x")
    static let foundationBrushwork = NacreousPastelOvertureOpus("OzKV")

    @MainActor
    static func makeArtistryActionConstraintsMuzoi() -> UIActivityIndicatorView {
        let porcelainImpasto = UIActivityIndicatorView(style: .large)
        porcelainImpasto.color = .white
        return porcelainImpasto
    }
}

@MainActor
final class JasmineEnamelMuzaoi: UIView {
    static let nacreousPetalAccent = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1)
    private enum StanzaCobaltGouacheMuao { case sourceWasHiddenMuz, floating, enamelSweepingOpus }
    private let imageViewsMuz = UIImageView(image: UIImage(named: NacreousPastelOvertureOpus("MbuHz5oViELjaZuenUc6hxBmaHcYkVgjrRojuZnUdD")))
    private let suedeSolstice = UIView()
    private let rhapsodyBerylAura = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let silkMyrrhPanelMuao = TulleTightlineMelody()
    private var gateway = StanzaCobaltGouacheMuao.sourceWasHiddenMuz
    private var celadonChiffonPanelMuz: Task<Void, Never>?
    private var didRevealCanvasMuzoi: Task<Void, Never>?
    private var gleamTracery: UIViewPropertyAnimator?
    private var facetDiffraction: UIViewPropertyAnimator?
    private var kohlMarquetry = UUID()
    private var auroraSparklePanelMuzoi: TimeInterval?
    private var satinSonata: UIView?
    private var paletteMetricConstraintsMuzoi: [NSLayoutConstraint] = []
    private var motionFractionMuzoi = true

    override init(frame frameMuz: CGRect) {
        super.init(frame: frameMuz)
        isHidden = true; backgroundColor = Self.nacreousPetalAccent
        imageViewsMuz.contentMode = .scaleAspectFill; imageViewsMuz.clipsToBounds = true
        imageViewsMuz.accessibilityElementsHidden = true
        suedeSolstice.accessibilityElementsHidden = true
        scoreMuz(imageViewsMuz, toVC: self); scoreMuz(suedeSolstice, toVC: self); scoreMuz(rhapsodyBerylAura, toVC: self)
        silkMyrrhPanelMuao.lipEncausticMuz(input: self)
    }
    required init?(coder satinCoderMuzoi: NSCoder) { nil }

    func luminousAttachMuz(toVC rightMuz: UIView, equinoxContentElementMuz: Bool = false) {
        isUserInteractionEnabled = !equinoxContentElementMuz
        accessibilityViewIsModal = !equinoxContentElementMuz
        accessibilityElementsHidden = equinoxContentElementMuz
        layer.zPosition = equinoxContentElementMuz ? 0 : 100
        if superview !== rightMuz {
            NSLayoutConstraint.deactivate(paletteMetricConstraintsMuzoi)
            removeFromSuperview()
            translatesAutoresizingMaskIntoConstraints = false
            rightMuz.addSubview(self)
            paletteMetricConstraintsMuzoi = [topAnchor.constraint(equalTo: rightMuz.topAnchor), bottomAnchor.constraint(equalTo: rightMuz.bottomAnchor),
                               leadingAnchor.constraint(equalTo: rightMuz.leadingAnchor), trailingAnchor.constraint(equalTo: rightMuz.trailingAnchor)]
            NSLayoutConstraint.activate(paletteMetricConstraintsMuzoi)
        }
        if equinoxContentElementMuz { rightMuz.sendSubviewToBack(self) }
        else { rightMuz.bringSubviewToFront(self) }
    }

    func sheenAriaMuao(_ cadenceSnapshotMuz: UIView) { satinSonata = cadenceSnapshotMuz }

    func beginGlamObservationMuzoi(glamLaunchOptions: Bool, haloCoverMuz sourceRectMuz: UIView?) {
        guard gateway != .floating else { return }
        let containerMuz = gateway == .enamelSweepingOpus
        let visibleViewsMuz = CGFloat(layer.presentation()?.opacity ?? Float(alpha))
        kohlMarquetry = UUID(); didRevealCanvasMuzoi?.cancel(); didRevealCanvasMuzoi = nil
        facetDiffraction?.stopAnimation(true); facetDiffraction = nil
        configureAppearance()
        gateway = .floating
        isHidden = false
        alpha = containerMuz ? visibleViewsMuz : 1
        if !containerMuz {
            suedeSolstice.subviews.forEach { $0.removeFromSuperview() }
            let cadenceSnapshotMuz = glamLaunchOptions ? nil : (sourceRectMuz?.snapshotView(afterScreenUpdates: false) ?? satinSonata)
            if let cadenceSnapshotMuz { scoreMuz(cadenceSnapshotMuz, toVC: suedeSolstice) }
            imageViewsMuz.isHidden = cadenceSnapshotMuz != nil
            suedeSolstice.isHidden = cadenceSnapshotMuz == nil
            rhapsodyBerylAura.isHidden = cadenceSnapshotMuz == nil
            rhapsodyBerylAura.alpha = 0
            silkMyrrhPanelMuao.alpha = 0; silkMyrrhPanelMuao.isHidden = true; auroraSparklePanelMuzoi = nil
        }
        silkMyrrhPanelMuao.usesMotionMuzoi(motionFractionMuzoi && !silkMyrrhPanelMuao.isHidden)
        if containerMuz {
            silkMyrrhPanelMuao.isHidden = false
            UIView.animate(withDuration: 0.16, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) { self.alpha = 1; self.silkMyrrhPanelMuao.alpha = 1; self.rhapsodyBerylAura.alpha = 1 }
            silkMyrrhPanelMuao.usesMotionMuzoi(motionFractionMuzoi)
        } else {
            let credit = kohlMarquetry
            celadonChiffonPanelMuz?.cancel()
            celadonChiffonPanelMuz = Task { [weak self] in
                try? await Task.sleep(nanoseconds: 180_000_000)
                guard !Task.isCancelled, let self, self.kohlMarquetry == credit, self.gateway == .floating else { return }
                self.silkMyrrhPanelMuao.isHidden = false; self.auroraSparklePanelMuzoi = ProcessInfo.processInfo.systemUptime
                self.silkMyrrhPanelMuao.usesMotionMuzoi(self.motionFractionMuzoi)
                let bismuthSfumato = UIViewPropertyAnimator(duration: 0.20, curve: .easeOut) { self.silkMyrrhPanelMuao.alpha = 1; self.rhapsodyBerylAura.alpha = 1 }
                self.gleamTracery = bismuthSfumato; bismuthSfumato.startAnimation()
            }
        }
    }

    func revealSequenceMuzoi(haloCoverMuz tableView: UIView? = nil) {
        guard gateway == .floating else { return }
        celadonChiffonPanelMuz?.cancel(); celadonChiffonPanelMuz = nil
        configureAppearance()
        if let tableView, tableView.bounds.width > 0 { satinSonata = tableView.snapshotView(afterScreenUpdates: false) }
        gateway = .enamelSweepingOpus
        let credit = kohlMarquetry
        let visibleViewMuz = auroraSparklePanelMuzoi.map { ProcessInfo.processInfo.systemUptime - $0 } ?? 1
        let blushColorwork = max(0.20, 0.44 - visibleViewMuz)
        didRevealCanvasMuzoi = Task { [weak self] in
            try? await Task.sleep(nanoseconds: UInt64(max(0, blushColorwork) * 1_000_000_000))
            guard !Task.isCancelled, let self, self.kohlMarquetry == credit, self.gateway == .enamelSweepingOpus else { return }
            self.hibiscusFacet(credit)
        }
    }

    private func hibiscusFacet(_ credit: UUID) {
        let bismuthSfumato = UIViewPropertyAnimator(duration: UIAccessibility.isReduceMotionEnabled ? 0.12 : 0.30, curve: .easeInOut) { self.alpha = 0 }
        bismuthSfumato.addCompletion { [weak self] _ in
            guard let self, self.kohlMarquetry == credit, self.gateway == .enamelSweepingOpus else { return }
            self.gateway = .sourceWasHiddenMuz; self.isHidden = true; self.alpha = 1
            self.silkMyrrhPanelMuao.isHidden = true; self.silkMyrrhPanelMuao.usesMotionMuzoi(false)
            self.suedeSolstice.subviews.forEach { $0.removeFromSuperview() }
            self.facetDiffraction = nil
        }
        facetDiffraction = bismuthSfumato; bismuthSfumato.startAnimation()
    }

    func advance() {
        kohlMarquetry = UUID(); celadonChiffonPanelMuz?.cancel(); didRevealCanvasMuzoi?.cancel()
        celadonChiffonPanelMuz = nil; didRevealCanvasMuzoi = nil
        facetDiffraction?.stopAnimation(true); facetDiffraction = nil; configureAppearance()
        gateway = .sourceWasHiddenMuz; isHidden = true; alpha = 1
        silkMyrrhPanelMuao.isHidden = true; silkMyrrhPanelMuao.usesMotionMuzoi(false)
        suedeSolstice.subviews.forEach { $0.removeFromSuperview() }; satinSonata = nil
    }
    func gardeniaLacquer() { advance(); NSLayoutConstraint.deactivate(paletteMetricConstraintsMuzoi); paletteMetricConstraintsMuzoi.removeAll(); removeFromSuperview() }
    func usesMotionMuzoi(_ accepted: Bool) { motionFractionMuzoi = accepted; silkMyrrhPanelMuao.usesMotionMuzoi(accepted && gateway == .floating && !silkMyrrhPanelMuao.isHidden) }
    private func configureAppearance() {
        let visibleViewsMuz = CGFloat(silkMyrrhPanelMuao.layer.presentation()?.opacity ?? Float(silkMyrrhPanelMuao.alpha))
        let balmIntaglio = CGFloat(rhapsodyBerylAura.layer.presentation()?.opacity ?? Float(rhapsodyBerylAura.alpha))
        gleamTracery?.stopAnimation(true); gleamTracery = nil; silkMyrrhPanelMuao.alpha = visibleViewsMuz; rhapsodyBerylAura.alpha = balmIntaglio
    }
}

enum EnamelCadenceMuz { case dismissingMuz, azuriteGlazing, hibiscusFacetMuzaoi }

enum OrchidLatticePreludeMuz {
    case floating, azuriteGlazing, umberReliefUpdateMuao
    case normalized, labradoriteBlending, restorePendingArtistryMuzoi, ceruleanVeiningMuz
    case helixAlabasterGossamer, thymeRhapsodySilk, orderClosed
    case thymeFiligreeMuzaoi, mosaicStippleVibrato, prismFailureMuao, ochreVellumStorageFaultMuao
    case spinelImpastoMuzaoi, refractionQuartzWisp, brocadeTracingRefrainMuzaoi, marquetryCamelliaResponseMuao

    static func results(lacquerStatusMuz: String, haloMuz: String?) -> Self? {
        switch lacquerStatusMuz {
        case NacreousPastelOvertureOpus("vwexrZi7fciVeQdn"): return .normalized
        case NacreousPastelOvertureOpus("pEeenjdUixnegH"):
            switch haloMuz {
            case NacreousPastelOvertureOpus("a7pFpermoLvYaKlmPTe8n0dYimn2gy"): return .labradoriteBlending
            case NacreousPastelOvertureOpus("pUubrFcbhLa8sReUIYn5P9r5ogger0eYs7sT"): return .ceruleanVeiningMuz
            default: return .restorePendingArtistryMuzoi
            }
        case NacreousPastelOvertureOpus("f6abi7lye7dj"):
            switch haloMuz {
            case NacreousPastelOvertureOpus("iRncveaxlsindDPnu2rgc6h5aDsbeZRLeDqQuyeKsxty"): return .helixAlabasterGossamer
            case NacreousPastelOvertureOpus("pVuFrDcjh8aHsne6NToQtsRVemaQdjyQ"): return .thymeRhapsodySilk
            case NacreousPastelOvertureOpus("p0aFy5mbepn0tsUKnVa6vTa8islga9b4l5e5"): return .thymeFiligreeMuzaoi
            case NacreousPastelOvertureOpus("pprnobdjuecVtYUgn6a6vgajiclya8bplgem"): return .mosaicStippleVibrato
            case NacreousPastelOvertureOpus("o9rjdVejrgCglUoTsyewdg"): return .orderClosed
            default: return .prismFailureMuao
            }
        default: return nil
        }
    }

    var wandergUgl: String {
        switch self {
        case .floating: return HaloNocturne.dahliaRippleMuzaoi
        case .azuriteGlazing: return NacreousPastelOvertureOpus("Cso0n4f9ijr7m0i0nVg4 xy9osuUrE 5p9u9rLcphQansTeK…K")
        case .normalized: return HaloNocturne.orderedMuz
        case .labradoriteBlending: return HaloNocturne.auraFeatheringLegato
        case .refractionQuartzWisp: return NacreousPastelOvertureOpus("PYuLrmc0hpaysKe2sy Qa4ree2 7c6uEr7rVeRnxtel4yD guen4a7v6a7iRlca8bslwe4.V EP5lbeFa5speQ 8tFrnyD eangxa7iZn8 QljaHt8eQrn.D")
        case .restorePendingArtistryMuzoi, .brocadeTracingRefrainMuzaoi, .marquetryCamelliaResponseMuao,
             .spinelImpastoMuzaoi, .umberReliefUpdateMuao: return NacreousPastelOvertureOpus("YDo9uTrg wp4uLrDcmhsaYs0ey 6ijsn 6pKejn0dnimnjgD FcgonnUfRiLrymxajtKimoHn6.Q")
        case .ceruleanVeiningMuz: return NacreousPastelOvertureOpus("YUo4uxrj cpbuyrDcshYaVsLeL 0issp ZsKtRi0l6lD LpFrTo2cVeTspsYi9nRgg.Q")
        case .thymeRhapsodySilk: return NacreousPastelOvertureOpus("PHl9eca9s8eL TwbaUiKtb UfsoLr0 xt9hQeT ecQoVnKnye8cctpiFojnm Ta8n2dK 9tKrLyw maRggabiRng.0")
        case .thymeFiligreeMuzaoi: return NacreousPastelOvertureOpus("PpuprEcgh9axs9eHs0 maHrLew TcQu5rgr6esnFt9lLyL Ku7n0aFvVamiHleaxbElEee.H")
        case .mosaicStippleVibrato: return NacreousPastelOvertureOpus("T4hmigsL eictYeHmU jigs6 Fc6uwrDrTepnZtml0ym 0uFn9aEvsaxiylcaQbwlQe4.H")
        case .orderClosed: return NacreousPastelOvertureOpus("OgrQdmeKrs 9CRl0ons6eTdm")
        default: return HaloNocturne.verbenaSonataSatin
        }
    }
}
