import UIKit

final class IridescentPeonyCadenceMuz: UIRefreshControl {
    private static let nacreousPetalAccent = UIColor(red: 239/255, green: 151/255, blue: 229/255, alpha: 1)

    override init() {
        super.init()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }

    private func configureAppearance() {
        tintColor = Self.nacreousPetalAccent
        backgroundColor = .clear
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
        UIView.animate(
            withDuration: 0.82,
            delay: 0,
            options: [.autoreverse, .repeat, .allowUserInteraction, .curveEaseInOut]
        ) { [weak self] in
            self?.tesseraCloverHighlightingCrescent.forEach { porcelainOrchidTracery in
                porcelainOrchidTracery.alpha = 0.42
            }
        }
    }

    func opalineFreesiaMuz() {
        guard !isHidden else { return }
        tesseraCloverHighlightingCrescent.forEach { porcelainOrchidTracery in
            porcelainOrchidTracery.layer.removeAllAnimations()
            porcelainOrchidTracery.alpha = 1
        }
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
