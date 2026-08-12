import UIKit

struct MuzoiGlamEssenceFeature {
    let glamsheerLoomSignature: String
    let glammatteBloom: String
    let glamskinDew: String
    let glamRuneskinElixir: String
    let glamPortraitTrail: String?
    let glamIsTrending: Bool
}

struct MuzoiGlamMusePersona {
    let glamdewyPetalture: String
    let glamsatinVeilskinBalm: String
    let glamGalleryPhrase: String
    let glamskinMilk: String
    let glamPortraitTrail: String?
    let glamvelvetGleamNew: Bool
}

final class MuzoimetallicPetalRepository {
    private let foilGlimmerEndpoint = MuzoiGlamVeil("/fqipCs9vZdLffrlsPz0/hvpsIw4qAsSaG")
    private let glamMuseEndpoint = MuzoiGlamVeil("/cw1mqh8udpatWqgcFjhaKokfSe1app9zY/3tigOcqsTxt")

    func glamshimmerDust(
        glamReturn: @escaping ([MuzoiGlamEssenceFeature], [MuzoiGlamMusePersona]) -> Void
    ) {
        let glamArrivalSet = DispatchGroup()
        var glamFeatureResults = glamFallbackFeatures()
        var glamMuseResults = glamFallbackPersonas()
        let glamAromaEnvelope: [String: Any] = [
            MuzoiGlamVeil("eAd9ictMosrNivaOlTGwlsoWwG"): MuzoiGlamVeil("9V3W2M1P9Q7c1R4P"),
            MuzoiGlamVeil("b3lKeyngdMilnvgFSKymmRpphvoknXye"): 10,
            MuzoiGlamVeil("pHi0g9mkeHnjt3BGl6i0sFsd"): 2,
            MuzoiGlamVeil("mSaBkJeeuLpPS8tiomrSyDtJealDlZi3nBgK"): 1,
            MuzoiGlamVeil("ndeAoyngE6yyeqsph4aBdCoGwK"): 5
        ]

        glamArrivalSet.enter()
        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: foilGlimmerEndpoint,
            glamPigmentParcel: glamAromaEnvelope,
            glamArrival: { [weak self] glamObject in
                defer { glamArrivalSet.leave() }
                guard let self else { return }
                let glamFeatures = self.glamDecodeAromaFeatures(glamObject)
                if !glamFeatures.isEmpty { glamFeatureResults = glamFeatures }
            },
            glamDetour: { _ in
                glamArrivalSet.leave()
            }
        )

        glamArrivalSet.enter()
        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamMuseEndpoint,
            glamPigmentParcel: [MuzoiGlamVeil("gDlkaWmHTtrBaSnRsJf9o4rxmhaCteixonnt"): MuzoiGlamVeil("9P3W2Y1Z9M7d1L4X")],
            glamArrival: { [weak self] glamObject in
                defer { glamArrivalSet.leave() }
                guard let self else { return }
                let glamPersonas = self.glamDecodeMuseProfiles(glamObject)
                if !glamPersonas.isEmpty { glamMuseResults = glamPersonas }
            },
            glamDetour: { _ in
                glamArrivalSet.leave()
            }
        )

        glamArrivalSet.notify(queue: .main) {
            glamReturn(glamFeatureResults, glamMuseResults)
        }
    }

    private func glamDecodeAromaFeatures(_ glamObject: Any?) -> [MuzoiGlamEssenceFeature] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("c6o1drem")] as? NSNumber)?.intValue == 200000,
            let glamAromaRows = glamPigmentParcel[MuzoiGlamVeil("dJapt4aY")] as? [[String: Any]]
        else { return [] }

        return glamAromaRows.compactMap { glamRow in
            guard let glamSignature = glamPhraseValue(glamRow[MuzoiGlamVeil("sohSiWm1moe1rmD8emtEaoipldsk")]) else { return nil }
            let glamImageChoices = (glamRow[MuzoiGlamVeil("sitiyAlGekGElsoTwWIOn4sIifgYhTtn")] as? [String])
                ?? (glamRow[MuzoiGlamVeil("pRaXirn0tKeIdxPQeqrpsZolnTaG")] as? [String])
                ?? []
            let glamPraiseCount = glamRow[MuzoiGlamVeil("csoTlCoSrDT5hpeBonrry0Bxe6aUuktuyr")] as? Int ?? 0
            return MuzoiGlamEssenceFeature(
                glamsheerLoomSignature: glamSignature,
                glammatteBloom: glamPhraseValue(glamRow[MuzoiGlamVeil("c6o6mrpnl4eXxbiJo1nGCNolnrtrrlo3ld")]) ?? MuzoiGlamVeil("ADr9opmJaM RIPnJsapKiZr7aatIiYoVn2"),
                glamskinDew: glamAromaSummary(glamPhraseValue(glamRow[MuzoiGlamVeil("bseBazuatpyvSNtFaOt9e2mbeonjtE")])),
                glamRuneskinElixir: "MuzoiGlamEssence01",
                glamPortraitTrail: glamImageChoices.first ?? (glamRow[MuzoiGlamVeil("cIrxefaPtmiwvWihtEyuGBldoMwau4pb")] as? String),
                glamIsTrending: glamPraiseCount >= 30
            )
        }
    }

    private func glamPhraseValue(_ glamValue: Any?) -> String? {
        if let glamPhrase = glamValue as? String, !glamPhrase.isEmpty { return glamPhrase }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }

    private func glamDecodeMuseProfiles(_ glamObject: Any?) -> [MuzoiGlamMusePersona] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("c9oLd3eJ")] as? NSNumber)?.intValue == 200000,
            let glamMuseRows = glamPigmentParcel[MuzoiGlamVeil("dHaetSa1")] as? [[String: Any]]
        else { return [] }

        return glamMuseRows.compactMap { glamRow in
            guard let glamSignature = glamPhraseValue(glamRow[MuzoiGlamVeil("mBaPkfeNu4pdAGlncyhCedmvyH")]) else { return nil }
            let glamMuseTrailCount = (glamRow[MuzoiGlamVeil("sOpZaArtkdlNezD5eJtBaHiWlfsF")] as? NSNumber)?.intValue ?? 0
            return MuzoiGlamMusePersona(
                glamdewyPetalture: glamSignature,
                glamsatinVeilskinBalm: glamPhraseValue(glamRow[MuzoiGlamVeil("bzeraWudtIyLE6xkpWrqe6s3sfipo6nZies8mt")]) ?? MuzoiGlamVeil("M9unz3oVi5 2Mau7sNea"),
                glamGalleryPhrase: "\(glamMuseTrailCount)" + MuzoiGlamVeil(" MfIoxlklAoUw6e6rCsx"),
                glamskinMilk: "MuzoiGlamMuse01",
                glamPortraitTrail: glamRow[MuzoiGlamVeil("sffnxJMfa2k3ebu6pNMRaUsDthe7rEyk")] as? String,
                glamvelvetGleamNew: (glamRow[MuzoiGlamVeil("bEeiaZu6tbyFN6abrprUavtTi9vueu")] as? NSNumber)?.intValue == 1
            )
        }
    }

    private func glamAromaSummary(_ glamPhrase: String?) -> String {
        guard let glamPhrase, !glamPhrase.isEmpty else { return MuzoiGlamVeil("D1iZsQc8ovvReWru Atlhmivsc 3a7rwoLmkaatpi9cJ Piun7sApWiEruaet4i9o8nA") }
        let glamOpening = glamPhrase.range(of: MuzoiGlamVeil(".l"))
            .map { String(glamPhrase[..<$0.lowerBound]) } ?? glamPhrase
        return glamOpening.replacingOccurrences(of: MuzoiGlamVeil("C3hGajreaccWtCeXr5i9sWtiiFcNsv:D"), with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func glamFallbackFeatures() -> [MuzoiGlamEssenceFeature] {
        [
            MuzoiGlamEssenceFeature(
                glamsheerLoomSignature: MuzoiGlamVeil("7K0y3y4J0c37160f8p9m1K3k2W2s1P"),
                glammatteBloom: MuzoiGlamVeil("Sdt1aVt9e2mLePnntO sEUy1eY KMmaQkTeDuepp"),
                glamskinDew: MuzoiGlamVeil("BEo9lFdE tcmoPlro9rA sannUdG KpXrJekcKiSsfex EdreUtYagiElA"),
                glamRuneskinElixir: "MuzoiGlamEssence01",
                glamPortraitTrail: nil,
                glamIsTrending: true
            ),
            MuzoiGlamEssenceFeature(
                glamsheerLoomSignature: MuzoiGlamVeil("7i0c3F480T3s1Q088V9s2b134p1f3f"),
                glammatteBloom: MuzoiGlamVeil("N1aetxuQrwaKlD LG1lDo8wp GHIi7glhUl5idgwhUt5iSnNg1"),
                glamskinDew: MuzoiGlamVeil("SgoTfEtC,z Nr2aydXiXaNnxtf 9dxeKfji9nAiRtji1oen4"),
                glamRuneskinElixir: "MuzoiGlamEssence02",
                glamPortraitTrail: nil,
                glamIsTrending: true
            ),
            MuzoiGlamEssenceFeature(
                glamsheerLoomSignature: MuzoiGlamVeil("7Y0q3g4z06391P0G849I0D9y142T5Z"),
                glammatteBloom: MuzoiGlamVeil("FFlKa2whlGeMspsS 9BvaLsOed HAapVp8lliPcxaIt5iqoenH"),
                glamskinDew: MuzoiGlamVeil("SimHowoytOho wa1nSdq RpRoRlGiqsjhvecd6 RcNoDmLppleeUxGi0ownO"),
                glamRuneskinElixir: "MuzoiGlamEssence03",
                glamPortraitTrail: nil,
                glamIsTrending: false
            )
        ]
    }

    private func glamFallbackPersonas() -> [MuzoiGlamMusePersona] {
        [
            MuzoiGlamMusePersona(
                glamdewyPetalture: MuzoiGlamVeil("mwulsoe4-nduohrYa9"),
                glamsatinVeilskinBalm: MuzoiGlamVeil("DNoYrUaQ"),
                glamGalleryPhrase: MuzoiGlamVeil("8d3G9L ifqotlDlroPweeDr2sM"),
                glamskinMilk: "MuzoiGlamMuse01",
                glamPortraitTrail: nil,
                glamvelvetGleamNew: true
            ),
            MuzoiGlamMusePersona(
                glamdewyPetalture: MuzoiGlamVeil("mLuys4eL-OpteCnwaI"),
                glamsatinVeilskinBalm: MuzoiGlamVeil("PbeknuaX"),
                glamGalleryPhrase: MuzoiGlamVeil("7q2J1q LfboclDl2oiw0e8rVsJ"),
                glamskinMilk: "MuzoiGlamMuse02",
                glamPortraitTrail: nil,
                glamvelvetGleamNew: true
            ),
            MuzoiGlamMusePersona(
                glamdewyPetalture: MuzoiGlamVeil("mouOsWeC-tsmuRtstaoxnx"),
                glamsatinVeilskinBalm: MuzoiGlamVeil("SBuwt0tUoWn0"),
                glamGalleryPhrase: MuzoiGlamVeil("6S5P4O Bf5oklslOoCwxehrgsC"),
                glamskinMilk: "MuzoiGlamMuse03",
                glamPortraitTrail: nil,
                glamvelvetGleamNew: true
            )
        ]
    }
}

final class MuzoiGlamEssenceCell: UICollectionViewCell {
    static let glamReuseKey = MuzoiGlamVeil("McuLzXoGiUG2lua2mdEksyslePnPcJekCwe2lilU")
    private static let glamPortraitCache = NSCache<NSString, UIImage>()

    var glamConcernAction: (() -> Void)?

    private let glamPortrait = UIImageView()
    private let glamShade = CAGradientLayer()
    private let iridescentMistTitle = UILabel()
    private let glamduochromeAura = UILabel()
    private let glamTrendPill = UILabel()
    private let glamConcernControl = UIButton(type: .custom)
    private var glammultichromeVeil: URLSessionDataTask?
    private var glampearlescentGleam: String?

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamSculptShowpieceCell()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("ijnLiXtE(NcTo9d2eOrG:e)J gh9azs5 UnqoYtp PbpepeqnO KinmWpelBeKm4einjthehdF"))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamShade.frame = bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glammultichromeVeil?.cancel()
        glammultichromeVeil = nil
        glampearlescentGleam = nil
        glamPortrait.image = nil
        glamConcernAction = nil
    }

    func glamPresent(_ glamFeature: MuzoiGlamEssenceFeature) {
        glammultichromeVeil?.cancel()
        glamPortrait.image = UIImage(named: glamFeature.glamRuneskinElixir)
        glampearlescentGleam = glamFeature.glamPortraitTrail
        glamLoadMuseImage(glamFeature.glamPortraitTrail)
        iridescentMistTitle.text = glamFeature.glammatteBloom
        glamduochromeAura.text = glamFeature.glamskinDew
        glamTrendPill.isHidden = !glamFeature.glamIsTrending
        accessibilityLabel = glamFeature.glammatteBloom + MuzoiGlamVeil(",h A") + glamFeature.glamskinDew
    }

    private func glamLoadMuseImage(_ glamTrail: String?) {
        guard let glamTrail, let glamURL = URL(string: glamTrail) else { return }
        if let glamCachedPortrait = Self.glamPortraitCache.object(forKey: glamTrail as NSString) {
            glamPortrait.image = glamCachedPortrait
            return
        }

        glammultichromeVeil = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedPortrait = UIImage(data: glamData) else { return }
            Self.glamPortraitCache.setObject(glamFetchedPortrait, forKey: glamTrail as NSString)
            DispatchQueue.main.async {
                guard let self, self.glampearlescentGleam == glamTrail else { return }
                UIView.transition(
                    with: self.glamPortrait,
                    duration: 0.2,
                    options: .transitionCrossDissolve,
                    animations: { self.glamPortrait.image = glamFetchedPortrait }
                )
            }
        }
        glammultichromeVeil?.resume()
    }

    private func glamSculptShowpieceCell() {
        clipsToBounds = true
        glamPinEssencePortrait()
        glamPaintEssenceShade()
        glamAddEssenceLabels()
        glamTintEssencePhrase()
        glamTintEssencePill()
        glamTintEssenceConcern()
        glamPinEssenceRunway()
    }

    private func glamPinEssencePortrait() {
        glamPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamPortrait.contentMode = .scaleAspectFill
        contentView.addSubview(glamPortrait)
    }

    private func glamPaintEssenceShade() {
        glamShade.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.72).cgColor]
        glamShade.startPoint = CGPoint(x: 0.5, y: 0.52)
        glamShade.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShade)
    }

    private func glamAddEssenceLabels() {
        [iridescentMistTitle, glamduochromeAura, glamTrendPill, glamConcernControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }

    private func glamTintEssencePhrase() {
        iridescentMistTitle.textColor = .white
        iridescentMistTitle.font = .systemFont(ofSize: 25, weight: .heavy)
        iridescentMistTitle.adjustsFontSizeToFitWidth = true
        iridescentMistTitle.minimumScaleFactor = 0.75

        glamduochromeAura.textColor = .white
        glamduochromeAura.font = .systemFont(ofSize: 17, weight: .medium)
    }

    private func glamTintEssencePill() {
        glamTrendPill.text = MuzoiGlamVeil(" M s✦Z lHyOFTc j k")
        glamTrendPill.textColor = .white
        glamTrendPill.backgroundColor = UIColor(red: 1, green: 0.29, blue: 0.61, alpha: 1)
        glamTrendPill.font = .systemFont(ofSize: 12, weight: .bold)
        glamTrendPill.textAlignment = .center
        glamTrendPill.layer.cornerRadius = 12
        glamTrendPill.clipsToBounds = true
    }

    private func glamTintEssenceConcern() {
        glamConcernControl.setImage(UIImage(systemName: "info.circle"), for: .normal)
        glamConcernControl.tintColor = UIColor.white.withAlphaComponent(0.76)
        glamConcernControl.backgroundColor = UIColor.black.withAlphaComponent(0.34)
        glamConcernControl.layer.cornerRadius = 17
        glamConcernControl.accessibilityLabel = MuzoiGlamVeil("C3oMnocJearQnN")
        glamConcernControl.addTarget(self, action: #selector(glamOpenEssenceConcern), for: .touchUpInside)
    }

    private func glamPinEssenceRunway() {
        NSLayoutConstraint.activate([
            glamPortrait.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamPortrait.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamPortrait.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            glamConcernControl.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            glamConcernControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            glamConcernControl.widthAnchor.constraint(equalToConstant: 34),
            glamConcernControl.heightAnchor.constraint(equalToConstant: 34),
            iridescentMistTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iridescentMistTitle.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            iridescentMistTitle.bottomAnchor.constraint(equalTo: glamduochromeAura.topAnchor, constant: -8),
            glamduochromeAura.leadingAnchor.constraint(equalTo: iridescentMistTitle.leadingAnchor),
            glamduochromeAura.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            glamTrendPill.leadingAnchor.constraint(equalTo: glamduochromeAura.trailingAnchor, constant: 10),
            glamTrendPill.centerYAnchor.constraint(equalTo: glamduochromeAura.centerYAnchor),
            glamTrendPill.heightAnchor.constraint(equalToConstant: 24),
            glamTrendPill.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -86)
        ])
    }

    @objc private func glamOpenEssenceConcern() {
        glamConcernAction?()
    }
}

final class MuzoiGlamMuseCell: UICollectionViewCell {
    static let glamReuseKey = MuzoiGlamVeil("M0uIzioBiUGRlcaRmQMFuNsjerCCePlblH")
    private static let glamMusePortraitCache = NSCache<NSString, UIImage>()

    private let glamPortrait = UIImageView()
    private let glamShade = CAGradientLayer()
    private let glamFreshPill = UILabel()
    private let glamName = UILabel()
    private let glamGallery = UILabel()
    private let glamPresenceDot = UIView()
    private let glamSparkControl = UIView()
    private let glamMoreControl = UIButton(type: .custom)
    private var glamMuseImageTask: URLSessionDataTask?
    private var glamExpectedMuseAddress: String?

    var glamMoreAction: (() -> Void)?

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamSculptShowpieceCell()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("ignNiUtt(Zc3oFdaefrY:F)u khJaEs2 KnZoHtx kbAedeSnl lirmYpqlJe7m1emnptKeMdD"))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamShade.frame = bounds
        contentView.layer.cornerRadius = 16
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glamMuseImageTask?.cancel()
        glamMuseImageTask = nil
        glamExpectedMuseAddress = nil
        glamPortrait.image = nil
        glamMoreAction = nil
    }

    func glamPresent(_ glamPersona: MuzoiGlamMusePersona) {
        glamMuseImageTask?.cancel()
        glamPortrait.image = UIImage(named: glamPersona.glamskinMilk)
        glamExpectedMuseAddress = glamPersona.glamPortraitTrail
        glamLoadMusePortrait(glamPersona.glamPortraitTrail)
        glamFreshPill.isHidden = !glamPersona.glamvelvetGleamNew
        glamName.text = glamPersona.glamsatinVeilskinBalm
        glamGallery.text = glamPersona.glamGalleryPhrase
        accessibilityLabel = glamPersona.glamsatinVeilskinBalm + MuzoiGlamVeil(",h A") + glamPersona.glamGalleryPhrase
    }

    private func glamLoadMusePortrait(_ glamTrail: String?) {
        guard let glamTrail, let glamURL = URL(string: glamTrail) else { return }
        if let glamCachedPortrait = Self.glamMusePortraitCache.object(forKey: glamTrail as NSString) {
            glamPortrait.image = glamCachedPortrait
            return
        }

        glamMuseImageTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedPortrait = UIImage(data: glamData) else { return }
            Self.glamMusePortraitCache.setObject(glamFetchedPortrait, forKey: glamTrail as NSString)
            DispatchQueue.main.async {
                guard let self, self.glamExpectedMuseAddress == glamTrail else { return }
                UIView.transition(
                    with: self.glamPortrait,
                    duration: 0.2,
                    options: .transitionCrossDissolve,
                    animations: { self.glamPortrait.image = glamFetchedPortrait }
                )
            }
        }
        glamMuseImageTask?.resume()
    }

    private func glamSculptShowpieceCell() {
        contentView.clipsToBounds = true
        glamPinMusePortrait()
        glamPaintMuseShade()
        glamAddMuseOrnaments()
        glamTintMuseFreshPill()
        glamTintMusePhrase()
        glamTintMusePresence()
        glamTintMuseSpark()
        glamTintMuseMore()
    }

    private func glamPinMusePortrait() {
        glamPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamPortrait.contentMode = .scaleAspectFill
        contentView.addSubview(glamPortrait)
    }

    private func glamPaintMuseShade() {
        glamShade.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.88).cgColor]
        glamShade.startPoint = CGPoint(x: 0.5, y: 0.46)
        glamShade.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShade)
    }

    private func glamAddMuseOrnaments() {
        [glamFreshPill, glamName, glamGallery, glamPresenceDot, glamSparkControl, glamMoreControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }

    private func glamTintMuseFreshPill() {
        glamFreshPill.text = MuzoiGlamVeil(" IN7ejwl l")
        glamFreshPill.textColor = .white
        glamFreshPill.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        glamFreshPill.font = .systemFont(ofSize: 12, weight: .bold)
        glamFreshPill.textAlignment = .center
        glamFreshPill.layer.cornerRadius = 12
        glamFreshPill.clipsToBounds = true
    }

    private func glamTintMusePhrase() {
        glamName.textColor = .white
        glamName.font = .systemFont(ofSize: 16, weight: .medium)
        glamGallery.textColor = UIColor.white.withAlphaComponent(0.6)
        glamGallery.font = .systemFont(ofSize: 12, weight: .regular)
    }

    private func glamTintMusePresence() {
        glamPresenceDot.backgroundColor = UIColor(red: 0, green: 0.88, blue: 0.19, alpha: 1)
        glamPresenceDot.layer.cornerRadius = 5
        glamPresenceDot.layer.borderWidth = 1
        glamPresenceDot.layer.borderColor = UIColor.white.cgColor
    }

    private func glamTintMuseSpark() {
        glamSparkControl.backgroundColor = UIColor(red: 0.91, green: 0.43, blue: 0.87, alpha: 1)
        glamSparkControl.layer.cornerRadius = 15
        let glamSparkGlyph = UIImageView(image: UIImage(systemName: "wand.and.stars"))
        glamSparkGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamSparkGlyph.tintColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamSparkControl.addSubview(glamSparkGlyph)
        glamPinMuseRunway(glamSparkGlyph)
    }

    private func glamTintMuseMore() {
        glamMoreControl.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        glamMoreControl.tintColor = UIColor.white.withAlphaComponent(0.86)
        glamMoreControl.backgroundColor = UIColor.black.withAlphaComponent(0.42)
        glamMoreControl.layer.cornerRadius = 15
        glamMoreControl.accessibilityLabel = MuzoiGlamVeil("MRo0rveR zoZp1tfibo6nds0")
        glamMoreControl.addTarget(self, action: #selector(glamOpenMuseChoices), for: .touchUpInside)
    }

    private func glamPinMuseRunway(_ glamSparkGlyph: UIImageView) {
        NSLayoutConstraint.activate([
            glamPortrait.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamPortrait.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamPortrait.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            glamFreshPill.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            glamFreshPill.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            glamFreshPill.heightAnchor.constraint(equalToConstant: 24),
            glamMoreControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            glamMoreControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            glamMoreControl.widthAnchor.constraint(equalToConstant: 30),
            glamMoreControl.heightAnchor.constraint(equalToConstant: 30),
            glamName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            glamName.bottomAnchor.constraint(equalTo: glamGallery.topAnchor, constant: -2),
            glamPresenceDot.leadingAnchor.constraint(equalTo: glamName.trailingAnchor, constant: 4),
            glamPresenceDot.centerYAnchor.constraint(equalTo: glamName.centerYAnchor),
            glamPresenceDot.widthAnchor.constraint(equalToConstant: 10),
            glamPresenceDot.heightAnchor.constraint(equalToConstant: 10),
            glamGallery.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            glamGallery.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            glamSparkControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            glamSparkControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            glamSparkControl.widthAnchor.constraint(equalToConstant: 30),
            glamSparkControl.heightAnchor.constraint(equalToConstant: 30),
            glamSparkGlyph.centerXAnchor.constraint(equalTo: glamSparkControl.centerXAnchor),
            glamSparkGlyph.centerYAnchor.constraint(equalTo: glamSparkControl.centerYAnchor),
            glamSparkGlyph.widthAnchor.constraint(equalToConstant: 16),
            glamSparkGlyph.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    @objc private func glamOpenMuseChoices() {
        glamMoreAction?()
    }
}

final class MuzoibrowSculptController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate {

    private let glamRepository = MuzoimetallicPetalRepository()
    private let glamporeBlur = UIScrollView()
    private let glamVessel = UIView()
    private let glamporeVeil = UILabel()
    private let glambaseVeilitle = UILabel()
    private let glamskinComfortr = UIPageControl()
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private let glamFeatureLayout = UICollectionViewFlowLayout()
    private let glamMuseLayout = UICollectionViewFlowLayout()
    private lazy var glamFeatureRail = UICollectionView(frame: .zero, collectionViewLayout: glamFeatureLayout)
    private lazy var glamMuseRail = UICollectionView(frame: .zero, collectionViewLayout: glamMuseLayout)
    private var glamFeatures: [MuzoiGlamEssenceFeature] = []
    private var glamPersonas: [MuzoiGlamMusePersona] = []
    private var glamRadianceTicker: Timer?
    private let glamVeiledMuseKey = MuzoiGlamVeil("mEurzQoHiQVwejiylaexdEMruPsZeDsS")

    override func viewDidLoad() {
        super.viewDidLoad()
        glamArrangeHomeAtelier()
        glambaseTint()
        glamObserveLifecycle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        glamStartTicker()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        glamStopTicker()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let glamFeatureSize = glamFeatureRail.bounds.size
        if glamFeatureLayout.itemSize != glamFeatureSize {
            glamFeatureLayout.itemSize = glamFeatureSize
            glamFeatureLayout.invalidateLayout()
        }
    }

    deinit {
        glamStopTicker()
        NotificationCenter.default.removeObserver(self)
    }

    private func glamArrangeHomeAtelier() {
        glamPreparskinSmooth()
        glamPrepareFeatureRail()
        glamskinLuminaMuseRail()
        glamPolishHomeBranding()
        glamAddHomeAtelierPieces()
        glamPinHomeAtelier()
    }

    private func glamPreparskinSmooth() {
        view.backgroundColor = UIColor(red: 9 / 255, green: 11 / 255, blue: 18 / 255, alpha: 1)
        glamporeBlur.translatesAutoresizingMaskIntoConstraints = false
        glamporeBlur.showsVerticalScrollIndicator = false
        glamporeBlur.contentInsetAdjustmentBehavior = .never
        glamVessel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamporeBlur)
        glamporeBlur.addSubview(glamVessel)
    }

    private func glamPrepareFeatureRail() {
        glamFeatureLayout.scrollDirection = .horizontal
        glamFeatureLayout.minimumLineSpacing = 0
        glamFeatureRail.translatesAutoresizingMaskIntoConstraints = false
        glamFeatureRail.backgroundColor = .clear
        glamFeatureRail.isPagingEnabled = true
        glamFeatureRail.showsHorizontalScrollIndicator = false
        glamFeatureRail.decelerationRate = .fast
        glamFeatureRail.dataSource = self
        glamFeatureRail.delegate = self
        glamFeatureRail.register(MuzoiGlamEssenceCell.self, forCellWithReuseIdentifier: MuzoiGlamEssenceCell.glamReuseKey)
    }

    private func glamskinLuminaMuseRail() {
        glamMuseLayout.scrollDirection = .horizontal
        glamMuseLayout.minimumLineSpacing = 10
        glamMuseLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        glamMuseLayout.itemSize = CGSize(width: 140, height: 170)
        glamMuseRail.translatesAutoresizingMaskIntoConstraints = false
        glamMuseRail.backgroundColor = .clear
        glamMuseRail.showsHorizontalScrollIndicator = false
        glamMuseRail.decelerationRate = .fast
        glamMuseRail.dataSource = self
        glamMuseRail.delegate = self
        glamMuseRail.register(MuzoiGlamMuseCell.self, forCellWithReuseIdentifier: MuzoiGlamMuseCell.glamReuseKey)
    }

    private func glamPolishHomeBranding() {
        glamporeVeil.translatesAutoresizingMaskIntoConstraints = false
        glamporeVeil.text = MuzoiGlamVeil("MjuozhoKiF")
        glamporeVeil.textColor = .white
        glamporeVeil.font = .systemFont(ofSize: 27, weight: .heavy)
        glamporeVeil.layer.shadowColor = UIColor.black.cgColor
        glamporeVeil.layer.shadowOpacity = 0.28
        glamporeVeil.layer.shadowRadius = 6
        glamporeVeil.layer.shadowOffset = CGSize(width: 0, height: 2)

        glamskinComfortr.translatesAutoresizingMaskIntoConstraints = false
        glamskinComfortr.currentPageIndicatorTintColor = .white
        glamskinComfortr.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.34)
        glamskinComfortr.isUserInteractionEnabled = false

        glambaseVeilitle.translatesAutoresizingMaskIntoConstraints = false
        glambaseVeilitle.text = MuzoiGlamVeil("M7aakKeRukpt ladrAtNiBsotesf")
        glambaseVeilitle.textColor = .white
        glambaseVeilitle.font = .systemFont(ofSize: 20, weight: .bold)

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white
    }

    private func glamAddHomeAtelierPieces() {
        glamVessel.addSubview(glamFeatureRail)
        glamVessel.addSubview(glamporeVeil)
        glamVessel.addSubview(glamskinComfortr)
        glamVessel.addSubview(glambaseVeilitle)
        glamVessel.addSubview(glamMuseRail)
        glamVessel.addSubview(glamSpinner)
    }

    private func glamPinHomeAtelier() {
        NSLayoutConstraint.activate(glamHomeCanvasRunway())
        NSLayoutConstraint.activate(glamtextureSoftenernway())
        NSLayoutConstraint.activate(glambaseMeltnway())
    }

    private func glamHomeCanvasRunway() -> [NSLayoutConstraint] {
        [
            glamporeBlur.topAnchor.constraint(equalTo: view.topAnchor),
            glamporeBlur.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamporeBlur.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamporeBlur.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            glamVessel.topAnchor.constraint(equalTo: glamporeBlur.contentLayoutGuide.topAnchor),
            glamVessel.leadingAnchor.constraint(equalTo: glamporeBlur.contentLayoutGuide.leadingAnchor),
            glamVessel.trailingAnchor.constraint(equalTo: glamporeBlur.contentLayoutGuide.trailingAnchor),
            glamVessel.bottomAnchor.constraint(equalTo: glamporeBlur.contentLayoutGuide.bottomAnchor),
            glamVessel.widthAnchor.constraint(equalTo: glamporeBlur.frameLayoutGuide.widthAnchor)
        ]
    }

    private func glamtextureSoftenernway() -> [NSLayoutConstraint] {
        [
            glamFeatureRail.topAnchor.constraint(equalTo: glamVessel.topAnchor),
            glamFeatureRail.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor),
            glamFeatureRail.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor),
            glamFeatureRail.heightAnchor.constraint(equalTo: glamFeatureRail.widthAnchor, multiplier: 1.28),
            glamporeVeil.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            glamporeVeil.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor, constant: 16),
            glamskinComfortr.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor, constant: -12),
            glamskinComfortr.bottomAnchor.constraint(equalTo: glamFeatureRail.bottomAnchor, constant: -13),
            glamSpinner.centerXAnchor.constraint(equalTo: glamFeatureRail.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamFeatureRail.centerYAnchor)
        ]
    }

    private func glambaseMeltnway() -> [NSLayoutConstraint] {
        [
            glambaseVeilitle.topAnchor.constraint(equalTo: glamFeatureRail.bottomAnchor, constant: 28),
            glambaseVeilitle.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor, constant: 15),
            glambaseVeilitle.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor, constant: -15),
            glamMuseRail.topAnchor.constraint(equalTo: glambaseVeilitle.bottomAnchor, constant: 16),
            glamMuseRail.leadingAnchor.constraint(equalTo: glamVessel.leadingAnchor),
            glamMuseRail.trailingAnchor.constraint(equalTo: glamVessel.trailingAnchor),
            glamMuseRail.heightAnchor.constraint(equalToConstant: 170),
            glamMuseRail.bottomAnchor.constraint(equalTo: glamVessel.bottomAnchor, constant: -18)
        ]
    }

    private func glambaseTint() {
        glamSpinner.startAnimating()
        glamRepository.glamshimmerDust { [weak self] glamFeatures, glamPersonas in
            guard let self else { return }
            self.glamFeatures = glamFeatures
            self.glamPersonas = self.glamVisiblePersonas(from: glamPersonas)
            self.glamskinComfortr.numberOfPages = glamFeatures.count
            self.glamFeatureRail.reloadData()
            self.glamMuseRail.reloadData()
            self.glamSpinner.stopAnimating()
            self.glamStartTicker()
        }
    }

    private func glamObserveLifecycle() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(glamPauseForBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(glamResumeFromBackground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    private func glamStartTicker() {
        guard glamRadianceTicker == nil, glamFeatures.count > 1, viewIfLoaded?.window != nil else { return }
        let glamTicker = Timer(timeInterval: 1, repeats: true) { [weak self] glamTick in
            guard let self, !self.glamFeatureRail.isDragging, !self.glamFeatureRail.isDecelerating else { return }
            self.glamAdvanceFeature()
        }
        RunLoop.main.add(glamTicker, forMode: .common)
        glamRadianceTicker = glamTicker
    }

    private func glamStopTicker() {
        glamRadianceTicker?.invalidate()
        glamRadianceTicker = nil
    }

    private func glamAdvanceFeature() {
        guard !glamFeatures.isEmpty, glamFeatureRail.bounds.width > 0 else { return }
        let glamCurrent = Int(round(glamFeatureRail.contentOffset.x / glamFeatureRail.bounds.width))
        let glamNext = (glamCurrent + 1) % glamFeatures.count
        glamFeatureRail.scrollToItem(
            at: IndexPath(item: glamNext, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
        glamskinComfortr.currentPage = glamNext
    }

    @objc private func glamPauseForBackground() {
        glamStopTicker()
    }

    @objc private func glamResumeFromBackground() {
        glamStartTicker()
    }

    func numberOfSections(in glamGrid: UICollectionView) -> Int {
        1
    }

    func collectionView(_ glamGrid: UICollectionView, numberOfItemsInSection glamSection: Int) -> Int {
        glamGrid === glamFeatureRail ? glamFeatures.count : glamPersonas.count
    }

    func collectionView(
        _ glamGrid: UICollectionView,
        cellForItemAt glamIndexPath: IndexPath
    ) -> UICollectionViewCell {
        if glamGrid === glamFeatureRail {
            let glamCell = glamGrid.dequeueReusableCell(
                withReuseIdentifier: MuzoiGlamEssenceCell.glamReuseKey,
                for: glamIndexPath
            ) as! MuzoiGlamEssenceCell
            glamCell.glamPresent(glamFeatures[glamIndexPath.item])
            let glamFeature = glamFeatures[glamIndexPath.item]
            glamCell.glamConcernAction = { [weak self] in
                self?.glamOpenPortal(.glamFlagCanvas, glamQuery: glamFeature.glamsheerLoomSignature)
            }
            return glamCell
        }

        let glamCell = glamGrid.dequeueReusableCell(
            withReuseIdentifier: MuzoiGlamMuseCell.glamReuseKey,
            for: glamIndexPath
        ) as! MuzoiGlamMuseCell
        let glamPersona = glamPersonas[glamIndexPath.item]
        glamCell.glamPresent(glamPersona)
        glamCell.glamMoreAction = { [weak self] in
            self?.glamPresentMuseVeilSheet(glamPersona)
        }
        return glamCell
    }

    func collectionView(_ glamGrid: UICollectionView, didSelectItemAt glamIndexPath: IndexPath) {
        UISelectionFeedbackGenerator().selectionChanged()
        if glamGrid === glamFeatureRail {
            let glamFeature = glamFeatures[glamIndexPath.item]
            let glamTrail = MuzoiGlamScenePassage.glamAromaCanvas.glamTraceAddress(
                glamTrailMark: glamFeature.glamsheerLoomSignature
            )
            navigationController?.pushViewController(
                MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
                animated: true
            )
        } else {
            let glamPersona = glamPersonas[glamIndexPath.item]
            let glamTrail = MuzoiGlamScenePassage.glamMuseCanvas.glamTraceAddress(
                glamTrailMark: glamPersona.glamdewyPetalture
            )
            navigationController?.pushViewController(
                MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
                animated: true
            )
        }
    }

    func scrollViewWillBeginDragging(_ glamMovingCanvas: UIScrollView) {
        guard glamMovingCanvas === glamFeatureRail else { return }
        glamStopTicker()
    }

    func scrollViewDidEndDecelerating(_ glamMovingCanvas: UIScrollView) {
        guard glamMovingCanvas === glamFeatureRail, glamFeatureRail.bounds.width > 0 else { return }
        glamskinComfortr.currentPage = Int(round(glamFeatureRail.contentOffset.x / glamFeatureRail.bounds.width))
        glamStartTicker()
    }

    func scrollViewDidEndDragging(_ glamMovingCanvas: UIScrollView, willDecelerate glamWillDecelerate: Bool) {
        guard glamMovingCanvas === glamFeatureRail, !glamWillDecelerate else { return }
        glamStartTicker()
    }

    private func glamOpenPortal(_ glamPassage: MuzoiGlamScenePassage, glamQuery: String) {
        let glamTrail = glamPassage.glamTraceAddress(glamTrailMark: glamQuery)
        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
            animated: true
        )
    }

    private func glamPresentMuseVeilSheet(_ glamPersona: MuzoiGlamMusePersona) {
        let glamSheet = UIAlertController(
            title: MuzoiGlamVeil("M6uQzGooif Bm8uCsheQ BoipItui4oNnJsk"),
            message: glamPersona.glamsatinVeilskinBalm,
            preferredStyle: .actionSheet
        )
        glamSheet.addAction(UIAlertAction(title: MuzoiGlamVeil("C3oMnocJearQnN"), style: .default) { [weak self] _ in
            self?.glamOpenPortal(.glamFlagCanvas, glamQuery: glamPersona.glamdewyPetalture)
        })
        glamSheet.addAction(UIAlertAction(title: MuzoiGlamVeil("SjhCixeklvd5"), style: .destructive) { [weak self] _ in
            self?.glamVeilMuse(glamPersona)
        })
        glamSheet.addAction(UIAlertAction(title: MuzoiGlamVeil("NnodtK 0nmoewG"), style: .cancel))
        if let glamPopover = glamSheet.popoverPresentationController {
            glamPopover.sourceView = glamMuseRail
            glamPopover.sourceRect = glamMuseRail.bounds
        }
        present(glamSheet, animated: true)
    }

    private func glamVeilMuse(_ glamPersona: MuzoiGlamMusePersona) {
        var glamVeiledRunes = Set(UserDefaults.standard.stringArray(forKey: glamVeiledMuseKey) ?? [])
        glamVeiledRunes.insert(glamPersona.glamdewyPetalture)
        UserDefaults.standard.set(Array(glamVeiledRunes), forKey: glamVeiledMuseKey)
        glamPersonas.removeAll { glamVeiledRunes.contains($0.glamdewyPetalture) }
        glamMuseRail.reloadData()
    }

    private func glamVisiblePersonas(from glamRawPersonas: [MuzoiGlamMusePersona]) -> [MuzoiGlamMusePersona] {
        let glamVeiledRunes = Set(UserDefaults.standard.stringArray(forKey: glamVeiledMuseKey) ?? [])
        return glamRawPersonas.filter { !glamVeiledRunes.contains($0.glamdewyPetalture) }
    }
}
