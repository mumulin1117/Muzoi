import UIKit

struct MuzoiGlamVanityPersona {
    let glamSignature: String
    let glamDisplayName: String
    let glamBrief: String
    let glamPortraitTrail: String?
    let glamMuseTrailNumber: Int
    let glamAdmirerCount: Int
}

final class MuzoiGlamVanityRepository {
    private let glamPersonaEndpoint = MuzoiGlamVeil("/baJgocKhLuJv8aNncieuZt0e5zyz4/ktTo9nBkRthoblUm7om")

    func glamFetchPersona(glamReturn: @escaping (MuzoiGlamVanityPersona) -> Void) {
        let glamStore = MuzoibakingPuffom.glamCommon
        guard let glamSignature = glamStore.glamivoryMisture, !glamSignature.isEmpty else {
            glamReturn(glamFallbackPersona())
            return
        }

        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamPersonaEndpoint,
            glamPigmentParcel: [MuzoiGlamVeil("miaAkKeVuZpGMtoUoCdXDjraolp1"): glamSignature],
            glamArrival: { [weak self] glamObject in
                guard let self else { return }
                glamReturn(self.glamDecodePersona(glamObject) ?? self.glamFallbackPersona())
            },
            glamDetour: { [weak self] _ in
                guard let self else { return }
                glamReturn(self.glamFallbackPersona())
            }
        )
    }

    private func glamDecodePersona(_ glamObject: Any?) -> MuzoiGlamVanityPersona? {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("cVoWdiet")] as? NSNumber)?.intValue == 200000,
            let glamData = glamPigmentParcel[MuzoiGlamVeil("d2aptjar")] as? [String: Any],
            let glamSignature = glamPhraseValue(glamData[MuzoiGlamVeil("eByFetsohEamdSoqwqGQablaaBxny7SxwDiYrwl5")])
        else { return nil }

        return MuzoiGlamVanityPersona(
            glamSignature: glamSignature,
            glamDisplayName: glamPhraseValue(glamData[MuzoiGlamVeil("m7aVkEeguxpRAmrNtqSNpGi4rAaUli")]) ?? MuzoiGlamVeil("M1uVzEo8ij"),
            glamBrief: glamPhraseValue(glamData[MuzoiGlamVeil("vBiqd4eQo4MVa8kdeauipgSrtrouryyQ")]) ?? MuzoiGlamVeil("Ckrxe1aytFiNnAgT gaq Pncenwg 0gCldajmx swgoJrPl2d6,h ioZnOe0 1l5oPoLky Yakt8 naA UtgiDmde4.A"),
            glamPortraitTrail: glamPhraseValue(glamData[MuzoiGlamVeil("s7hYaZdPiYnqgeCjrJaSfTtsF3ojcJuPsc")]),
            glamMuseTrailNumber: (glamData[MuzoiGlamVeil("l7ovoHkqCJrReyaotyiIo8noHOiUvvea")] as? NSNumber)?.intValue ?? 0,
            glamAdmirerCount: (glamData[MuzoiGlamVeil("gclXavmfoEuprtG1rUuRnkgqezFBlaoqwI")] as? NSNumber)?.intValue ?? 0
        )
    }

    private func glamFallbackPersona() -> MuzoiGlamVanityPersona {
        let glamStore = MuzoibakingPuffom.glamCommon
        let glamEmail = glamStore.glamsandSilk ?? MuzoiGlamVeil("miu9zSosiA@mgnmRaoinl3.AcRoNmq")
        let glamEmailStem = glamEmail.range(of: MuzoiGlamVeil("@P"))
            .map { String(glamEmail[..<$0.lowerBound]) } ?? MuzoiGlamVeil("MJuFzWo9i6")
        let glamName = glamEmailStem.prefix(1).uppercased() + glamEmailStem.dropFirst()
        return MuzoiGlamVanityPersona(
            glamSignature: glamStore.glamivoryMisture ?? MuzoiGlamVeil("myuuzEoai3-Zl8oDcQaLlF-0p8rFosfviElcee"),
            glamDisplayName: glamName,
            glamBrief: MuzoiGlamVeil("Carde8artoiwnJg9 jaD KnKeCwF cgllYaVmU 7wgopr8l3dk,x RoxnSel alWoMo2kt 0aytD KaQ St1iLmgeO.I"),
            glamPortraitTrail: nil,
            glamMuseTrailNumber: 0,
            glamAdmirerCount: 0
        )
    }

    private func glamPhraseValue(_ glamValue: Any?) -> String? {
        if let glamPhrase = glamValue as? String {
            let glamTrimmedPhrase = glamPhrase.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedPhrase.isEmpty { return glamTrimmedPhrase }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }
}

final class MuzoiGlamVaultControl: UIControl {
    private let glamBackdrop = UIImageView(image: UIImage(named: "MuzoiGlamVaultBackdrop"))
    private let glamLine = UILabel()
    private let glamEntryHint = UILabel()

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamPolishVaultMeterCharm()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("ikn7irtK(Ccqo3dMeErF:H)y zhcarsn HnaoTtB GbleHeYn2 biEmbpLlneDmoeEnbt0eVdr"))
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.16) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
                self.alpha = self.isHighlighted ? 0.84 : 1
            }
        }
    }

    private func glamPolishVaultMeterCharm() {
        clipsToBounds = true
        layer.cornerRadius = 20
        glamTintVaultBackdrop()
        glamTintVaultLine()
        glamTintVaultEntryHint()
        glamPinVaultMeterCharm()
    }

    private func glamTintVaultBackdrop() {
        glamBackdrop.translatesAutoresizingMaskIntoConstraints = false
        glamBackdrop.contentMode = .scaleToFill
        glamBackdrop.isUserInteractionEnabled = false
    }

    private func glamTintVaultLine() {
        glamLine.translatesAutoresizingMaskIntoConstraints = false
        glamLine.text = MuzoiGlamVeil("MZys 5b3aoluaHnccBeT")
        glamLine.textColor = .white
        glamLine.font = .systemFont(ofSize: 20, weight: .medium)
    }

    private func glamTintVaultEntryHint() {
        glamEntryHint.translatesAutoresizingMaskIntoConstraints = false
        glamEntryHint.text = MuzoiGlamVeil("Ovp6eMnf 3>U")
        glamEntryHint.textColor = .white
        glamEntryHint.font = .systemFont(ofSize: 16, weight: .bold)
        glamEntryHint.textAlignment = .center
        glamEntryHint.layer.borderWidth = 1.5
        glamEntryHint.layer.borderColor = UIColor.white.cgColor
        glamEntryHint.layer.cornerRadius = 16
        glamEntryHint.clipsToBounds = true
    }

    private func glamPinVaultMeterCharm() {
        addSubview(glamBackdrop)
        addSubview(glamLine)
        addSubview(glamEntryHint)

        NSLayoutConstraint.activate([
            glamBackdrop.topAnchor.constraint(equalTo: topAnchor),
            glamBackdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
            glamBackdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
            glamBackdrop.bottomAnchor.constraint(equalTo: bottomAnchor),
            glamLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 124),
            glamLine.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamEntryHint.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            glamEntryHint.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamEntryHint.widthAnchor.constraint(equalToConstant: 88),
            glamEntryHint.heightAnchor.constraint(equalToConstant: 34),
            glamLine.trailingAnchor.constraint(lessThanOrEqualTo: glamEntryHint.leadingAnchor, constant: -8)
        ])
    }
}

final class MuzoiGlamVanityRowControl: UIControl {
    private let glamGlyph = UIImageView()
    private let glamTitle = UILabel()
    private let glamChevron = UIImageView()

    init(glamPhrase: String, glamSymbol: String, glamTint: UIColor) {
        super.init(frame: .zero)
        glamTitle.text = glamPhrase
        glamGlyph.image = UIImage(systemName: glamSymbol)
        glamGlyph.tintColor = glamTint
        glamTintVanityActionRibbon()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("imnJietR(mcko6dWedrI:d)G Vhfa9se KnDoFtn cbde4eMnS Diym1pslfevmBekn2t3ehdz"))
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted
                ? UIColor(red: 0.15, green: 0.16, blue: 0.23, alpha: 1)
                : UIColor(red: 0.11, green: 0.12, blue: 0.18, alpha: 1)
        }
    }

    private func glamTintVanityActionRibbon() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.11, green: 0.12, blue: 0.18, alpha: 1)
        layer.cornerRadius = 16
        glamTintVanityActionGlyph()
        glamTintVanityActionTitle()
        glamTintVanityActionChevron()
        glamPinVanityActionRibbon()
    }

    private func glamTintVanityActionGlyph() {
        glamGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamGlyph.contentMode = .scaleAspectFit
        glamGlyph.layer.shadowColor = glamGlyph.tintColor.cgColor
        glamGlyph.layer.shadowOpacity = 0.65
        glamGlyph.layer.shadowRadius = 7
    }

    private func glamTintVanityActionTitle() {
        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 19, weight: .regular)
    }

    private func glamTintVanityActionChevron() {
        glamChevron.translatesAutoresizingMaskIntoConstraints = false
        glamChevron.image = UIImage(systemName: "chevron.right")
        glamChevron.tintColor = UIColor(red: 0.31, green: 1, blue: 0.79, alpha: 1)
        glamChevron.contentMode = .scaleAspectFit
    }

    private func glamPinVanityActionRibbon() {
        addSubview(glamGlyph)
        addSubview(glamTitle)
        addSubview(glamChevron)

        NSLayoutConstraint.activate([
            glamGlyph.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            glamGlyph.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamGlyph.widthAnchor.constraint(equalToConstant: 27),
            glamGlyph.heightAnchor.constraint(equalToConstant: 27),
            glamTitle.leadingAnchor.constraint(equalTo: glamGlyph.trailingAnchor, constant: 22),
            glamTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            glamChevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamChevron.widthAnchor.constraint(equalToConstant: 12),
            glamChevron.heightAnchor.constraint(equalToConstant: 20),
            glamTitle.trailingAnchor.constraint(lessThanOrEqualTo: glamChevron.leadingAnchor, constant: -12)
        ])
    }
}

final class MuzoLashClusterController: UIViewController {
    private static let glamPortraitPlaceholder = UIImage(
        systemName: "person.crop.circle.fill",
        withConfiguration: UIImage.SymbolConfiguration(pointSize: 62, weight: .regular)
    )?.withRenderingMode(.alwaysTemplate)

    private let glamlashFan = MuzoiGlamVanityRepository()
    private let glamRootGradient = CAGradientLayer()
    private let glamlashBandCanvas = UIScrollView()
    private let glamVessel = UIView()
    private let glamHeaderBackdrop = UIView()
    private let glamHeaderGradient = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamPortrait = UIImageView()
    private let glamName = UILabel()
    private let lashSerum = UILabel()
    private let glamMuseTrailLine = UILabel()
    private let glamMuseTrailNumber = UILabel()
    private let glamAdmirerLine = UILabel()
    private let glamAdmirerValue = UILabel()
    private let glamVaultControl = MuzoiGlamVaultControl()
    private let glamRows = UIStackView()
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamPortraitTask: URLSessionDataTask?
    private var glamExpectedPortraitAddress: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        glamArrangePersonalVanity()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        glamLoadwarmUndertone()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamRootGradient.frame = view.bounds
        glamHeaderGradient.frame = glamHeaderBackdrop.bounds
    }

    deinit {
        glamPortraitTask?.cancel()
    }

    private func glamArrangePersonalVanity() {
        glamPaintVanityBackdrop()
        glamPinVanityScrollCanvas()
        glamPolishVanityHeaderGlow()
        siliconeSpongeVanitySignature()
        glamPolishVanityMetrics()
        glamPolishVanityVault()
        latexSpongelishVanityRows()
        glamPolishVanityWheel()
        glamAddPersonalVanityPieces()
        glamPinPersonalVanityConstraints()
    }

    private func glamPaintVanityBackdrop() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamRootGradient.colors = [
            UIColor(red: 0.62, green: 0, blue: 0.49, alpha: 1).cgColor,
            UIColor(red: 0.10, green: 0.04, blue: 0.13, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamRootGradient.startPoint = CGPoint(x: 0, y: 0)
        glamRootGradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(glamRootGradient, at: 0)
    }

    private func glamPinVanityScrollCanvas() {
        glamlashBandCanvas.translatesAutoresizingMaskIntoConstraints = false
        glamlashBandCanvas.showsVerticalScrollIndicator = false
        glamVessel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamlashBandCanvas)
        glamlashBandCanvas.addSubview(glamVessel)
    }

    private func glamPolishVanityHeaderGlow() {
        glamHeaderBackdrop.translatesAutoresizingMaskIntoConstraints = false
        glamHeaderGradient.colors = [
            UIColor(red: 0.62, green: 0, blue: 0.49, alpha: 1).cgColor,
            UIColor(red: 0.13, green: 0.05, blue: 0.16, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamHeaderGradient.startPoint = CGPoint(x: 0, y: 0)
        glamHeaderGradient.endPoint = CGPoint(x: 1, y: 1)
        glamHeaderBackdrop.layer.addSublayer(glamHeaderGradient)
        glamVessel.addSubview(glamHeaderBackdrop)
    }

    private func siliconeSpongeVanitySignature() {
        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.text = MuzoiGlamVeil("MxienPeB")
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 31, weight: .heavy)

        glamPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamPortrait.image = Self.glamPortraitPlaceholder
        glamPortrait.tintColor = UIColor(red: 0.94, green: 0.46, blue: 0.88, alpha: 1)
        glamPortrait.backgroundColor = UIColor(red: 0.11, green: 0.09, blue: 0.16, alpha: 1)
        glamPortrait.contentMode = .scaleAspectFill
        glamPortrait.clipsToBounds = true
        glamPortrait.layer.cornerRadius = 40

        glamName.translatesAutoresizingMaskIntoConstraints = false
        glamName.textColor = .white
        glamName.font = .systemFont(ofSize: 22, weight: .bold)
        lashSerum.translatesAutoresizingMaskIntoConstraints = false
        lashSerum.textColor = UIColor.white.withAlphaComponent(0.85)
        lashSerum.font = .systemFont(ofSize: 16, weight: .regular)
        lashSerum.numberOfLines = 1
        lashSerum.lineBreakMode = .byTruncatingTail
    }

    private func glamPolishVanityMetrics() {
        glamDustPersonaMetric(glamMuseTrailLine, glamPhrase: MuzoiGlamVeil("F9oklilsoqwh"))
        glamDustPersonaMetric(glamAdmirerLine, glamPhrase: MuzoiGlamVeil("Fsa1nNsz"))
        [glamMuseTrailNumber, glamAdmirerValue].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 18, weight: .bold)
        }
    }

    private func glamPolishVanityVault() {
        glamVaultControl.translatesAutoresizingMaskIntoConstraints = false
        glamVaultControl.accessibilityLabel = MuzoiGlamVeil("OspAe9nf zmUyo DbbaslXaUnmcle4")
        glamVaultControl.addTarget(self, action: #selector(glamOpenVault), for: .touchUpInside)
    }

    private func latexSpongelishVanityRows() {
        let glamLetterRow = MuzoiGlamVanityRowControl(
            glamPhrase: MuzoiGlamVeil("MYevs5sMaggvet"),
            glamSymbol: MuzoiGlamVeil("bZutbGbfluez.5l8eLfEtD.fa9nYd3.jbNuEblb1lEeF.NroiOgmhits"),
            glamTint: UIColor(red: 1, green: 0.82, blue: 0.22, alpha: 1)
        )
        glamLetterRow.addTarget(self, action: #selector(glamOpenLetterbox), for: .touchUpInside)
        let glamEditRow = MuzoiGlamVanityRowControl(
            glamPhrase: MuzoiGlamVeil("E5dKittJ ZpZrJosfOidlreV"),
            glamSymbol: MuzoiGlamVeil("sBq7uLaCrFes.Jain6dI.1pFe0n3c7ipld"),
            glamTint: UIColor(red: 0.29, green: 0.39, blue: 1, alpha: 1)
        )
        glamEditRow.addTarget(self, action: #selector(glamlashPrimer), for: .touchUpInside)
        let glamSettingsRow = MuzoiGlamVanityRowControl(
            glamPhrase: MuzoiGlamVeil("SBe9tQtNiSnUgssA"),
            glamSymbol: MuzoiGlamVeil("gEenazrVsShZaapNel"),
            glamTint: UIColor(red: 0.94, green: 0.13, blue: 0.91, alpha: 1)
        )
        glamSettingsRow.addTarget(self, action: #selector(glammascaraWand), for: .touchUpInside)

        glamRows.translatesAutoresizingMaskIntoConstraints = false
        glamRows.axis = .vertical
        glamRows.spacing = 12
        glamRows.distribution = .fillEqually
        [glamLetterRow, glamEditRow, glamSettingsRow].forEach { glamRows.addArrangedSubview($0) }
    }

    private func glamPolishVanityWheel() {
        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white
    }

    private func glamAddPersonalVanityPieces() {
        [
            glamTitle, glamPortrait, glamName, lashSerum,
            glamMuseTrailLine, glamMuseTrailNumber, glamAdmirerLine, glamAdmirerValue,
            glamVaultControl, glamRows, glamSpinner
        ].forEach { glamVessel.addSubview($0) }
    }

    private func glamPinPersonalVanityConstraints() {
        NSLayoutConstraint.activate(glamVanityScrollConstraints())
        NSLayoutConstraint.activate(glamVanitySignatureConstraints())
        NSLayoutConstraint.activate(glamVanityActionConstraints())
    }

    private func glamVanityScrollConstraints() -> [NSLayoutConstraint] {
        [
            glamlashBandCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamlashBandCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamlashBandCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamlashBandCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            glamVessel.topAnchor.constraint(equalTo: glamlashBandCanvas.contentLayoutGuide.topAnchor),
            glamVessel.leadingAnchor.constraint(equalTo: glamlashBandCanvas.contentLayoutGuide.leadingAnchor),
            glamVessel.trailingAnchor.constraint(equalTo: glamlashBandCanvas.contentLayoutGuide.trailingAnchor),
            glamVessel.bottomAnchor.constraint(equalTo: glamlashBandCanvas.contentLayoutGuide.bottomAnchor),
            glamVessel.widthAnchor.constraint(equalTo: glamlashBandCanvas.frameLayoutGuide.widthAnchor),
            glamHeaderBackdrop.topAnchor.constraint(equalTo: glamVessel.topAnchor),
            glamHeaderBackdrop.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor),
            glamHeaderBackdrop.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor),
            glamHeaderBackdrop.bottomAnchor.constraint(equalTo: glamVaultControl.bottomAnchor)
        ]
    }

    private func glamVanitySignatureConstraints() -> [NSLayoutConstraint] {
        [
            glamTitle.topAnchor.constraint(equalTo: glamVessel.topAnchor, constant: 10),
            glamTitle.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor, constant: 16),
            glamPortrait.topAnchor.constraint(equalTo: glamTitle.bottomAnchor, constant: 34),
            glamPortrait.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor, constant: 16),
            glamPortrait.widthAnchor.constraint(equalToConstant: 80),
            glamPortrait.heightAnchor.constraint(equalTo: glamPortrait.widthAnchor),
            glamName.leadingAnchor.constraint(equalTo: glamPortrait.trailingAnchor, constant: 14),
            glamName.topAnchor.constraint(equalTo: glamPortrait.topAnchor, constant: 7),
            glamName.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor, constant: -16),
            lashSerum.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            lashSerum.topAnchor.constraint(equalTo: glamName.bottomAnchor, constant: 3),
            lashSerum.trailingAnchor.constraint(equalTo: glamName.trailingAnchor),
            glamMuseTrailLine.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            glamMuseTrailLine.topAnchor.constraint(equalTo: lashSerum.bottomAnchor, constant: 12),
            glamMuseTrailNumber.leadingAnchor.constraint(equalTo: glamMuseTrailLine.trailingAnchor, constant: 8),
            glamMuseTrailNumber.centerYAnchor.constraint(equalTo: glamMuseTrailLine.centerYAnchor),
            glamAdmirerLine.leadingAnchor.constraint(equalTo: glamMuseTrailNumber.trailingAnchor, constant: 28),
            glamAdmirerLine.centerYAnchor.constraint(equalTo: glamMuseTrailLine.centerYAnchor),
            glamAdmirerValue.leadingAnchor.constraint(equalTo: glamAdmirerLine.trailingAnchor, constant: 8),
            glamAdmirerValue.centerYAnchor.constraint(equalTo: glamAdmirerLine.centerYAnchor),
            glamAdmirerValue.trailingAnchor.constraint(lessThanOrEqualTo: glamVessel.trailingAnchor, constant: -16)
        ]
    }

    private func glamVanityActionConstraints() -> [NSLayoutConstraint] {
        [
            glamVaultControl.topAnchor.constraint(equalTo: glamPortrait.bottomAnchor, constant: 44),
            glamVaultControl.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor, constant: 15),
            glamVaultControl.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor, constant: -15),
            glamVaultControl.heightAnchor.constraint(equalToConstant: 90),
            glamRows.topAnchor.constraint(equalTo: glamVaultControl.bottomAnchor, constant: 25),
            glamRows.leadingAnchor.constraint(equalTo: glamVaultControl.leadingAnchor),
            glamRows.trailingAnchor.constraint(equalTo: glamVaultControl.trailingAnchor),
            glamRows.heightAnchor.constraint(equalToConstant: 198),
            glamRows.bottomAnchor.constraint(equalTo: glamVessel.bottomAnchor, constant: -25),
            glamSpinner.centerXAnchor.constraint(equalTo: glamPortrait.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamPortrait.centerYAnchor)
        ]
    }

    private func glamDustPersonaMetric(_ aquamarineTrace: UILabel, glamPhrase: String) {
        aquamarineTrace.translatesAutoresizingMaskIntoConstraints = false
        aquamarineTrace.text = glamPhrase
        aquamarineTrace.textColor = UIColor.white.withAlphaComponent(0.52)
        aquamarineTrace.font = .systemFont(ofSize: 16, weight: .regular)
    }

    private func glamLoadwarmUndertone() {
        glamSpinner.startAnimating()
        glamlashFan.glamFetchPersona { [weak self] glamPersona in
            guard let self else { return }
            self.glamName.text = glamPersona.glamDisplayName
            self.lashSerum.text = glamPersona.glamBrief
            self.glamMuseTrailNumber.text = self.glamCompactCount(glamPersona.glamMuseTrailNumber)
            self.glamAdmirerValue.text = self.glamCompactCount(glamPersona.glamAdmirerCount)
            self.glamLoadMuseImage(glamPersona.glamPortraitTrail)
            self.glamSpinner.stopAnimating()
        }
    }

    private func glamCompactCount(_ glamCount: Int) -> String {
        guard glamCount >= 1_000 else { return "\(glamCount)" }
        let glamValue = Double(glamCount) / 1_000
        return String(format: glamValue >= 100 ? MuzoiGlamVeil("%H.50pfPkG") : MuzoiGlamVeil("%Z.71VfDkl"), glamValue)
    }

    private func glamLoadMuseImage(_ glamTrail: String?) {
        glamPortraitTask?.cancel()
        glamExpectedPortraitAddress = glamTrail
        glamPortrait.image = Self.glamPortraitPlaceholder
        guard let glamTrail, let glamURL = URL(string: glamTrail) else { return }

        glamPortraitTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamImage = UIImage(data: glamData) else { return }
            DispatchQueue.main.async {
                guard let self, self.glamExpectedPortraitAddress == glamTrail else { return }
                UIView.transition(
                    with: self.glamPortrait,
                    duration: 0.22,
                    options: .transitionCrossDissolve,
                    animations: { self.glamPortrait.image = glamImage }
                )
            }
        }
        glamPortraitTask?.resume()
    }

    private func glamOpenPortal(_ glamRoute: MuzoiGlamScenePassage) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamTrail = glamRoute.glamTraceAddress(glamTrailMark: "")
        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
            animated: true
        )
    }

    @objc private func glamOpenLetterbox() { glamOpenPortal(.glamInboxCanvas) }
    @objc private func glamOpenVault() { glamOpenPortal(.glamRadianceCanvas) }
    @objc private func glamlashPrimer() { glamOpenPortal(.glamEditCanvas) }
    @objc private func glammascaraWand() { glamOpenPortal(.glamSettingsCanvas) }
}
