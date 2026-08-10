import UIKit

struct MuzoiGlamLookImpression {
    let glamIdentity: String
    let glamMuseIdentity: String
    let glamArtistName: String
    let glamLookCaption: String
    let glamCoverAddress: String?
    let glamMusePortraitAddress: String?
    let glamFallbackAsset: String
    let glamPraiseCount: Int
}

final class MuzoiGlamLookArchive {
    private let glamLookTrail = MuzoiGlamVeil("/sqYpxslvqdkfKrXsRzB/mvLsjw1qvsPad")

    func glamGatherImpressions(glamReveal: @escaping ([MuzoiGlamLookImpression]) -> Void) {
        let glamGalleryParcel: [String: Any] = [
            MuzoiGlamVeil("ebdLi9tOoYrFiHaxlaG3lmoSwU"): MuzoiGlamVeil("963L2P1S9V7Z1W4C"),
            MuzoiGlamVeil("b3lYePnTdIiFnLgsSgy1mxpmhMoOn9yy"): 10,
            MuzoiGlamVeil("pFiigFmXernNt6BplficsgsH"): 2,
            MuzoiGlamVeil("m3a0kfe2uwpJSJt9oxrRyft3eJlSltiwntgR"): 1,
            MuzoiGlamVeil("neeQognvEByTeBsohXaZdhogw2"): 1
        ]

        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamLookTrail,
            glamPigmentParcel: glamGalleryParcel,
            glamArrival: { [weak self] glamReplyCanvas in
                guard let self else { return }
                let glamImpressions = self.glamShapeImpressions(glamReplyCanvas)
                glamReveal(glamImpressions.isEmpty ? self.glamCuratedImpressions() : glamImpressions)
            },
            glamDetour: { [weak self] _ in
                guard let self else { return }
                glamReveal(self.glamCuratedImpressions())
            }
        )
    }

    private func glamShapeImpressions(_ glamReplyCanvas: Any?) -> [MuzoiGlamLookImpression] {
        guard
            let glamPigmentParcel = glamReplyCanvas as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("cfoodDeR")] as? NSNumber)?.intValue == 200000,
            let glamLookRows = glamPigmentParcel[MuzoiGlamVeil("dEaRtzav")] as? [[String: Any]]
        else { return [] }

        let glamCuratedAssets = [MuzoiGlamVeil("MxuNzCoKiDG1lUaLmKEHs2s7e1nwcbeX0g16"), MuzoiGlamVeil("MZuEzqo7ipGDlcaWmCErsysHeGnmcmei0T2T"), MuzoiGlamVeil("MLuOznofiSGGl3anmjEpsesjeXnLcjeu0K3F")]
        return glamLookRows.enumerated().compactMap { glamLookIndex, glamLookRow in
            guard
                let glamCoverAddress = glamTextValue(glamLookRow[MuzoiGlamVeil("cYrhe7ahtXiVv0iStTyLG3lWoZwLuIpj")]),
                let glamIdentity = glamTextValue(glamLookRow[MuzoiGlamVeil("s5hci9mXmgeZrfD8e2tzauiulTsl")])
            else { return nil }

            return MuzoiGlamLookImpression(
                glamIdentity: glamIdentity,
                glamMuseIdentity: glamTextValue(glamLookRow[MuzoiGlamVeil("sqfXxJPRingsm2eInDtuoalFoegAyW")]) ?? "",
                glamArtistName: glamTextValue(glamLookRow[MuzoiGlamVeil("eCx9pNrgeAsnsyiLoDnAHJi1g7hzlAiKg5hUtA")]) ?? MuzoiGlamVeil("MluVzwo9iO YMquDsMea"),
                glamLookCaption: glamTextValue(glamLookRow[MuzoiGlamVeil("bBeIa8uot3ydSytNa5t8ekmfe8nPtp")]) ?? MuzoiGlamVeil("At Cngerwp rcDrxeeaTtjirv2e6 0lYoloskQ 7jqucs3tW SlhaxnOdEeJdD.r"),
                glamCoverAddress: glamCoverAddress,
                glamMusePortraitAddress: glamLookRow[MuzoiGlamVeil("sukni7nTTRocnGeCSBtRyGl1idnZgK")] as? String,
                glamFallbackAsset: glamCuratedAssets[glamLookIndex % glamCuratedAssets.count],
                glamPraiseCount: (glamLookRow[MuzoiGlamVeil("ckoUlyoPreT8hBeooVrJyIBae5aCumtUyU")] as? NSNumber)?.intValue ?? 0
            )
        }
    }

    private func glamTextValue(_ glamValue: Any?) -> String? {
        if let glamBannerCopy = glamValue as? String {
            let glamTrimmedText = glamBannerCopy.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedText.isEmpty { return glamTrimmedText }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }

    private func glamCuratedImpressions() -> [MuzoiGlamLookImpression] {
        [
            MuzoiGlamLookImpression(
                glamIdentity: MuzoiGlamVeil("7t0Y3r48061z2I0W7N696S4v7n0f9i"),
                glamMuseIdentity: MuzoiGlamVeil("7d0z383u9B5K9r434K6Y3G6E4F846H"),
                glamArtistName: MuzoiGlamVeil("Vpi6kmag QHDolsHhf"),
                glamLookCaption: MuzoiGlamVeil("SMoWm7eftmi5mTeJsX mtUheeV clao5o5kk 8fnihn5dXsu XyQowuE xb4eefyoerKeO Ly0omu3 ZfWiqned1 ginto.B"),
                glamCoverAddress: nil,
                glamMusePortraitAddress: nil,
                glamFallbackAsset: "MuzoiGlamEssence02",
                glamPraiseCount: 13
            ),
            MuzoiGlamLookImpression(
                glamIdentity: MuzoiGlamVeil("780f3b4X0214280I7C6J4E8B3H235L"),
                glamMuseIdentity: MuzoiGlamVeil("7e0v333m9g559n4V4l6J3B6y4Q825t"),
                glamArtistName: MuzoiGlamVeil("NEaTrjij 5RruyeO"),
                glamLookCaption: MuzoiGlamVeil("JmuZsot1 6fWiXnkitsJhMekd6 9mwyr CbXojlZdheHsAtC olvo8oOkD 9y4eTtc.n"),
                glamCoverAddress: nil,
                glamMusePortraitAddress: nil,
                glamFallbackAsset: "MuzoiGlamEssence01",
                glamPraiseCount: 21
            )
        ]
    }
}

final class MuzoiGlamShortcutControl: UIControl {
    private let glamAuraLayer = CAGradientLayer()
    private let glamBanner = UILabel()
    private let glamMotif = UIImageView()

    init(
        glamBannerCopy: String,
        glamMotifName: String,
        glamAuraColors: [UIColor]
    ) {
        super.init(frame: .zero)
        glamBanner.text = glamBannerCopy
        glamMotif.image = UIImage(systemName: glamMotifName)
        glamAuraLayer.colors = glamAuraColors.map(\.cgColor)
        glamSculptShortcut()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("i8nniXtQ(5cooZdre5rh:f)T yhzazsI 4nWoCtP ibGeieLno wiEmMpelYeMmAejn2tReVdb"))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamAuraLayer.frame = bounds
        layer.cornerRadius = 17
        glamAuraLayer.cornerRadius = 17
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.16) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
                self.alpha = self.isHighlighted ? 0.82 : 1
            }
        }
    }

    private func glamSculptShortcut() {
        clipsToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.withAlphaComponent(0.22).cgColor
        glamAuraLayer.startPoint = CGPoint(x: 0, y: 0.5)
        glamAuraLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(glamAuraLayer, at: 0)

        glamBanner.translatesAutoresizingMaskIntoConstraints = false
        glamBanner.textColor = .white
        glamBanner.font = .systemFont(ofSize: 16, weight: .black)
        glamBanner.numberOfLines = 2
        glamBanner.adjustsFontSizeToFitWidth = true
        glamBanner.minimumScaleFactor = 0.78

        glamMotif.translatesAutoresizingMaskIntoConstraints = false
        glamMotif.contentMode = .scaleAspectFit
        glamMotif.tintColor = UIColor.white.withAlphaComponent(0.92)
        glamMotif.layer.shadowColor = UIColor.black.cgColor
        glamMotif.layer.shadowOpacity = 0.28
        glamMotif.layer.shadowRadius = 5

        addSubview(glamBanner)
        addSubview(glamMotif)

        NSLayoutConstraint.activate([
            glamBanner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            glamBanner.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamBanner.trailingAnchor.constraint(lessThanOrEqualTo: glamMotif.leadingAnchor, constant: -6),
            glamMotif.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            glamMotif.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamMotif.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            glamMotif.heightAnchor.constraint(equalTo: glamMotif.widthAnchor)
        ])
    }
}

final class MuzoiGlamLookDeckCell: UICollectionViewCell {
    static let glamReuseKey = MuzoiGlamVeil("Mtu2zYoxibGnluaym2L6oRoJkTDsejc0kcCyeHlxlW")
    private static let glamLookCache = NSCache<NSString, UIImage>()
    private static let glamArtistCache = NSCache<NSString, UIImage>()

    var glamCanvasAction: (() -> Void)?
    var glamArtistAction: (() -> Void)?
    var glamFlagAction: (() -> Void)?

    private let glamLookSurface = UIImageView()
    private let glamShadowVeil = CAGradientLayer()
    private let glamRevealControl = UIButton(type: .custom)
    private let glamSparkControl = UIButton(type: .custom)
    private let glamArtistPortrait = UIImageView()
    private let glamArtistName = UILabel()
    private let glamLookCaption = UILabel()
    private let glamFlagControl = UIButton(type: .custom)
    private var glamLookTask: URLSessionDataTask?
    private var glamArtistTask: URLSessionDataTask?
    private var glamExpectedLookTrail: String?
    private var glamExpectedArtistTrail: String?

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamSculptCard()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("iTnqittt(xceoWdQeMra:R)3 Lhpa2sm Yn4o3tL ebdeXegn7 JiimkpHl1eSmseFn2tfeodc"))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamShadowVeil.frame = bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glamLookTask?.cancel()
        glamArtistTask?.cancel()
        glamExpectedLookTrail = nil
        glamExpectedArtistTrail = nil
        glamCanvasAction = nil
        glamArtistAction = nil
        glamFlagAction = nil
    }

    func glamRenderImpression(_ glamImpression: MuzoiGlamLookImpression) {
        glamLookTask?.cancel()
        glamArtistTask?.cancel()
        glamLookSurface.image = UIImage(named: glamImpression.glamFallbackAsset)
        glamArtistPortrait.image = UIImage(named: "MuzoiGlamMuse01")
        glamArtistName.text = MuzoiGlamVeil("@E") + glamImpression.glamArtistName
        glamLookCaption.text = glamImpression.glamLookCaption
        glamSparkControl.accessibilityLabel = MuzoiGlamVeil("Ospne6nl plkoboRkt FdqejtcaXiNlDsH,a q") + "\(glamImpression.glamPraiseCount)" + MuzoiGlamVeil(" Zl3iUkHeasm")
        glamExpectedLookTrail = glamImpression.glamCoverAddress
        glamExpectedArtistTrail = glamImpression.glamMusePortraitAddress
        glamFetchArtwork(
            glamImpression.glamCoverAddress,
            glamGalleryCache: Self.glamLookCache,
            glamIsArtist: false
        )
        glamFetchArtwork(
            glamImpression.glamMusePortraitAddress,
            glamGalleryCache: Self.glamArtistCache,
            glamIsArtist: true
        )
    }

    private func glamSculptCard() {
        glamPrepareLookSurface()
        glamPrepareLookReveal()
        glamPrepareLookSpark()
        glamPrepareLookArtist()
        glamPrepareLookText()
        glamPrepareLookFlag()
        glamAddLookCardPieces()
        glamPinLookCard()
    }

    private func glamPrepareLookSurface() {
        contentView.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamLookSurface.translatesAutoresizingMaskIntoConstraints = false
        glamLookSurface.contentMode = .scaleAspectFill
        glamLookSurface.clipsToBounds = true
        contentView.addSubview(glamLookSurface)

        glamShadowVeil.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.82).cgColor]
        glamShadowVeil.startPoint = CGPoint(x: 0.5, y: 0.45)
        glamShadowVeil.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShadowVeil)
    }

    private func glamPrepareLookReveal() {
        glamRevealControl.translatesAutoresizingMaskIntoConstraints = false
        glamRevealControl.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        glamRevealControl.layer.borderColor = UIColor.white.cgColor
        glamRevealControl.layer.borderWidth = 5
        glamRevealControl.layer.cornerRadius = 38
        glamRevealControl.tintColor = .white
        glamRevealControl.setImage(UIImage(systemName: "play.fill"), for: .normal)
        glamRevealControl.imageView?.contentMode = .scaleAspectFit
        glamRevealControl.accessibilityLabel = MuzoiGlamVeil("O6pmecnl qlSoLoakK CdQe0tfaJijl6so")
        glamRevealControl.addTarget(self, action: #selector(glamOpenCanvas), for: .touchUpInside)
    }

    private func glamPrepareLookSpark() {
        glamSparkControl.translatesAutoresizingMaskIntoConstraints = false
        glamSparkControl.backgroundColor = UIColor.black.withAlphaComponent(0.88)
        glamSparkControl.layer.cornerRadius = 32
        glamSparkControl.tintColor = UIColor(red: 1, green: 0.24, blue: 0.55, alpha: 1)
        let glamHeartConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        glamSparkControl.setImage(UIImage(systemName: "heart", withConfiguration: glamHeartConfig), for: .normal)
        glamSparkControl.addTarget(self, action: #selector(glamOpenCanvas), for: .touchUpInside)
    }

    private func glamPrepareLookArtist() {
        glamArtistPortrait.translatesAutoresizingMaskIntoConstraints = false
        glamArtistPortrait.contentMode = .scaleAspectFill
        glamArtistPortrait.clipsToBounds = true
        glamArtistPortrait.layer.cornerRadius = 25
        glamArtistPortrait.layer.borderWidth = 2
        glamArtistPortrait.layer.borderColor = UIColor.white.cgColor
        glamArtistPortrait.isUserInteractionEnabled = true
        glamArtistPortrait.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(glamOpenArtist)))

        glamArtistName.translatesAutoresizingMaskIntoConstraints = false
        glamArtistName.textColor = .white
        glamArtistName.font = .systemFont(ofSize: 21, weight: .bold)
        glamArtistName.adjustsFontSizeToFitWidth = true
        glamArtistName.minimumScaleFactor = 0.72
    }

    private func glamPrepareLookText() {
        glamLookCaption.translatesAutoresizingMaskIntoConstraints = false
        glamLookCaption.textColor = .white
        glamLookCaption.font = .systemFont(ofSize: 17, weight: .regular)
        glamLookCaption.numberOfLines = 2
        glamLookCaption.lineBreakMode = .byTruncatingTail
    }

    private func glamPrepareLookFlag() {
        glamFlagControl.translatesAutoresizingMaskIntoConstraints = false
        glamFlagControl.setTitle(MuzoiGlamVeil("!q"), for: .normal)
        glamFlagControl.setTitleColor(UIColor.black.withAlphaComponent(0.72), for: .normal)
        glamFlagControl.titleLabel?.font = .systemFont(ofSize: 17, weight: .black)
        glamFlagControl.backgroundColor = UIColor.white.withAlphaComponent(0.68)
        glamFlagControl.layer.cornerRadius = 16
        glamFlagControl.accessibilityLabel = MuzoiGlamVeil("RreNp5odrQtx")
        glamFlagControl.addTarget(self, action: #selector(glamOpenFlag), for: .touchUpInside)
    }

    private func glamAddLookCardPieces() {
        [glamRevealControl, glamSparkControl, glamArtistPortrait, glamArtistName, glamLookCaption, glamFlagControl].forEach {
            contentView.addSubview($0)
        }
    }

    private func glamPinLookCard() {
        NSLayoutConstraint.activate(glamLookSurfaceConstraints())
        NSLayoutConstraint.activate(glamLookCenterActionConstraints())
        NSLayoutConstraint.activate(glamLookArtistConstraints())
    }

    private func glamLookSurfaceConstraints() -> [NSLayoutConstraint] {
        [
            glamLookSurface.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamLookSurface.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamLookSurface.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamLookSurface.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
    }

    private func glamLookCenterActionConstraints() -> [NSLayoutConstraint] {
        [
            glamRevealControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            glamRevealControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -18),
            glamRevealControl.widthAnchor.constraint(equalToConstant: 76),
            glamRevealControl.heightAnchor.constraint(equalTo: glamRevealControl.widthAnchor),
            glamSparkControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            glamSparkControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -52),
            glamSparkControl.widthAnchor.constraint(equalToConstant: 64),
            glamSparkControl.heightAnchor.constraint(equalTo: glamSparkControl.widthAnchor)
        ]
    }

    private func glamLookArtistConstraints() -> [NSLayoutConstraint] {
        [
            glamArtistPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            glamArtistPortrait.bottomAnchor.constraint(equalTo: glamLookCaption.topAnchor, constant: -11),
            glamArtistPortrait.widthAnchor.constraint(equalToConstant: 50),
            glamArtistPortrait.heightAnchor.constraint(equalTo: glamArtistPortrait.widthAnchor),
            glamArtistName.leadingAnchor.constraint(equalTo: glamArtistPortrait.trailingAnchor, constant: 12),
            glamArtistName.centerYAnchor.constraint(equalTo: glamArtistPortrait.centerYAnchor),
            glamFlagControl.leadingAnchor.constraint(equalTo: glamArtistName.trailingAnchor, constant: 10),
            glamFlagControl.centerYAnchor.constraint(equalTo: glamArtistName.centerYAnchor),
            glamFlagControl.widthAnchor.constraint(equalToConstant: 32),
            glamFlagControl.heightAnchor.constraint(equalTo: glamFlagControl.widthAnchor),
            glamFlagControl.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -92),
            glamLookCaption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            glamLookCaption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            glamLookCaption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ]
    }

    private func glamFetchArtwork(
        _ glamFinalTrail: String?,
        glamGalleryCache: NSCache<NSString, UIImage>,
        glamIsArtist: Bool
    ) {
        guard let glamFinalTrail, let glamURL = URL(string: glamFinalTrail) else { return }
        if let glamCachedArtwork = glamGalleryCache.object(forKey: glamFinalTrail as NSString) {
            if glamIsArtist { glamArtistPortrait.image = glamCachedArtwork } else { glamLookSurface.image = glamCachedArtwork }
            return
        }

        let glamArtworkTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedArtwork = UIImage(data: glamData) else { return }
            glamGalleryCache.setObject(glamFetchedArtwork, forKey: glamFinalTrail as NSString)
            DispatchQueue.main.async {
                guard let self else { return }
                if glamIsArtist {
                    guard self.glamExpectedArtistTrail == glamFinalTrail else { return }
                    self.glamArtistPortrait.image = glamFetchedArtwork
                } else {
                    guard self.glamExpectedLookTrail == glamFinalTrail else { return }
                    UIView.transition(
                        with: self.glamLookSurface,
                        duration: 0.22,
                        options: .transitionCrossDissolve,
                        animations: { self.glamLookSurface.image = glamFetchedArtwork }
                    )
                }
            }
        }
        if glamIsArtist { glamArtistTask = glamArtworkTask } else { glamLookTask = glamArtworkTask }
        glamArtworkTask.resume()
    }

    @objc private func glamOpenCanvas() {
        glamCanvasAction?()
    }

    @objc private func glamOpenArtist() {
        glamArtistAction?()
    }

    @objc private func glamOpenFlag() {
        glamFlagAction?()
    }
}

final class MuzoiGlamLookDeckController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    private let glamLookArchive = MuzoiGlamLookArchive()
    private let glamHeaderAura = UIView()
    private let glamHeaderAuraLayer = CAGradientLayer()
    private let glamBanner = UILabel()
    private let glamShortcutRibbon = UIStackView()
    private let glamLookFlow = UICollectionViewFlowLayout()
    private lazy var glamLookRail = UICollectionView(frame: .zero, collectionViewLayout: glamLookFlow)
    private let glamComposeControl = UIButton(type: .custom)
    private let glamOrbitSpinner = UIActivityIndicatorView(style: .large)
    private var glamImpressions: [MuzoiGlamLookImpression] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        glamComposeGallery()
        glamGatherImpressions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamHeaderAuraLayer.frame = glamHeaderAura.bounds
        let glamCardExtent = glamLookRail.bounds.size
        if glamLookFlow.itemSize != glamCardExtent {
            glamLookFlow.itemSize = glamCardExtent
            glamLookFlow.invalidateLayout()
        }
    }

    private func glamComposeGallery() {
        glamPaintGalleryBackdrop()
        glamPolishGalleryBanner()
        glamBuildGalleryShortcuts()
        glamPrepareGalleryRail()
        glamPrepareGalleryComposer()
        glamPrepareGallerySpinner()
        glamPinGalleryRunway()
    }

    private func glamPaintGalleryBackdrop() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamHeaderAura.translatesAutoresizingMaskIntoConstraints = false
        glamHeaderAuraLayer.colors = [
            UIColor(red: 0.56, green: 0, blue: 0.45, alpha: 1).cgColor,
            UIColor(red: 0.12, green: 0.06, blue: 0.16, alpha: 1).cgColor
        ]
        glamHeaderAuraLayer.startPoint = CGPoint(x: 0, y: 0)
        glamHeaderAuraLayer.endPoint = CGPoint(x: 1, y: 1)
        glamHeaderAura.layer.addSublayer(glamHeaderAuraLayer)
        view.addSubview(glamHeaderAura)
    }

    private func glamPolishGalleryBanner() {
        glamBanner.translatesAutoresizingMaskIntoConstraints = false
        glamBanner.text = MuzoiGlamVeil("DNi2sbcSo1vVeTra")
        glamBanner.textColor = .white
        glamBanner.font = .systemFont(ofSize: 31, weight: .heavy)
        glamBanner.layer.shadowColor = UIColor.black.cgColor
        glamBanner.layer.shadowOpacity = 0.26
        glamBanner.layer.shadowRadius = 5
        view.addSubview(glamBanner)
    }

    private func glamBuildGalleryShortcuts() {
        let glamTechniqueControl = MuzoiGlamShortcutControl(
            glamBannerCopy: MuzoiGlamVeil("T3RaIdCyK2 d&Y\nSBjLaEDNcDu"),
            glamMotifName: "paintbrush.pointed.fill",
            glamAuraColors: [UIColor(red: 0.22, green: 0.07, blue: 0.14, alpha: 1), UIColor(red: 0.70, green: 0.31, blue: 0.12, alpha: 1)]
        )
        glamTechniqueControl.addTarget(self, action: #selector(glamOpenTechniqueArchive), for: .touchUpInside)
        glamTechniqueControl.accessibilityLabel = MuzoiGlamVeil("Oup1e7n9 OaLr6olmba4 TkUnBoLwWlaehdXgZey qlAidbLrcasreyc")

        let glamSparkControl = MuzoiGlamShortcutControl(
            glamBannerCopy: MuzoiGlamVeil("TBReYuORN8\n3AhIU"),
            glamMotifName: "ellipsis.bubble.fill",
            glamAuraColors: [UIColor(red: 0.18, green: 0.06, blue: 0.28, alpha: 1), UIColor(red: 0.68, green: 0.05, blue: 0.74, alpha: 1)]
        )
        glamSparkControl.addTarget(self, action: #selector(glamOpenSparkStudio), for: .touchUpInside)
        glamSparkControl.accessibilityLabel = MuzoiGlamVeil("O2pMecnu 2AaIg RmnaCkre6u3pG aeAxApYearXtO")

        glamShortcutRibbon.translatesAutoresizingMaskIntoConstraints = false
        glamShortcutRibbon.axis = .horizontal
        glamShortcutRibbon.spacing = 10
        glamShortcutRibbon.distribution = .fillEqually
        glamShortcutRibbon.addArrangedSubview(glamTechniqueControl)
        glamShortcutRibbon.addArrangedSubview(glamSparkControl)
        view.addSubview(glamShortcutRibbon)
    }

    private func glamPrepareGalleryRail() {
        glamLookFlow.scrollDirection = .horizontal
        glamLookFlow.minimumLineSpacing = 0
        glamLookRail.translatesAutoresizingMaskIntoConstraints = false
        glamLookRail.backgroundColor = .clear
        glamLookRail.isPagingEnabled = true
        glamLookRail.showsHorizontalScrollIndicator = false
        glamLookRail.decelerationRate = .fast
        glamLookRail.dataSource = self
        glamLookRail.delegate = self
        glamLookRail.register(MuzoiGlamLookDeckCell.self, forCellWithReuseIdentifier: MuzoiGlamLookDeckCell.glamReuseKey)
        view.addSubview(glamLookRail)
    }

    private func glamPrepareGalleryComposer() {
        glamComposeControl.translatesAutoresizingMaskIntoConstraints = false
        glamComposeControl.backgroundColor = UIColor(red: 0.94, green: 0.45, blue: 0.86, alpha: 1)
        glamComposeControl.tintColor = UIColor(red: 20 / 255, green: 17 / 255, blue: 28 / 255, alpha: 1)
        glamComposeControl.layer.cornerRadius = 30
        glamComposeControl.layer.shadowColor = UIColor.black.cgColor
        glamComposeControl.layer.shadowOpacity = 0.30
        glamComposeControl.layer.shadowRadius = 12
        glamComposeControl.layer.shadowOffset = CGSize(width: 0, height: 6)
        let glamAddConfig = UIImage.SymbolConfiguration(pointSize: 29, weight: .black)
        glamComposeControl.setImage(UIImage(systemName: "plus", withConfiguration: glamAddConfig), for: .normal)
        glamComposeControl.accessibilityLabel = MuzoiGlamVeil("POusbZlGiWsDhb Ta6 7nAeywE nschZo2wycVaZsJej")
        glamComposeControl.addTarget(self, action: #selector(glamOpenComposer), for: .touchUpInside)
        view.addSubview(glamComposeControl)
    }

    private func glamPrepareGallerySpinner() {
        glamOrbitSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamOrbitSpinner.color = .white
        view.addSubview(glamOrbitSpinner)
    }

    private func glamPinGalleryRunway() {
        NSLayoutConstraint.activate([
            glamHeaderAura.topAnchor.constraint(equalTo: view.topAnchor),
            glamHeaderAura.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamHeaderAura.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamHeaderAura.bottomAnchor.constraint(equalTo: glamLookRail.topAnchor),

            glamBanner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            glamBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            glamShortcutRibbon.topAnchor.constraint(equalTo: glamBanner.bottomAnchor, constant: 24),
            glamShortcutRibbon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            glamShortcutRibbon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            glamShortcutRibbon.heightAnchor.constraint(equalToConstant: 80),

            glamLookRail.topAnchor.constraint(equalTo: glamShortcutRibbon.bottomAnchor, constant: 24),
            glamLookRail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamLookRail.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamLookRail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            glamComposeControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            glamComposeControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -132),
            glamComposeControl.widthAnchor.constraint(equalToConstant: 60),
            glamComposeControl.heightAnchor.constraint(equalTo: glamComposeControl.widthAnchor),

            glamOrbitSpinner.centerXAnchor.constraint(equalTo: glamLookRail.centerXAnchor),
            glamOrbitSpinner.centerYAnchor.constraint(equalTo: glamLookRail.centerYAnchor)
        ])
    }

    private func glamGatherImpressions() {
        glamOrbitSpinner.startAnimating()
        glamLookArchive.glamGatherImpressions { [weak self] glamImpressions in
            guard let self else { return }
            self.glamImpressions = glamImpressions
            self.glamLookRail.reloadData()
            self.glamOrbitSpinner.stopAnimating()
        }
    }

    func collectionView(_ glamGrid: UICollectionView, numberOfItemsInSection glamSection: Int) -> Int {
        glamImpressions.count
    }

    func collectionView(
        _ glamGrid: UICollectionView,
        cellForItemAt glamCardPath: IndexPath
    ) -> UICollectionViewCell {
        let glamLookCard = glamGrid.dequeueReusableCell(
            withReuseIdentifier: MuzoiGlamLookDeckCell.glamReuseKey,
            for: glamCardPath
        ) as! MuzoiGlamLookDeckCell
        let glamImpression = glamImpressions[glamCardPath.item]
        glamLookCard.glamRenderImpression(glamImpression)
        glamLookCard.glamCanvasAction = { [weak self] in
            self?.glamOpenCanvasPassage(.glamMotionCanvas, glamTrailMark: glamImpression.glamIdentity)
        }
        glamLookCard.glamArtistAction = { [weak self] in
            self?.glamOpenCanvasPassage(.glamMuseCanvas, glamTrailMark: glamImpression.glamMuseIdentity)
        }
        glamLookCard.glamFlagAction = { [weak self] in
            self?.glamOpenCanvasPassage(.glamFlagCanvas, glamTrailMark: "")
        }
        return glamLookCard
    }

    private func glamOpenCanvasPassage(_ glamPassage: MuzoiGlamScenePassage, glamTrailMark: String) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamFinalTrail = glamPassage.glamTraceAddress(glamTrailMark: glamTrailMark)
        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamFinalTrail),
            animated: true
        )
    }

    @objc private func glamOpenTechniqueArchive() {
        glamOpenCanvasPassage(.glamTechniqueArchive, glamTrailMark: MuzoiGlamVeil("06"))
    }

    @objc private func glamOpenSparkStudio() {
        glamOpenCanvasPassage(.glamSparkStudio, glamTrailMark: "")
    }

    @objc private func glamOpenComposer() {
        glamOpenCanvasPassage(.glamComposeShowcase, glamTrailMark: "")
    }
}
