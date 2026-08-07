import UIKit

struct MuzoiGlamEssenceFeature {
    let glamIdentity: String
    let glamTitle: String
    let glamSubtitle: String
    let glamAssetName: String
    let glamPortraitAddress: String?
    let glamIsTrending: Bool
}

struct MuzoiGlamMuseProfile {
    let glamIdentity: String
    let glamDisplayName: String
    let glamAudienceText: String
    let glamAssetName: String
    let glamPortraitAddress: String?
    let glamIsNew: Bool
}

final class MuzoiGlamHomeRepository {
    private let glamDynamicEndpoint = MuzoiGlamVeil("/fqipCs9vZdLffrlsPz0/hvpsIw4qAsSaG")
    private let glamMuseEndpoint = MuzoiGlamVeil("/cw1mqh8udpatWqgcFjhaKokfSe1app9zY/3tigOcqsTxt")

    func glamFetchHome(
        glamYield: @escaping ([MuzoiGlamEssenceFeature], [MuzoiGlamMuseProfile]) -> Void
    ) {
        let glamArrivalGroup = DispatchGroup()
        var glamFeatureResults = glamFallbackFeatures()
        var glamMuseResults = glamFallbackProfiles()
        let glamAromaEnvelope: [String: Any] = [
            MuzoiGlamVeil("eAd9ictMosrNivaOlTGwlsoWwG"): MuzoiGlamVeil("9V3W2M1P9Q7c1R4P"),
            MuzoiGlamVeil("b3lKeyngdMilnvgFSKymmRpphvoknXye"): 10,
            MuzoiGlamVeil("pHi0g9mkeHnjt3BGl6i0sFsd"): 2,
            MuzoiGlamVeil("mSaBkJeeuLpPS8tiomrSyDtJealDlZi3nBgK"): 1,
            MuzoiGlamVeil("ndeAoyngE6yyeqsph4aBdCoGwK"): 5
        ]

        glamArrivalGroup.enter()
        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamDynamicEndpoint,
            glamPigmentParcel: glamAromaEnvelope,
            glamArrival: { [weak self] glamObject in
                defer { glamArrivalGroup.leave() }
                guard let self else { return }
                let glamFeatures = self.glamDecodeAromaFeatures(glamObject)
                if !glamFeatures.isEmpty { glamFeatureResults = glamFeatures }
            },
            glamDetour: { _ in
                glamArrivalGroup.leave()
            }
        )

        glamArrivalGroup.enter()
        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamMuseEndpoint,
            glamPigmentParcel: [MuzoiGlamVeil("gDlkaWmHTtrBaSnRsJf9o4rxmhaCteixonnt"): MuzoiGlamVeil("9P3W2Y1Z9M7d1L4X")],
            glamArrival: { [weak self] glamObject in
                defer { glamArrivalGroup.leave() }
                guard let self else { return }
                let glamProfiles = self.glamDecodeMuseProfiles(glamObject)
                if !glamProfiles.isEmpty { glamMuseResults = glamProfiles }
            },
            glamDetour: { _ in
                glamArrivalGroup.leave()
            }
        )

        glamArrivalGroup.notify(queue: .main) {
            glamYield(glamFeatureResults, glamMuseResults)
        }
    }

    private func glamDecodeAromaFeatures(_ glamObject: Any?) -> [MuzoiGlamEssenceFeature] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("c6o1drem")] as? NSNumber)?.intValue == 200000,
            let glamAromaRows = glamPigmentParcel[MuzoiGlamVeil("dJapt4aY")] as? [[String: Any]]
        else { return [] }

        return glamAromaRows.compactMap { glamRow in
            guard let glamIdentity = glamTextValue(glamRow[MuzoiGlamVeil("sohSiWm1moe1rmD8emtEaoipldsk")]) else { return nil }
            let glamImageChoices = (glamRow[MuzoiGlamVeil("sitiyAlGekGElsoTwWIOn4sIifgYhTtn")] as? [String])
                ?? (glamRow[MuzoiGlamVeil("pRaXirn0tKeIdxPQeqrpsZolnTaG")] as? [String])
                ?? []
            let glamPraiseCount = glamRow[MuzoiGlamVeil("csoTlCoSrDT5hpeBonrry0Bxe6aUuktuyr")] as? Int ?? 0
            return MuzoiGlamEssenceFeature(
                glamIdentity: glamIdentity,
                glamTitle: glamTextValue(glamRow[MuzoiGlamVeil("c6o6mrpnl4eXxbiJo1nGCNolnrtrrlo3ld")]) ?? MuzoiGlamVeil("ADr9opmJaM RIPnJsapKiZr7aatIiYoVn2"),
                glamSubtitle: glamAromaSummary(glamTextValue(glamRow[MuzoiGlamVeil("bseBazuatpyvSNtFaOt9e2mbeonjtE")])),
                glamAssetName: "MuzoiGlamEssence01",
                glamPortraitAddress: glamImageChoices.first ?? (glamRow[MuzoiGlamVeil("cIrxefaPtmiwvWihtEyuGBldoMwau4pb")] as? String),
                glamIsTrending: glamPraiseCount >= 30
            )
        }
    }

    private func glamTextValue(_ glamValue: Any?) -> String? {
        if let glamText = glamValue as? String, !glamText.isEmpty { return glamText }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }

    private func glamDecodeMuseProfiles(_ glamObject: Any?) -> [MuzoiGlamMuseProfile] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("c9oLd3eJ")] as? NSNumber)?.intValue == 200000,
            let glamMuseRows = glamPigmentParcel[MuzoiGlamVeil("dHaetSa1")] as? [[String: Any]]
        else { return [] }

        return glamMuseRows.compactMap { glamRow in
            guard let glamIdentity = glamTextValue(glamRow[MuzoiGlamVeil("mBaPkfeNu4pdAGlncyhCedmvyH")]) else { return nil }
            let glamFollowerCount = (glamRow[MuzoiGlamVeil("sOpZaArtkdlNezD5eJtBaHiWlfsF")] as? NSNumber)?.intValue ?? 0
            return MuzoiGlamMuseProfile(
                glamIdentity: glamIdentity,
                glamDisplayName: glamTextValue(glamRow[MuzoiGlamVeil("bzeraWudtIyLE6xkpWrqe6s3sfipo6nZies8mt")]) ?? MuzoiGlamVeil("M9unz3oVi5 2Mau7sNea"),
                glamAudienceText: "\(glamFollowerCount)" + MuzoiGlamVeil(" MfIoxlklAoUw6e6rCsx"),
                glamAssetName: "MuzoiGlamMuse01",
                glamPortraitAddress: glamRow[MuzoiGlamVeil("sffnxJMfa2k3ebu6pNMRaUsDthe7rEyk")] as? String,
                glamIsNew: (glamRow[MuzoiGlamVeil("bEeiaZu6tbyFN6abrprUavtTi9vueu")] as? NSNumber)?.intValue == 1
            )
        }
    }

    private func glamAromaSummary(_ glamText: String?) -> String {
        guard let glamText, !glamText.isEmpty else { return MuzoiGlamVeil("D1iZsQc8ovvReWru Atlhmivsc 3a7rwoLmkaatpi9cJ Piun7sApWiEruaet4i9o8nA") }
        let glamOpening = glamText.range(of: MuzoiGlamVeil(".l"))
            .map { String(glamText[..<$0.lowerBound]) } ?? glamText
        return glamOpening.replacingOccurrences(of: MuzoiGlamVeil("C3hGajreaccWtCeXr5i9sWtiiFcNsv:D"), with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func glamFallbackFeatures() -> [MuzoiGlamEssenceFeature] {
        [
            MuzoiGlamEssenceFeature(
                glamIdentity: MuzoiGlamVeil("7K0y3y4J0c37160f8p9m1K3k2W2s1P"),
                glamTitle: MuzoiGlamVeil("Sdt1aVt9e2mLePnntO sEUy1eY KMmaQkTeDuepp"),
                glamSubtitle: MuzoiGlamVeil("BEo9lFdE tcmoPlro9rA sannUdG KpXrJekcKiSsfex EdreUtYagiElA"),
                glamAssetName: "MuzoiGlamEssence01",
                glamPortraitAddress: nil,
                glamIsTrending: true
            ),
            MuzoiGlamEssenceFeature(
                glamIdentity: MuzoiGlamVeil("7i0c3F480T3s1Q088V9s2b134p1f3f"),
                glamTitle: MuzoiGlamVeil("N1aetxuQrwaKlD LG1lDo8wp GHIi7glhUl5idgwhUt5iSnNg1"),
                glamSubtitle: MuzoiGlamVeil("SgoTfEtC,z Nr2aydXiXaNnxtf 9dxeKfji9nAiRtji1oen4"),
                glamAssetName: "MuzoiGlamEssence02",
                glamPortraitAddress: nil,
                glamIsTrending: true
            ),
            MuzoiGlamEssenceFeature(
                glamIdentity: MuzoiGlamVeil("7Y0q3g4z06391P0G849I0D9y142T5Z"),
                glamTitle: MuzoiGlamVeil("FFlKa2whlGeMspsS 9BvaLsOed HAapVp8lliPcxaIt5iqoenH"),
                glamSubtitle: MuzoiGlamVeil("SimHowoytOho wa1nSdq RpRoRlGiqsjhvecd6 RcNoDmLppleeUxGi0ownO"),
                glamAssetName: "MuzoiGlamEssence03",
                glamPortraitAddress: nil,
                glamIsTrending: false
            )
        ]
    }

    private func glamFallbackProfiles() -> [MuzoiGlamMuseProfile] {
        [
            MuzoiGlamMuseProfile(
                glamIdentity: MuzoiGlamVeil("mwulsoe4-nduohrYa9"),
                glamDisplayName: MuzoiGlamVeil("DNoYrUaQ"),
                glamAudienceText: MuzoiGlamVeil("8d3G9L ifqotlDlroPweeDr2sM"),
                glamAssetName: "MuzoiGlamMuse01",
                glamPortraitAddress: nil,
                glamIsNew: true
            ),
            MuzoiGlamMuseProfile(
                glamIdentity: MuzoiGlamVeil("mLuys4eL-OpteCnwaI"),
                glamDisplayName: MuzoiGlamVeil("PbeknuaX"),
                glamAudienceText: MuzoiGlamVeil("7q2J1q LfboclDl2oiw0e8rVsJ"),
                glamAssetName: "MuzoiGlamMuse02",
                glamPortraitAddress: nil,
                glamIsNew: true
            ),
            MuzoiGlamMuseProfile(
                glamIdentity: MuzoiGlamVeil("mouOsWeC-tsmuRtstaoxnx"),
                glamDisplayName: MuzoiGlamVeil("SBuwt0tUoWn0"),
                glamAudienceText: MuzoiGlamVeil("6S5P4O Bf5oklslOoCwxehrgsC"),
                glamAssetName: "MuzoiGlamMuse03",
                glamPortraitAddress: nil,
                glamIsNew: true
            )
        ]
    }
}

final class MuzoiGlamEssenceCell: UICollectionViewCell {
    static let glamReuseKey = MuzoiGlamVeil("McuLzXoGiUG2lua2mdEksyslePnPcJekCwe2lilU")
    private static let glamPortraitCache = NSCache<NSString, UIImage>()

    private let glamPortrait = UIImageView()
    private let glamShade = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamSubtitle = UILabel()
    private let glamTrendPill = UILabel()
    private var glamImageTask: URLSessionDataTask?
    private var glamExpectedAddress: String?

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
        glamImageTask?.cancel()
        glamImageTask = nil
        glamExpectedAddress = nil
        glamPortrait.image = nil
    }

    func glamPresent(_ glamFeature: MuzoiGlamEssenceFeature) {
        glamImageTask?.cancel()
        glamPortrait.image = UIImage(named: glamFeature.glamAssetName)
        glamExpectedAddress = glamFeature.glamPortraitAddress
        glamLoadPortrait(glamFeature.glamPortraitAddress)
        glamTitle.text = glamFeature.glamTitle
        glamSubtitle.text = glamFeature.glamSubtitle
        glamTrendPill.isHidden = !glamFeature.glamIsTrending
        accessibilityLabel = glamFeature.glamTitle + MuzoiGlamVeil(",h A") + glamFeature.glamSubtitle
    }

    private func glamLoadPortrait(_ glamAddress: String?) {
        guard let glamAddress, let glamURL = URL(string: glamAddress) else { return }
        if let glamCachedPortrait = Self.glamPortraitCache.object(forKey: glamAddress as NSString) {
            glamPortrait.image = glamCachedPortrait
            return
        }

        glamImageTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedPortrait = UIImage(data: glamData) else { return }
            Self.glamPortraitCache.setObject(glamFetchedPortrait, forKey: glamAddress as NSString)
            DispatchQueue.main.async {
                guard let self, self.glamExpectedAddress == glamAddress else { return }
                UIView.transition(
                    with: self.glamPortrait,
                    duration: 0.2,
                    options: .transitionCrossDissolve,
                    animations: { self.glamPortrait.image = glamFetchedPortrait }
                )
            }
        }
        glamImageTask?.resume()
    }

    private func glamSculptShowpieceCell() {
        clipsToBounds = true
        glamPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamPortrait.contentMode = .scaleAspectFill
        contentView.addSubview(glamPortrait)

        glamShade.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.72).cgColor]
        glamShade.startPoint = CGPoint(x: 0.5, y: 0.52)
        glamShade.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShade)

        [glamTitle, glamSubtitle, glamTrendPill].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 25, weight: .heavy)
        glamTitle.adjustsFontSizeToFitWidth = true
        glamTitle.minimumScaleFactor = 0.75

        glamSubtitle.textColor = .white
        glamSubtitle.font = .systemFont(ofSize: 17, weight: .medium)

        glamTrendPill.text = MuzoiGlamVeil(" M s✦Z lHyOFTc j k")
        glamTrendPill.textColor = .white
        glamTrendPill.backgroundColor = UIColor(red: 1, green: 0.29, blue: 0.61, alpha: 1)
        glamTrendPill.font = .systemFont(ofSize: 12, weight: .bold)
        glamTrendPill.textAlignment = .center
        glamTrendPill.layer.cornerRadius = 12
        glamTrendPill.clipsToBounds = true

        NSLayoutConstraint.activate([
            glamPortrait.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamPortrait.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamPortrait.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            glamTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            glamTitle.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            glamTitle.bottomAnchor.constraint(equalTo: glamSubtitle.topAnchor, constant: -8),
            glamSubtitle.leadingAnchor.constraint(equalTo: glamTitle.leadingAnchor),
            glamSubtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            glamTrendPill.leadingAnchor.constraint(equalTo: glamSubtitle.trailingAnchor, constant: 10),
            glamTrendPill.centerYAnchor.constraint(equalTo: glamSubtitle.centerYAnchor),
            glamTrendPill.heightAnchor.constraint(equalToConstant: 24),
            glamTrendPill.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -86)
        ])
    }
}

final class MuzoiGlamMuseCell: UICollectionViewCell {
    static let glamReuseKey = MuzoiGlamVeil("M0uIzioBiUGRlcaRmQMFuNsjerCCePlblH")
    private static let glamMusePortraitCache = NSCache<NSString, UIImage>()

    private let glamPortrait = UIImageView()
    private let glamShade = CAGradientLayer()
    private let glamFreshPill = UILabel()
    private let glamName = UILabel()
    private let glamAudience = UILabel()
    private let glamPresenceDot = UIView()
    private let glamSparkControl = UIView()
    private var glamMuseImageTask: URLSessionDataTask?
    private var glamExpectedMuseAddress: String?

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
    }

    func glamPresent(_ glamProfile: MuzoiGlamMuseProfile) {
        glamMuseImageTask?.cancel()
        glamPortrait.image = UIImage(named: glamProfile.glamAssetName)
        glamExpectedMuseAddress = glamProfile.glamPortraitAddress
        glamLoadMusePortrait(glamProfile.glamPortraitAddress)
        glamFreshPill.isHidden = !glamProfile.glamIsNew
        glamName.text = glamProfile.glamDisplayName
        glamAudience.text = glamProfile.glamAudienceText
        accessibilityLabel = glamProfile.glamDisplayName + MuzoiGlamVeil(",h A") + glamProfile.glamAudienceText
    }

    private func glamLoadMusePortrait(_ glamAddress: String?) {
        guard let glamAddress, let glamURL = URL(string: glamAddress) else { return }
        if let glamCachedPortrait = Self.glamMusePortraitCache.object(forKey: glamAddress as NSString) {
            glamPortrait.image = glamCachedPortrait
            return
        }

        glamMuseImageTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedPortrait = UIImage(data: glamData) else { return }
            Self.glamMusePortraitCache.setObject(glamFetchedPortrait, forKey: glamAddress as NSString)
            DispatchQueue.main.async {
                guard let self, self.glamExpectedMuseAddress == glamAddress else { return }
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
        glamPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamPortrait.contentMode = .scaleAspectFill
        contentView.addSubview(glamPortrait)

        glamShade.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.88).cgColor]
        glamShade.startPoint = CGPoint(x: 0.5, y: 0.46)
        glamShade.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShade)

        [glamFreshPill, glamName, glamAudience, glamPresenceDot, glamSparkControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        glamFreshPill.text = MuzoiGlamVeil(" IN7ejwl l")
        glamFreshPill.textColor = .white
        glamFreshPill.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        glamFreshPill.font = .systemFont(ofSize: 12, weight: .bold)
        glamFreshPill.textAlignment = .center
        glamFreshPill.layer.cornerRadius = 12
        glamFreshPill.clipsToBounds = true

        glamName.textColor = .white
        glamName.font = .systemFont(ofSize: 16, weight: .medium)
        glamAudience.textColor = UIColor.white.withAlphaComponent(0.6)
        glamAudience.font = .systemFont(ofSize: 12, weight: .regular)

        glamPresenceDot.backgroundColor = UIColor(red: 0, green: 0.88, blue: 0.19, alpha: 1)
        glamPresenceDot.layer.cornerRadius = 5
        glamPresenceDot.layer.borderWidth = 1
        glamPresenceDot.layer.borderColor = UIColor.white.cgColor

        glamSparkControl.backgroundColor = UIColor(red: 0.91, green: 0.43, blue: 0.87, alpha: 1)
        glamSparkControl.layer.cornerRadius = 15
        let glamSparkGlyph = UIImageView(image: UIImage(systemName: "wand.and.stars"))
        glamSparkGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamSparkGlyph.tintColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamSparkControl.addSubview(glamSparkGlyph)

        NSLayoutConstraint.activate([
            glamPortrait.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamPortrait.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamPortrait.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            glamFreshPill.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            glamFreshPill.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            glamFreshPill.heightAnchor.constraint(equalToConstant: 24),
            glamName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            glamName.bottomAnchor.constraint(equalTo: glamAudience.topAnchor, constant: -2),
            glamPresenceDot.leadingAnchor.constraint(equalTo: glamName.trailingAnchor, constant: 4),
            glamPresenceDot.centerYAnchor.constraint(equalTo: glamName.centerYAnchor),
            glamPresenceDot.widthAnchor.constraint(equalToConstant: 10),
            glamPresenceDot.heightAnchor.constraint(equalToConstant: 10),
            glamAudience.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            glamAudience.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
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
}

final class MuzoiGlamHomeController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate {

    private let glamRepository = MuzoiGlamHomeRepository()
    private let glamCanvas = UIScrollView()
    private let glamContent = UIView()
    private let glamBrand = UILabel()
    private let glamSectionTitle = UILabel()
    private let glamPager = UIPageControl()
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private let glamFeatureLayout = UICollectionViewFlowLayout()
    private let glamMuseLayout = UICollectionViewFlowLayout()
    private lazy var glamFeatureRail = UICollectionView(frame: .zero, collectionViewLayout: glamFeatureLayout)
    private lazy var glamMuseRail = UICollectionView(frame: .zero, collectionViewLayout: glamMuseLayout)
    private var glamFeatures: [MuzoiGlamEssenceFeature] = []
    private var glamProfiles: [MuzoiGlamMuseProfile] = []
    private var glamRadianceTicker: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        glamStageHomeAtelier()
        glamLoadHome()
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

    private func glamStageHomeAtelier() {
        view.backgroundColor = UIColor(red: 9 / 255, green: 11 / 255, blue: 18 / 255, alpha: 1)
        glamCanvas.translatesAutoresizingMaskIntoConstraints = false
        glamCanvas.showsVerticalScrollIndicator = false
        glamCanvas.contentInsetAdjustmentBehavior = .never
        glamContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamCanvas)
        glamCanvas.addSubview(glamContent)

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

        glamBrand.translatesAutoresizingMaskIntoConstraints = false
        glamBrand.text = MuzoiGlamVeil("MjuozhoKiF")
        glamBrand.textColor = .white
        glamBrand.font = .systemFont(ofSize: 27, weight: .heavy)
        glamBrand.layer.shadowColor = UIColor.black.cgColor
        glamBrand.layer.shadowOpacity = 0.28
        glamBrand.layer.shadowRadius = 6
        glamBrand.layer.shadowOffset = CGSize(width: 0, height: 2)

        glamPager.translatesAutoresizingMaskIntoConstraints = false
        glamPager.currentPageIndicatorTintColor = .white
        glamPager.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.34)
        glamPager.isUserInteractionEnabled = false

        glamSectionTitle.translatesAutoresizingMaskIntoConstraints = false
        glamSectionTitle.text = MuzoiGlamVeil("M7aakKeRukpt ladrAtNiBsotesf")
        glamSectionTitle.textColor = .white
        glamSectionTitle.font = .systemFont(ofSize: 20, weight: .bold)

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white

        glamContent.addSubview(glamFeatureRail)
        glamContent.addSubview(glamBrand)
        glamContent.addSubview(glamPager)
        glamContent.addSubview(glamSectionTitle)
        glamContent.addSubview(glamMuseRail)
        glamContent.addSubview(glamSpinner)

        NSLayoutConstraint.activate([
            glamCanvas.topAnchor.constraint(equalTo: view.topAnchor),
            glamCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            glamContent.topAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.topAnchor),
            glamContent.leadingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.leadingAnchor),
            glamContent.trailingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.trailingAnchor),
            glamContent.bottomAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.bottomAnchor),
            glamContent.widthAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.widthAnchor),

            glamFeatureRail.topAnchor.constraint(equalTo: glamContent.topAnchor),
            glamFeatureRail.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor),
            glamFeatureRail.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor),
            glamFeatureRail.heightAnchor.constraint(equalTo: glamFeatureRail.widthAnchor, multiplier: 1.28),

            glamBrand.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            glamBrand.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 16),
            glamPager.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -12),
            glamPager.bottomAnchor.constraint(equalTo: glamFeatureRail.bottomAnchor, constant: -13),

            glamSectionTitle.topAnchor.constraint(equalTo: glamFeatureRail.bottomAnchor, constant: 28),
            glamSectionTitle.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 15),
            glamSectionTitle.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -15),
            glamMuseRail.topAnchor.constraint(equalTo: glamSectionTitle.bottomAnchor, constant: 16),
            glamMuseRail.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor),
            glamMuseRail.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor),
            glamMuseRail.heightAnchor.constraint(equalToConstant: 170),
            glamMuseRail.bottomAnchor.constraint(equalTo: glamContent.bottomAnchor, constant: -18),

            glamSpinner.centerXAnchor.constraint(equalTo: glamFeatureRail.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamFeatureRail.centerYAnchor)
        ])
    }

    private func glamLoadHome() {
        glamSpinner.startAnimating()
        glamRepository.glamFetchHome { [weak self] glamFeatures, glamProfiles in
            guard let self else { return }
            self.glamFeatures = glamFeatures
            self.glamProfiles = glamProfiles
            self.glamPager.numberOfPages = glamFeatures.count
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
        glamPager.currentPage = glamNext
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
        glamGrid === glamFeatureRail ? glamFeatures.count : glamProfiles.count
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
            return glamCell
        }

        let glamCell = glamGrid.dequeueReusableCell(
            withReuseIdentifier: MuzoiGlamMuseCell.glamReuseKey,
            for: glamIndexPath
        ) as! MuzoiGlamMuseCell
        glamCell.glamPresent(glamProfiles[glamIndexPath.item])
        return glamCell
    }

    func collectionView(_ glamGrid: UICollectionView, didSelectItemAt glamIndexPath: IndexPath) {
        UISelectionFeedbackGenerator().selectionChanged()
        if glamGrid === glamFeatureRail {
            let glamFeature = glamFeatures[glamIndexPath.item]
            let glamAddress = MuzoiGlamScenePassage.glamAromaCanvas.glamTraceAddress(
                glamTrailMark: glamFeature.glamIdentity
            )
            navigationController?.pushViewController(
                MuzoiGlamPrismPortalController(glamInitialTrail: glamAddress),
                animated: true
            )
        } else {
            let glamProfile = glamProfiles[glamIndexPath.item]
            let glamAddress = MuzoiGlamScenePassage.glamMuseCanvas.glamTraceAddress(
                glamTrailMark: glamProfile.glamIdentity
            )
            navigationController?.pushViewController(
                MuzoiGlamPrismPortalController(glamInitialTrail: glamAddress),
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
        glamPager.currentPage = Int(round(glamFeatureRail.contentOffset.x / glamFeatureRail.bounds.width))
        glamStartTicker()
    }

    func scrollViewDidEndDragging(_ glamMovingCanvas: UIScrollView, willDecelerate glamWillDecelerate: Bool) {
        guard glamMovingCanvas === glamFeatureRail, !glamWillDecelerate else { return }
        glamStartTicker()
    }
}
