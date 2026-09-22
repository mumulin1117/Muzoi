import UIKit

final class IridescentPeonyCadenceMuz: UIRefreshControl {
    private static let nacreousPetalAccent = UIColor(red: 239/255, green: 151/255, blue: 229/255, alpha: 1)
    private let opalinePaletteMuz = UIView()
    private let paletteWellColorsMuz = [
        UIColor(red: 0.95, green: 0.36, blue: 0.65, alpha: 1),
        UIColor(red: 1, green: 0.70, blue: 0.34, alpha: 1),
        UIColor(red: 0.67, green: 0.40, blue: 0.82, alpha: 1),
        UIColor(red: 0.93, green: 0.58, blue: 0.70, alpha: 1),
        UIColor(red: 0.73, green: 0.49, blue: 0.32, alpha: 1)
    ]
    private lazy var paletteWellsMuz = paletteWellColorsMuz.map { colorMuz -> CALayer in
        let wellMuz = CALayer()
        wellMuz.backgroundColor = colorMuz.cgColor
        wellMuz.borderColor = UIColor.white.withAlphaComponent(0.38).cgColor
        wellMuz.borderWidth = 0.6
        return wellMuz
    }

    override init() {
        super.init()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }

    private func configureAppearance() {
        tintColor = .clear
        backgroundColor = .clear
        opalinePaletteMuz.isUserInteractionEnabled = false
        opalinePaletteMuz.backgroundColor = UIColor(red: 50/255, green: 35/255, blue: 55/255, alpha: 0.94)
        opalinePaletteMuz.layer.borderColor = Self.nacreousPetalAccent.withAlphaComponent(0.72).cgColor
        opalinePaletteMuz.layer.borderWidth = 1
        addSubview(opalinePaletteMuz)
        paletteWellsMuz.forEach(opalinePaletteMuz.layer.addSublayer)
        addTarget(self, action: #selector(cadenceBalmMuz), for: .valueChanged)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let paletteSideMuz: CGFloat = 30
        opalinePaletteMuz.frame = CGRect(x: (bounds.width - paletteSideMuz) / 2, y: max(3, bounds.midY - paletteSideMuz / 2), width: paletteSideMuz, height: paletteSideMuz)
        opalinePaletteMuz.layer.cornerRadius = paletteSideMuz / 2
        for (indexMuz, wellMuz) in paletteWellsMuz.enumerated() {
            let angleMuz = CGFloat(indexMuz) * (.pi * 2 / CGFloat(paletteWellsMuz.count)) - .pi / 2
            let centerMuz = CGPoint(x: paletteSideMuz / 2 + cos(angleMuz) * 8.4, y: paletteSideMuz / 2 + sin(angleMuz) * 8.4)
            wellMuz.bounds = CGRect(x: 0, y: 0, width: 6.2, height: 6.2)
            wellMuz.position = centerMuz
            wellMuz.cornerRadius = 3.1
        }
    }

    @objc private func cadenceBalmMuz() {
        guard !UIAccessibility.isReduceMotionEnabled else { return }
        let orbitMuz = CABasicAnimation(keyPath: "transform.rotation.z")
        orbitMuz.fromValue = 0
        orbitMuz.toValue = CGFloat.pi * 2
        orbitMuz.duration = 0.82
        orbitMuz.repeatCount = .infinity
        orbitMuz.timingFunction = CAMediaTimingFunction(name: .linear)
        opalinePaletteMuz.layer.add(orbitMuz, forKey: "paletteRotationMuz")
    }

    override func beginRefreshing() {
        super.beginRefreshing()
        cadenceBalmMuz()
    }

    override func endRefreshing() {
        super.endRefreshing()
        opalinePaletteMuz.layer.removeAllAnimations()
    }
}

enum NacreousMotionMuz {
    private static let revealedListsMuz = NSHashTable<UIScrollView>.weakObjects()

    static func reveal(_ view: UIView, cadenceIndexMuz: Int) {
        guard !UIAccessibility.isReduceMotionEnabled else {
            view.alpha = 1
            view.transform = .identity
            return
        }
        view.alpha = 0
        view.transform = CGAffineTransform(translationX: 0, y: 8).scaledBy(x: 0.992, y: 0.992)
        let cadenceDelayMuz = min(8, max(0, cadenceIndexMuz))
        UIView.animate(
            withDuration: 0.34,
            delay: Double(cadenceDelayMuz) * 0.035,
            options: [.curveEaseOut, .allowUserInteraction, .beginFromCurrentState]
        ) {
            view.alpha = 1
            view.transform = .identity
        }
    }

    static func revealVisibleMuz(in collectionView: UICollectionView) {
        let orderedMuz = collectionView.indexPathsForVisibleItems.sorted()
        orderedMuz.enumerated().forEach { cadenceIndexMuz, indexPathMuz in
            if let cellMuz = collectionView.cellForItem(at: indexPathMuz) { reveal(cellMuz, cadenceIndexMuz: cadenceIndexMuz) }
        }
    }

    static func revealVisibleOnceMuz(in collectionView: UICollectionView) {
        guard !revealedListsMuz.contains(collectionView) else { return }
        revealedListsMuz.add(collectionView)
        collectionView.layoutIfNeeded()
        revealVisibleMuz(in: collectionView)
    }

    static func revealVisibleMuz(in tableView: UITableView) {
        let orderedMuz = (tableView.indexPathsForVisibleRows ?? []).sorted()
        orderedMuz.enumerated().forEach { cadenceIndexMuz, indexPathMuz in
            if let cellMuz = tableView.cellForRow(at: indexPathMuz) { reveal(cellMuz, cadenceIndexMuz: cadenceIndexMuz) }
        }
    }

    static func revealVisibleOnceMuz(in tableView: UITableView) {
        guard !revealedListsMuz.contains(tableView) else { return }
        revealedListsMuz.add(tableView)
        tableView.layoutIfNeeded()
        revealVisibleMuz(in: tableView)
    }

    static func parallaxMuz(in scrollView: UIScrollView) {
        guard !UIAccessibility.isReduceMotionEnabled, scrollView.bounds.height > 0 else { return }
        let visibleViewsMuz: [UIView]
        if let collectionViewMuz = scrollView as? UICollectionView { visibleViewsMuz = collectionViewMuz.visibleCells }
        else if let tableViewMuz = scrollView as? UITableView { visibleViewsMuz = tableViewMuz.visibleCells }
        else { visibleViewsMuz = scrollView.subviews.filter { $0.bounds.height >= 80 } }
        let horizontalMuz = scrollView.contentSize.width > scrollView.bounds.width + 1 && scrollView.contentSize.height <= scrollView.bounds.height + 1
        for visibleViewMuz in visibleViewsMuz {
            let centerMuz = visibleViewMuz.convert(CGPoint(x: visibleViewMuz.bounds.midX, y: visibleViewMuz.bounds.midY), to: scrollView)
            let progressMuz = horizontalMuz
                ? max(-1, min(1, (centerMuz.x - scrollView.contentOffset.x - scrollView.bounds.midX) / max(scrollView.bounds.width / 2, 1)))
                : max(-1, min(1, (centerMuz.y - scrollView.contentOffset.y - scrollView.bounds.midY) / max(scrollView.bounds.height / 2, 1)))
            imageViewsMuz(in: visibleViewMuz).forEach { imageViewMuz in
                let translationMuz = -progressMuz * 6
                imageViewMuz.transform = CGAffineTransform(scaleX: 1.025, y: 1.025).translatedBy(x: horizontalMuz ? translationMuz : 0, y: horizontalMuz ? 0 : translationMuz)
            }
        }
    }

    private static func imageViewsMuz(in rootViewMuz: UIView) -> [UIImageView] {
        var matchesMuz: [UIImageView] = []
        if let imageViewMuz = rootViewMuz as? UIImageView,
           imageViewMuz.contentMode == .scaleAspectFill,
           imageViewMuz.bounds.width >= 72,
           imageViewMuz.bounds.height >= 72 { matchesMuz.append(imageViewMuz) }
        rootViewMuz.subviews.forEach { matchesMuz.append(contentsOf: imageViewsMuz(in: $0)) }
        return matchesMuz
    }
}

enum NacreousPetalCadenceMuz {
    case opalineCrescent
    case satinTessera
    case velvetPortrait
}

final class NacreousPetalMosaicMuz: UIView {
    private let opalineCrescent = UIView()
    private let scintillaFreesiaBlendingRefraction = UIView()
    private let poppySolsticeFacetMuao = UIView()
    private let camelliaContourCantata = UIView()
    private let rosewoodCadenceRipple = UIView()
    private lazy var tesseraCloverHighlightingCrescent = [
        opalineCrescent,
        scintillaFreesiaBlendingRefraction,
        poppySolsticeFacetMuao,
        camelliaContourCantata,
        rosewoodCadenceRipple
    ]
    private let cadenceBalmEnamelLacquerwork: NacreousPetalCadenceMuz
    private var auroralShimmerMuz: [CAGradientLayer] = []

    init(cadenceBalmEnamelLacquerwork: NacreousPetalCadenceMuz = .satinTessera) {
        self.cadenceBalmEnamelLacquerwork = cadenceBalmEnamelLacquerwork
        super.init(frame: .zero)
        facetInkworkAllegro()
    }

    required init?(coder: NSCoder) {
        cadenceBalmEnamelLacquerwork = .satinTessera
        super.init(coder: coder)
        facetInkworkAllegro()
    }

    private func facetInkworkAllegro() {
        backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1)
        clipsToBounds = true
        isHidden = true
        isUserInteractionEnabled = false
        tesseraCloverHighlightingCrescent.forEach { bronzerAzuriteStipplework in
            bronzerAzuriteStipplework.translatesAutoresizingMaskIntoConstraints = false
            bronzerAzuriteStipplework.backgroundColor = UIColor(red: 66/255, green: 43/255, blue: 72/255, alpha: 1)
            bronzerAzuriteStipplework.layer.cornerCurve = .continuous
            addSubview(bronzerAzuriteStipplework)
            let roseGoldShimmerMuz = CAGradientLayer()
            roseGoldShimmerMuz.colors = [
                UIColor.clear.cgColor,
                UIColor(red: 1, green: 0.63, blue: 0.78, alpha: 0.08).cgColor,
                UIColor(red: 1, green: 0.78, blue: 0.48, alpha: 0.34).cgColor,
                UIColor(red: 1, green: 0.63, blue: 0.78, alpha: 0.08).cgColor,
                UIColor.clear.cgColor
            ]
            roseGoldShimmerMuz.locations = [0, 0.36, 0.5, 0.64, 1]
            roseGoldShimmerMuz.startPoint = CGPoint(x: 0, y: 0.5)
            roseGoldShimmerMuz.endPoint = CGPoint(x: 1, y: 0.5)
            bronzerAzuriteStipplework.layer.addSublayer(roseGoldShimmerMuz)
            auroralShimmerMuz.append(roseGoldShimmerMuz)
        }

        switch cadenceBalmEnamelLacquerwork {
        case .opalineCrescent:
            lacquerPetalEtude()
        case .satinTessera:
            damaskMeridianMuao()
        case .velvetPortrait:
            magnoliaSymmetryPrismMuz()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        zip(tesseraCloverHighlightingCrescent, auroralShimmerMuz).forEach { placeholderMuz, shimmerMuz in
            shimmerMuz.frame = placeholderMuz.bounds.insetBy(dx: -placeholderMuz.bounds.width, dy: 0)
        }
    }

    private func lacquerPetalEtude() {
        opalineCrescent.layer.cornerRadius = 24
        scintillaFreesiaBlendingRefraction.layer.cornerRadius = 10
        [poppySolsticeFacetMuao, camelliaContourCantata, rosewoodCadenceRipple].forEach { lacquerPetalEtude in
            lacquerPetalEtude.layer.cornerRadius = 18
        }
        NSLayoutConstraint.activate([
            opalineCrescent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            opalineCrescent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            opalineCrescent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            opalineCrescent.heightAnchor.constraint(equalTo: opalineCrescent.widthAnchor, multiplier: 0.96),
            scintillaFreesiaBlendingRefraction.topAnchor.constraint(equalTo: opalineCrescent.bottomAnchor, constant: 24),
            scintillaFreesiaBlendingRefraction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            scintillaFreesiaBlendingRefraction.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.42),
            scintillaFreesiaBlendingRefraction.heightAnchor.constraint(equalToConstant: 20),
            poppySolsticeFacetMuao.topAnchor.constraint(equalTo: scintillaFreesiaBlendingRefraction.bottomAnchor, constant: 16),
            poppySolsticeFacetMuao.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            poppySolsticeFacetMuao.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38),
            poppySolsticeFacetMuao.heightAnchor.constraint(equalTo: poppySolsticeFacetMuao.widthAnchor, multiplier: 1.18),
            camelliaContourCantata.topAnchor.constraint(equalTo: poppySolsticeFacetMuao.topAnchor),
            camelliaContourCantata.leadingAnchor.constraint(equalTo: poppySolsticeFacetMuao.trailingAnchor, constant: 10),
            camelliaContourCantata.widthAnchor.constraint(equalTo: poppySolsticeFacetMuao.widthAnchor),
            camelliaContourCantata.heightAnchor.constraint(equalTo: poppySolsticeFacetMuao.heightAnchor),
            rosewoodCadenceRipple.topAnchor.constraint(equalTo: poppySolsticeFacetMuao.topAnchor),
            rosewoodCadenceRipple.leadingAnchor.constraint(equalTo: camelliaContourCantata.trailingAnchor, constant: 10),
            rosewoodCadenceRipple.widthAnchor.constraint(equalTo: poppySolsticeFacetMuao.widthAnchor),
            rosewoodCadenceRipple.heightAnchor.constraint(equalTo: poppySolsticeFacetMuao.heightAnchor)
        ])
    }

    private func damaskMeridianMuao() {
        tesseraCloverHighlightingCrescent.forEach { porcelainOrchidTracery in
            porcelainOrchidTracery.layer.cornerRadius = 18
        }
        NSLayoutConstraint.activate([
            opalineCrescent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            opalineCrescent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            opalineCrescent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            opalineCrescent.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16),
            scintillaFreesiaBlendingRefraction.topAnchor.constraint(equalTo: opalineCrescent.bottomAnchor, constant: 12),
            scintillaFreesiaBlendingRefraction.leadingAnchor.constraint(equalTo: opalineCrescent.leadingAnchor),
            scintillaFreesiaBlendingRefraction.trailingAnchor.constraint(equalTo: opalineCrescent.trailingAnchor),
            scintillaFreesiaBlendingRefraction.heightAnchor.constraint(equalTo: opalineCrescent.heightAnchor),
            poppySolsticeFacetMuao.topAnchor.constraint(equalTo: scintillaFreesiaBlendingRefraction.bottomAnchor, constant: 12),
            poppySolsticeFacetMuao.leadingAnchor.constraint(equalTo: opalineCrescent.leadingAnchor),
            poppySolsticeFacetMuao.trailingAnchor.constraint(equalTo: opalineCrescent.trailingAnchor),
            poppySolsticeFacetMuao.heightAnchor.constraint(equalTo: opalineCrescent.heightAnchor),
            camelliaContourCantata.topAnchor.constraint(equalTo: poppySolsticeFacetMuao.bottomAnchor, constant: 12),
            camelliaContourCantata.leadingAnchor.constraint(equalTo: opalineCrescent.leadingAnchor),
            camelliaContourCantata.trailingAnchor.constraint(equalTo: opalineCrescent.trailingAnchor),
            camelliaContourCantata.heightAnchor.constraint(equalTo: opalineCrescent.heightAnchor),
            rosewoodCadenceRipple.topAnchor.constraint(equalTo: camelliaContourCantata.bottomAnchor, constant: 12),
            rosewoodCadenceRipple.leadingAnchor.constraint(equalTo: opalineCrescent.leadingAnchor),
            rosewoodCadenceRipple.trailingAnchor.constraint(equalTo: opalineCrescent.trailingAnchor),
            rosewoodCadenceRipple.heightAnchor.constraint(equalTo: opalineCrescent.heightAnchor)
        ])
    }

    private func magnoliaSymmetryPrismMuz() {
        opalineCrescent.layer.cornerRadius = 45
        scintillaFreesiaBlendingRefraction.layer.cornerRadius = 9
        poppySolsticeFacetMuao.layer.cornerRadius = 7
        camelliaContourCantata.layer.cornerRadius = 18
        rosewoodCadenceRipple.layer.cornerRadius = 18
        NSLayoutConstraint.activate([
            opalineCrescent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 28),
            opalineCrescent.centerXAnchor.constraint(equalTo: centerXAnchor),
            opalineCrescent.widthAnchor.constraint(equalToConstant: 90),
            opalineCrescent.heightAnchor.constraint(equalTo: opalineCrescent.widthAnchor),
            scintillaFreesiaBlendingRefraction.topAnchor.constraint(equalTo: opalineCrescent.bottomAnchor, constant: 18),
            scintillaFreesiaBlendingRefraction.centerXAnchor.constraint(equalTo: centerXAnchor),
            scintillaFreesiaBlendingRefraction.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.46),
            scintillaFreesiaBlendingRefraction.heightAnchor.constraint(equalToConstant: 18),
            poppySolsticeFacetMuao.topAnchor.constraint(equalTo: scintillaFreesiaBlendingRefraction.bottomAnchor, constant: 10),
            poppySolsticeFacetMuao.centerXAnchor.constraint(equalTo: centerXAnchor),
            poppySolsticeFacetMuao.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.62),
            poppySolsticeFacetMuao.heightAnchor.constraint(equalToConstant: 14),
            camelliaContourCantata.topAnchor.constraint(equalTo: poppySolsticeFacetMuao.bottomAnchor, constant: 34),
            camelliaContourCantata.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            camelliaContourCantata.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            camelliaContourCantata.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.23),
            rosewoodCadenceRipple.topAnchor.constraint(equalTo: camelliaContourCantata.bottomAnchor, constant: 24),
            rosewoodCadenceRipple.leadingAnchor.constraint(equalTo: camelliaContourCantata.leadingAnchor),
            rosewoodCadenceRipple.trailingAnchor.constraint(equalTo: camelliaContourCantata.trailingAnchor),
            rosewoodCadenceRipple.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.24)
        ])
    }

    func nacreousStipplingMuz() {
        guard isHidden else { return }
        isHidden = false
        alpha = 1
        tesseraCloverHighlightingCrescent.forEach { porcelainOrchidTracery in
            porcelainOrchidTracery.alpha = 1
        }
        guard !UIAccessibility.isReduceMotionEnabled else { return }
        let synchronizedBeginMuz = CACurrentMediaTime() + 0.05
        auroralShimmerMuz.forEach { roseGoldShimmerMuz in
            let sweepMuz = CABasicAnimation(keyPath: "transform.translation.x")
            sweepMuz.fromValue = -roseGoldShimmerMuz.bounds.width * 0.34
            sweepMuz.toValue = roseGoldShimmerMuz.bounds.width * 0.34
            sweepMuz.duration = 1.25
            sweepMuz.repeatCount = .infinity
            sweepMuz.beginTime = synchronizedBeginMuz
            sweepMuz.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            roseGoldShimmerMuz.add(sweepMuz, forKey: "roseGoldSweepMuz")
        }
    }

    func opalineFreesiaMuz() {
        guard !isHidden else { return }
        tesseraCloverHighlightingCrescent.forEach { porcelainOrchidTracery in
            porcelainOrchidTracery.layer.removeAllAnimations()
            porcelainOrchidTracery.alpha = 1
        }
        auroralShimmerMuz.forEach { $0.removeAllAnimations() }
        UIView.animate(withDuration: 0.18, animations: { [weak self] in
            self?.alpha = 0
        }, completion: { [weak self] _ in
            self?.isHidden = true
            self?.alpha = 1
        })
    }
}

/// Shared artwork for missing, loading and failed images; never persisted as user content.
enum LabradoriteMetalworkOvertureMotif: CaseIterable {
    case moonstoneFrescoSpiralCantata, allegroSaffronCharcoal, smudgingJuniperSolstice, vellumCamelliaChiaroscuroCadence

    static let highlighterMicaTracing = UIColor(red: 27/255, green: 21/255, blue: 35/255, alpha: 1)
    static let traceryAuroralMosaic = UIColor(red: 185/255, green: 145/255, blue: 191/255, alpha: 1)
    private static let mascaraMicaStipplework: [Self: UIImage] = Dictionary(uniqueKeysWithValues: allCases.map { rosewoodSonataMosaicMuao in
        (rosewoodSonataMosaicMuao, rosewoodSonataMosaicMuao.smudgingIridescentThymeLattice())
    })

    var chromaticMetalworkArabesqueAndante: UIImage { Self.mascaraMicaStipplework[self]! }

    func bloomEtchingCadenza(to cadenceIlluminatorGauzeCameo: UIImageView) {
        cadenceIlluminatorGauzeCameo.image = chromaticMetalworkArabesqueAndante
        cadenceIlluminatorGauzeCameo.backgroundColor = Self.highlighterMicaTracing
        cadenceIlluminatorGauzeCameo.tintColor = Self.traceryAuroralMosaic
    }

    private func smudgingIridescentThymeLattice() -> UIImage {
        let nacreousPastelOvertureOpus = CGSize(width: 320, height: 320)
        let tesseraCloverHighlightingCrescent = UIGraphicsImageRendererFormat(); tesseraCloverHighlightingCrescent.opaque = true
        return UIGraphicsImageRenderer(size: nacreousPastelOvertureOpus, format: tesseraCloverHighlightingCrescent).image { mosaicBlendingArpeggioMuz in
            let veilSageColorwashAperture = [Self.highlighterMicaTracing.cgColor, UIColor(red: 44/255, green: 29/255, blue: 51/255, alpha: 1).cgColor] as CFArray
            if let cadenceCoralPorcelain = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: veilSageColorwashAperture, locations: [0, 1]) {
                mosaicBlendingArpeggioMuz.cgContext.drawLinearGradient(cadenceCoralPorcelain, start: .zero, end: CGPoint(x: 320, y: 320), options: [])
            }
            let rhapsodyLabradoriteGauze: String
            switch self {
            case .moonstoneFrescoSpiralCantata: rhapsodyLabradoriteGauze = NacreousPastelOvertureOpus("pUeMrcsroOn0.pffi0l7lT")
            case .allegroSaffronCharcoal: rhapsodyLabradoriteGauze = NacreousPastelOvertureOpus("pxhmoptpot")
            case .smudgingJuniperSolstice: rhapsodyLabradoriteGauze = NacreousPastelOvertureOpus("p6leahy3.orHe8cRtAapn4gjlleP")
            case .vellumCamelliaChiaroscuroCadence: rhapsodyLabradoriteGauze = NacreousPastelOvertureOpus("p4lau5sR")
            }
            let mosaicOsmanthusEtchingOverture: CGFloat = self == .moonstoneFrescoSpiralCantata ? 132 : 72
            if let diffusingPoppyTessellation = UIImage(systemName: rhapsodyLabradoriteGauze, withConfiguration: UIImage.SymbolConfiguration(pointSize: mosaicOsmanthusEtchingOverture, weight: .light))?.withTintColor(Self.traceryAuroralMosaic, renderingMode: .alwaysOriginal) {
                let tightlineBerylJuniperEnamel = mosaicOsmanthusEtchingOverture * diffusingPoppyTessellation.size.height / max(diffusingPoppyTessellation.size.width, 1)
                diffusingPoppyTessellation.draw(in: CGRect(x: (320-mosaicOsmanthusEtchingOverture)/2, y: (320-tightlineBerylJuniperEnamel)/2, width: mosaicOsmanthusEtchingOverture, height: tightlineBerylJuniperEnamel))
            }
        }.withRenderingMode(.alwaysOriginal)
    }
}
