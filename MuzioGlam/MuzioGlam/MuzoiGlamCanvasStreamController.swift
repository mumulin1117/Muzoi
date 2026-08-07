import UIKit

struct MuzoiGlamCanvasMoment {
    let glamIdentity: String
    let glamMuseIdentity: String
    let glamMuseName: String
    let glamMusePortraitAddress: String?
    let glamCaption: String
    let glamCreatedAt: TimeInterval
    let glamImageAddresses: [String]
    let glamFallbackAssets: [String]
    let glamCommentCount: Int
    var glamPraiseCount: Int
    var glamIsAttended: Bool
    var glamIsPraised: Bool
}

final class MuzoiGlamCanvasStreamRepository {
    private let glamDynamicEndpoint = MuzoiGlamVeil("/oq5pSszvUdRf3rjsnzP/Vv3swwRqZsmag")
    private let glamPraiseEndpoint = MuzoiGlamVeil("/4nVl3byzhv8zV/td6o1iDdyp4q8kbu4")

    func glamFetchCanvasMoments(glamYield: @escaping ([MuzoiGlamCanvasMoment]) -> Void) {
        let glamCanvasEnvelope: [String: Any] = [
            MuzoiGlamVeil("eCdiiAtpoLrqi4aIlVG8luoNwS"): MuzoiGlamVeil("913z2z189h7T144G"),
            MuzoiGlamVeil("b1ltennYdEihnagGSAyomZpzhzoFnTyd"): 10,
            MuzoiGlamVeil("p4ipgjmDeCnZtJBclJi8shsC"): 2,
            MuzoiGlamVeil("mtaEk0ejunpRSotoocrUy8tHe6lJlSiPnygI"): 1,
            MuzoiGlamVeil("nReLogn9ELyLeFsFhMardjojws"): 1
        ]

        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamDynamicEndpoint,
            glamPigmentParcel: glamCanvasEnvelope,
            glamArrival: { [weak self] glamObject in
                guard let self else { return }
                let glamMoments = self.glamDecodeCanvasMoments(glamObject)
                glamYield(glamMoments.isEmpty ? self.glamCuratedImpressions() : glamMoments)
            },
            glamDetour: { [weak self] _ in
                guard let self else { return }
                glamYield(self.glamCuratedImpressions())
            }
        )
    }

    func glamTogglePraise(
        glamIdentity: String,
        glamCompletion: @escaping (Bool) -> Void
    ) {
        glamTransmitMutation(
            glamTrail: glamPraiseEndpoint,
            glamPigmentParcel: [MuzoiGlamVeil("gDlwint8tPeMrLSkt1oDr6mPLBoHofkIsO"): glamIdentity],
            glamCompletion: glamCompletion
        )
    }

    private func glamTransmitMutation(
        glamTrail: String,
        glamPigmentParcel: [String: Any],
        glamCompletion: @escaping (Bool) -> Void
    ) {
        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamTrail,
            glamPigmentParcel: glamPigmentParcel,
            glamArrival: { glamObject in
                let glamPigmentParcel = glamObject as? [String: Any]
                let glamCode = (glamPigmentParcel?[MuzoiGlamVeil("cwoLdley")] as? NSNumber)?.intValue
                glamCompletion(glamCode == 200000)
            },
            glamDetour: { _ in glamCompletion(false) }
        )
    }

    private func glamDecodeCanvasMoments(_ glamObject: Any?) -> [MuzoiGlamCanvasMoment] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("cxoRd6eM")] as? NSNumber)?.intValue == 200000,
            let glamRows = glamPigmentParcel[MuzoiGlamVeil("dnaithaB")] as? [[String: Any]]
        else { return [] }

        let glamFallbackAssets = ["MuzoiGlamEssence01", "MuzoiGlamEssence02", "MuzoiGlamEssence03"]
        return glamRows.enumerated().compactMap { glamOffset, glamRow in
            guard glamTextValue(glamRow[MuzoiGlamVeil("cyryexahtUiSvKiTtayoG9llotwYuMpg")]) == nil else { return nil }
            guard let glamIdentity = glamTextValue(glamRow[MuzoiGlamVeil("sghZiRmZmoekrRDneOtIa0iBlCsc")]) else { return nil }

            let glamAddresses = ((glamRow[MuzoiGlamVeil("sWtLyDlxesGRl6oMw5IknEsAivgbhKtS")] as? [String])
                ?? (glamRow[MuzoiGlamVeil("pTaqiinat4eOdePae6rDsLorneaO")] as? [String])
                ?? [])
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }
            guard !glamAddresses.isEmpty else { return nil }

            let glamPrimaryFallback = glamFallbackAssets[glamOffset % glamFallbackAssets.count]
            let glamSecondaryFallback = glamFallbackAssets[(glamOffset + 1) % glamFallbackAssets.count]
            return MuzoiGlamCanvasMoment(
                glamIdentity: glamIdentity,
                glamMuseIdentity: glamTextValue(glamRow[MuzoiGlamVeil("sFf9x9PaiBgqmGeLnItpo3lYoIg6y8")]) ?? "",
                glamMuseName: glamTextValue(glamRow[MuzoiGlamVeil("ehx1pprne6sgsGiPolnHHxiMgohBlmieg1hTtk")]) ?? MuzoiGlamVeil("MLurzlodip aMdu4s7e4"),
                glamMusePortraitAddress: glamTextValue(glamRow[MuzoiGlamVeil("sFkDiVndTOoHnwevSAteyWlWiknQgX")]),
                glamCaption: glamTextValue(glamRow[MuzoiGlamVeil("bxeRawu1tXyoSUtHaNtcePmve6nutI")]) ?? MuzoiGlamVeil("Ai HfnrLeds6hg Xm9aQkieFuwpA wcVa2nZvOaNsn OjquPswtr aaNr6rGiRvxeedW.h"),
                glamCreatedAt: (glamRow[MuzoiGlamVeil("lga4sthzeXsiVdoLlwuSmLecAWrgtR")] as? NSNumber)?.doubleValue ?? 0,
                glamImageAddresses: Array(glamAddresses.prefix(2)),
                glamFallbackAssets: [glamPrimaryFallback, glamSecondaryFallback],
                glamCommentCount: (glamRow[MuzoiGlamVeil("miankieeuMp2P5avlDegtRtGe5POlFaqys")] as? NSNumber)?.intValue ?? 0,
                glamPraiseCount: (glamRow[MuzoiGlamVeil("c4o8lfoDrETDhie4oHrDyGBmeta6ultpyW")] as? NSNumber)?.intValue ?? 0,
                glamIsAttended: (glamRow[MuzoiGlamVeil("l1ipqGumiDdRPaizgxm7eGnStGF3lLoVwW")] as? NSNumber)?.intValue == 1,
                glamIsPraised: (glamRow[MuzoiGlamVeil("aeiurGbyrFuesWhIBzeLasuDtVyqwnacvhez")] as? NSNumber)?.intValue == 1
            )
        }
    }

    private func glamTextValue(_ glamValue: Any?) -> String? {
        if let glamText = glamValue as? String {
            let glamTrimmedText = glamText.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedText.isEmpty { return glamTrimmedText }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }

    private func glamCuratedImpressions() -> [MuzoiGlamCanvasMoment] {
        [
            MuzoiGlamCanvasMoment(
                glamIdentity: MuzoiGlamVeil("7J0q3x4h0u0s034T9k3m8i1B4m4t5Q"),
                glamMuseIdentity: MuzoiGlamVeil("7d0i34309D5I9Z404b6r3G6Z4h8F8i"),
                glamMuseName: MuzoiGlamVeil("SgeRrXaO nLKufnLek"),
                glamMusePortraitAddress: nil,
                glamCaption: MuzoiGlamVeil("Nhedwi jSaFKX6 llWo2oKks ojquNsttF xdZrqoopXpUePdP G—1 0ccoWmLeH JhZy9pqeC FiTtP Ju0pQ!s"),
                glamCreatedAt: Date().addingTimeInterval(-300).timeIntervalSince1970 * 1_000,
                glamImageAddresses: [],
                glamFallbackAssets: ["MuzoiGlamEssence02", "MuzoiGlamEssence03"],
                glamCommentCount: 19,
                glamPraiseCount: 234,
                glamIsAttended: false,
                glamIsPraised: true
            ),
            MuzoiGlamCanvasMoment(
                glamIdentity: MuzoiGlamVeil("7H0G3G4o030O0j4m9u3i2A8R1m9M7z"),
                glamMuseIdentity: MuzoiGlamVeil("7U013X3q9D509n4M4T6C396H4v8B6f"),
                glamMuseName: MuzoiGlamVeil("Vzi9kqad SHJoPs2hT"),
                glamMusePortraitAddress: nil,
                glamCaption: MuzoiGlamVeil("Az wbxiat9 ZohfX Ppha5iWnYt0,G Lan vwmhOojlOez VnOeOwk tree1aHlViDtqyO.v"),
                glamCreatedAt: Date().addingTimeInterval(-480).timeIntervalSince1970 * 1_000,
                glamImageAddresses: [],
                glamFallbackAssets: ["MuzoiGlamEssence01", "MuzoiGlamEssence04"],
                glamCommentCount: 12,
                glamPraiseCount: 186,
                glamIsAttended: true,
                glamIsPraised: false
            )
        ]
    }
}

final class MuzoiGlamCanvasMomentCell: UITableViewCell {
    static let glamReuseKey = MuzoiGlamVeil("MSuMzKoSiaGSljaXmXCcaDnbvTaJsMMfo0mFeanht4CweFlclo")
    private static let glamPortraitCache = NSCache<NSString, UIImage>()

    var glamDetailAction: (() -> Void)?
    var glamMuseAction: (() -> Void)?
    var glamAttentionAction: (() -> Void)?
    var glamPraiseAction: (() -> Void)?
    var glamReportAction: (() -> Void)?

    private let glamCard = UIView()
    private let glamMuseControl = UIButton(type: .custom)
    private let glamMuseName = UILabel()
    private let glamTime = UILabel()
    private let glamAttentionControl = UIButton(type: .custom)
    private let glamCaption = UILabel()
    private let glamImageStrip = UIStackView()
    private let glamPrimaryImage = UIImageView()
    private let glamSecondaryImage = UIImageView()
    private let glamReportControl = UIButton(type: .custom)
    private let glamCommentControl = UIButton(type: .custom)
    private let glamPraiseControl = UIButton(type: .custom)
    private var glamImageTasks: [URLSessionDataTask] = []
    private var glamExpectedAddresses: [String?] = [nil, nil, nil]

    override init(style glamStyle: UITableViewCell.CellStyle, reuseIdentifier glamReuseIdentifier: String?) {
        super.init(style: glamStyle, reuseIdentifier: glamReuseIdentifier)
        glamSculptShowpieceCell()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("iVn4iJts(rc5osd3eVrR:r)b LhGa7sO 7nLo4tF 1bSe7exnN hiIm2pBlJeImAeKndtke4dR"))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glamImageTasks.forEach { $0.cancel() }
        glamImageTasks.removeAll()
        glamExpectedAddresses = [nil, nil, nil]
        glamDetailAction = nil
        glamMuseAction = nil
        glamAttentionAction = nil
        glamPraiseAction = nil
        glamReportAction = nil
    }

    func glamPresent(_ glamMoment: MuzoiGlamCanvasMoment) {
        glamImageTasks.forEach { $0.cancel() }
        glamImageTasks.removeAll()

        glamMuseControl.setImage(UIImage(named: "MuzoiGlamMuse01"), for: .normal)
        glamPrimaryImage.image = UIImage(named: glamMoment.glamFallbackAssets.first ?? "MuzoiGlamEssence01")
        glamSecondaryImage.image = UIImage(named: glamMoment.glamFallbackAssets.dropFirst().first ?? "MuzoiGlamEssence02")
        glamMuseName.text = glamMoment.glamMuseName
        glamTime.text = glamRelativeText(glamMoment.glamCreatedAt)
        glamCaption.text = glamMoment.glamCaption
        glamRenderAttention(glamMoment.glamIsAttended)
        glamRenderPraise(glamMoment.glamIsPraised, glamCount: glamMoment.glamPraiseCount)
        glamCommentControl.setTitle(MuzoiGlamVeil(" A K") + "\(glamMoment.glamCommentCount)", for: .normal)

        let glamPortraitAddress = glamMoment.glamMusePortraitAddress
        let glamPrimaryAddress = glamMoment.glamImageAddresses.first
        let glamSecondaryAddress = glamMoment.glamImageAddresses.dropFirst().first
        glamExpectedAddresses = [glamPortraitAddress, glamPrimaryAddress, glamSecondaryAddress]
        glamLoadImage(glamPortraitAddress, glamSlot: 0)
        glamLoadImage(glamPrimaryAddress, glamSlot: 1)
        glamLoadImage(glamSecondaryAddress, glamSlot: 2)
        glamSecondaryImage.isHidden = glamSecondaryAddress == nil && glamMoment.glamFallbackAssets.count < 2
    }

    private func glamSculptShowpieceCell() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        glamCard.translatesAutoresizingMaskIntoConstraints = false
        glamCard.backgroundColor = UIColor(red: 20 / 255, green: 23 / 255, blue: 34 / 255, alpha: 1)
        glamCard.layer.cornerRadius = 17
        glamCard.clipsToBounds = true
        contentView.addSubview(glamCard)
        let glamCardTap = UITapGestureRecognizer(target: self, action: #selector(glamOpenDetails))
        glamCardTap.delegate = self
        glamCard.addGestureRecognizer(glamCardTap)

        glamMuseControl.translatesAutoresizingMaskIntoConstraints = false
        glamMuseControl.imageView?.contentMode = .scaleAspectFill
        glamMuseControl.clipsToBounds = true
        glamMuseControl.layer.cornerRadius = 25
        glamMuseControl.addTarget(self, action: #selector(glamOpenMuse), for: .touchUpInside)

        glamMuseName.translatesAutoresizingMaskIntoConstraints = false
        glamMuseName.textColor = .white
        glamMuseName.font = .systemFont(ofSize: 18, weight: .bold)
        glamTime.translatesAutoresizingMaskIntoConstraints = false
        glamTime.textColor = UIColor.white.withAlphaComponent(0.48)
        glamTime.font = .systemFont(ofSize: 14, weight: .regular)

        glamAttentionControl.translatesAutoresizingMaskIntoConstraints = false
        glamAttentionControl.layer.cornerRadius = 16
        glamAttentionControl.layer.borderWidth = 1.5
        glamAttentionControl.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        glamAttentionControl.addTarget(self, action: #selector(glamOpenAttentionDetails), for: .touchUpInside)

        glamCaption.translatesAutoresizingMaskIntoConstraints = false
        glamCaption.textColor = .white
        glamCaption.font = .systemFont(ofSize: 17, weight: .regular)
        glamCaption.numberOfLines = 0

        [glamPrimaryImage, glamSecondaryImage].forEach {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
        glamImageStrip.translatesAutoresizingMaskIntoConstraints = false
        glamImageStrip.axis = .horizontal
        glamImageStrip.spacing = 8
        glamImageStrip.distribution = .fillEqually
        glamImageStrip.addArrangedSubview(glamPrimaryImage)
        glamImageStrip.addArrangedSubview(glamSecondaryImage)

        glamReportControl.translatesAutoresizingMaskIntoConstraints = false
        glamReportControl.setImage(UIImage(systemName: "info.circle"), for: .normal)
        glamReportControl.tintColor = UIColor.white.withAlphaComponent(0.36)
        glamReportControl.accessibilityLabel = MuzoiGlamVeil("RZeApCoAr6tK")
        glamReportControl.addTarget(self, action: #selector(glamOpenReport), for: .touchUpInside)

        glamCommentControl.translatesAutoresizingMaskIntoConstraints = false
        glamCommentControl.setImage(UIImage(systemName: "ellipsis.bubble"), for: .normal)
        glamCommentControl.tintColor = UIColor(red: 0.23, green: 0.42, blue: 1, alpha: 1)
        glamCommentControl.setTitleColor(.white, for: .normal)
        glamCommentControl.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        glamCommentControl.addTarget(self, action: #selector(glamOpenDetails), for: .touchUpInside)

        glamPraiseControl.translatesAutoresizingMaskIntoConstraints = false
        glamPraiseControl.setTitleColor(.white, for: .normal)
        glamPraiseControl.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        glamPraiseControl.addTarget(self, action: #selector(glamTogglePraise), for: .touchUpInside)

        [
            glamMuseControl, glamMuseName, glamTime, glamAttentionControl,
            glamCaption, glamImageStrip, glamReportControl, glamCommentControl, glamPraiseControl
        ].forEach { glamCard.addSubview($0) }

        NSLayoutConstraint.activate([
            glamCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            glamCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            glamCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            glamCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            glamMuseControl.topAnchor.constraint(equalTo: glamCard.topAnchor, constant: 16),
            glamMuseControl.leadingAnchor.constraint(equalTo: glamCard.leadingAnchor, constant: 15),
            glamMuseControl.widthAnchor.constraint(equalToConstant: 50),
            glamMuseControl.heightAnchor.constraint(equalTo: glamMuseControl.widthAnchor),
            glamMuseName.leadingAnchor.constraint(equalTo: glamMuseControl.trailingAnchor, constant: 12),
            glamMuseName.topAnchor.constraint(equalTo: glamMuseControl.topAnchor, constant: 4),
            glamTime.leadingAnchor.constraint(equalTo: glamMuseName.leadingAnchor),
            glamTime.topAnchor.constraint(equalTo: glamMuseName.bottomAnchor, constant: 3),

            glamAttentionControl.trailingAnchor.constraint(equalTo: glamCard.trailingAnchor, constant: -15),
            glamAttentionControl.centerYAnchor.constraint(equalTo: glamMuseControl.centerYAnchor),
            glamAttentionControl.widthAnchor.constraint(equalToConstant: 92),
            glamAttentionControl.heightAnchor.constraint(equalToConstant: 33),
            glamMuseName.trailingAnchor.constraint(lessThanOrEqualTo: glamAttentionControl.leadingAnchor, constant: -10),

            glamCaption.topAnchor.constraint(equalTo: glamMuseControl.bottomAnchor, constant: 16),
            glamCaption.leadingAnchor.constraint(equalTo: glamCard.leadingAnchor, constant: 15),
            glamCaption.trailingAnchor.constraint(equalTo: glamCard.trailingAnchor, constant: -15),

            glamImageStrip.topAnchor.constraint(equalTo: glamCaption.bottomAnchor, constant: 14),
            glamImageStrip.leadingAnchor.constraint(equalTo: glamCaption.leadingAnchor),
            glamImageStrip.trailingAnchor.constraint(equalTo: glamCaption.trailingAnchor),
            glamImageStrip.heightAnchor.constraint(equalTo: glamImageStrip.widthAnchor, multiplier: 0.48),

            glamReportControl.topAnchor.constraint(equalTo: glamImageStrip.bottomAnchor, constant: 8),
            glamReportControl.leadingAnchor.constraint(equalTo: glamCaption.leadingAnchor),
            glamReportControl.widthAnchor.constraint(equalToConstant: 38),
            glamReportControl.heightAnchor.constraint(equalToConstant: 38),
            glamReportControl.bottomAnchor.constraint(equalTo: glamCard.bottomAnchor, constant: -10),

            glamCommentControl.centerYAnchor.constraint(equalTo: glamReportControl.centerYAnchor),
            glamCommentControl.trailingAnchor.constraint(equalTo: glamPraiseControl.leadingAnchor, constant: -34),
            glamPraiseControl.centerYAnchor.constraint(equalTo: glamReportControl.centerYAnchor),
            glamPraiseControl.trailingAnchor.constraint(equalTo: glamCaption.trailingAnchor)
        ])
    }

    private func glamRenderAttention(_ glamIsAttended: Bool) {
        let glamColor = glamIsAttended
            ? UIColor.white.withAlphaComponent(0.46)
            : UIColor(red: 0.96, green: 0.63, blue: 0.92, alpha: 1)
        glamAttentionControl.setTitle(glamIsAttended ? MuzoiGlamVeil("Fmoilcl5oWwtivnugK") : MuzoiGlamVeil("+M tFhoSlClWoEwF"), for: .normal)
        glamAttentionControl.setTitleColor(glamColor, for: .normal)
        glamAttentionControl.layer.borderColor = glamColor.cgColor
    }

    private func glamRenderPraise(_ glamIsPraised: Bool, glamCount: Int) {
        let glamSymbol = glamIsPraised ? MuzoiGlamVeil("hLawnNdk.2t6hJu5mLbCsmu4pY.HfJiFldlm") : MuzoiGlamVeil("hBa8n3d8.gt1hXusmBbFsOuZp2")
        glamPraiseControl.setImage(UIImage(systemName: glamSymbol), for: .normal)
        glamPraiseControl.tintColor = glamIsPraised
            ? UIColor(red: 1, green: 0.22, blue: 0.38, alpha: 1)
            : UIColor.white.withAlphaComponent(0.38)
        glamPraiseControl.setTitle(MuzoiGlamVeil(" A K") + "\(glamCount)", for: .normal)
    }

    private func glamRelativeText(_ glamMilliseconds: TimeInterval) -> String {
        guard glamMilliseconds > 0 else { return MuzoiGlamVeil("R4eIcVeNnjtsl2yK") }
        let glamDate = Date(timeIntervalSince1970: glamMilliseconds / 1_000)
        let glamFormatter = RelativeDateTimeFormatter()
        glamFormatter.unitsStyle = .short
        return glamFormatter.localizedString(for: glamDate, relativeTo: Date())
    }

    private func glamLoadImage(_ glamAddress: String?, glamSlot: Int) {
        guard let glamAddress, let glamURL = URL(string: glamAddress) else { return }
        if let glamCachedImage = Self.glamPortraitCache.object(forKey: glamAddress as NSString) {
            glamAssignImage(glamCachedImage, glamSlot: glamSlot)
            return
        }

        let glamTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedImage = UIImage(data: glamData) else { return }
            Self.glamPortraitCache.setObject(glamFetchedImage, forKey: glamAddress as NSString)
            DispatchQueue.main.async {
                guard
                    let self,
                    self.glamExpectedAddresses.indices.contains(glamSlot),
                    self.glamExpectedAddresses[glamSlot] == glamAddress
                else { return }
                self.glamAssignImage(glamFetchedImage, glamSlot: glamSlot)
            }
        }
        glamImageTasks.append(glamTask)
        glamTask.resume()
    }

    private func glamAssignImage(_ glamImage: UIImage, glamSlot: Int) {
        switch glamSlot {
        case 0: glamMuseControl.setImage(glamImage, for: .normal)
        case 1: glamPrimaryImage.image = glamImage
        case 2: glamSecondaryImage.image = glamImage
        default: break
        }
    }

    override func gestureRecognizer(_ glamGesture: UIGestureRecognizer, shouldReceive glamTouch: UITouch) -> Bool {
        var glamTouchedView: UIView? = glamTouch.view
        while let glamView = glamTouchedView, glamView !== glamCard {
            if glamView is UIControl { return false }
            glamTouchedView = glamView.superview
        }
        return true
    }

    @objc private func glamOpenDetails() { glamDetailAction?() }
    @objc private func glamOpenMuse() { glamMuseAction?() }
    @objc private func glamOpenAttentionDetails() { glamAttentionAction?() }
    @objc private func glamTogglePraise() { glamPraiseAction?() }
    @objc private func glamOpenReport() { glamReportAction?() }
}

final class MuzoiGlamCanvasStreamController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let glamRepository = MuzoiGlamCanvasStreamRepository()
    private let glamBackdropGradient = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamCameraControl = UIButton(type: .custom)
    private let glamStream = UITableView(frame: .zero, style: .plain)
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamMoments: [MuzoiGlamCanvasMoment] = []
    private var glamPraisePending: Set<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        glamStageCommunityRunway()
        glamLoadMoments()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamBackdropGradient.frame = view.bounds
    }

    private func glamStageCommunityRunway() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamBackdropGradient.colors = [
            UIColor(red: 0.60, green: 0, blue: 0.47, alpha: 1).cgColor,
            UIColor(red: 0.08, green: 0.05, blue: 0.12, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamBackdropGradient.startPoint = CGPoint(x: 0, y: 0)
        glamBackdropGradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(glamBackdropGradient, at: 0)

        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.text = MuzoiGlamVeil("Cso5momwu7nQiitRyj")
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 31, weight: .heavy)
        view.addSubview(glamTitle)

        glamCameraControl.translatesAutoresizingMaskIntoConstraints = false
        glamCameraControl.backgroundColor = UIColor(red: 0.94, green: 0.63, blue: 0.91, alpha: 1)
        glamCameraControl.tintColor = UIColor(red: 20 / 255, green: 17 / 255, blue: 28 / 255, alpha: 1)
        glamCameraControl.layer.cornerRadius = 18
        let glamCameraConfig = UIImage.SymbolConfiguration(pointSize: 21, weight: .bold)
        glamCameraControl.setImage(UIImage(systemName: "camera", withConfiguration: glamCameraConfig), for: .normal)
        glamCameraControl.accessibilityLabel = MuzoiGlamVeil("Pkujbol3iRsMhm 6aW pnzeIwf DiQmSa6gDee jp8oisUtH")
        glamCameraControl.addTarget(self, action: #selector(glamOpenPublisher), for: .touchUpInside)
        view.addSubview(glamCameraControl)

        glamStream.translatesAutoresizingMaskIntoConstraints = false
        glamStream.backgroundColor = .clear
        glamStream.separatorStyle = .none
        glamStream.showsVerticalScrollIndicator = false
        glamStream.estimatedRowHeight = 350
        glamStream.rowHeight = UITableView.automaticDimension
        glamStream.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 14, right: 0)
        glamStream.dataSource = self
        glamStream.delegate = self
        glamStream.register(MuzoiGlamCanvasMomentCell.self, forCellReuseIdentifier: MuzoiGlamCanvasMomentCell.glamReuseKey)
        view.addSubview(glamStream)

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white
        view.addSubview(glamSpinner)

        NSLayoutConstraint.activate([
            glamTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            glamTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            glamCameraControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            glamCameraControl.centerYAnchor.constraint(equalTo: glamTitle.centerYAnchor),
            glamCameraControl.widthAnchor.constraint(equalToConstant: 70),
            glamCameraControl.heightAnchor.constraint(equalToConstant: 36),

            glamStream.topAnchor.constraint(equalTo: glamTitle.bottomAnchor, constant: 20),
            glamStream.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamStream.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamStream.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            glamSpinner.centerXAnchor.constraint(equalTo: glamStream.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamStream.centerYAnchor)
        ])
    }

    private func glamLoadMoments() {
        glamSpinner.startAnimating()
        glamRepository.glamFetchCanvasMoments { [weak self] glamMoments in
            guard let self else { return }
            self.glamMoments = glamMoments
            self.glamStream.reloadData()
            self.glamSpinner.stopAnimating()
        }
    }

    func tableView(_ glamTable: UITableView, numberOfRowsInSection glamSection: Int) -> Int {
        glamMoments.count
    }

    func tableView(
        _ glamTable: UITableView,
        cellForRowAt glamIndexPath: IndexPath
    ) -> UITableViewCell {
        let glamCell = glamTable.dequeueReusableCell(
            withIdentifier: MuzoiGlamCanvasMomentCell.glamReuseKey,
            for: glamIndexPath
        ) as! MuzoiGlamCanvasMomentCell
        let glamMoment = glamMoments[glamIndexPath.row]
        glamCell.glamPresent(glamMoment)
        glamCell.glamDetailAction = { [weak self] in
            self?.glamOpenPortal(.glamMomentCanvas, glamQuery: glamMoment.glamIdentity)
        }
        glamCell.glamMuseAction = { [weak self] in
            self?.glamOpenPortal(.glamMuseCanvas, glamQuery: glamMoment.glamMuseIdentity)
        }
        glamCell.glamReportAction = { [weak self] in
            self?.glamOpenPortal(.glamFlagCanvas, glamQuery: "")
        }
        glamCell.glamAttentionAction = { [weak self] in
            self?.glamOpenPortal(.glamMomentCanvas, glamQuery: glamMoment.glamIdentity)
        }
        glamCell.glamPraiseAction = { [weak self] in
            self?.glamTogglePraise(at: glamIndexPath)
        }
        return glamCell
    }

    private func glamTogglePraise(at glamIndexPath: IndexPath) {
        guard glamMoments.indices.contains(glamIndexPath.row) else { return }
        let glamOriginalMoment = glamMoments[glamIndexPath.row]
        guard glamPraisePending.insert(glamOriginalMoment.glamIdentity).inserted else { return }
        let glamWillPraise = !glamOriginalMoment.glamIsPraised
        glamMoments[glamIndexPath.row].glamIsPraised = glamWillPraise
        glamMoments[glamIndexPath.row].glamPraiseCount = max(
            0,
            glamOriginalMoment.glamPraiseCount + (glamWillPraise ? 1 : -1)
        )
        glamStream.reloadRows(at: [glamIndexPath], with: .none)

        glamRepository.glamTogglePraise(glamIdentity: glamOriginalMoment.glamIdentity) { [weak self] glamAccepted in
            guard let self else { return }
            self.glamPraisePending.remove(glamOriginalMoment.glamIdentity)
            guard !glamAccepted, self.glamMoments.indices.contains(glamIndexPath.row) else { return }
            self.glamMoments[glamIndexPath.row].glamIsPraised = glamOriginalMoment.glamIsPraised
            self.glamMoments[glamIndexPath.row].glamPraiseCount = glamOriginalMoment.glamPraiseCount
            self.glamStream.reloadRows(at: [glamIndexPath], with: .none)
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }

    private func glamOpenPortal(_ glamRoute: MuzoiGlamScenePassage, glamQuery: String) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamAddress = glamRoute.glamTraceAddress(glamTrailMark: glamQuery)
        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamAddress),
            animated: true
        )
    }

    @objc private func glamOpenPublisher() {
        glamOpenPortal(.glamComposeMoment, glamQuery: "")
    }
}
