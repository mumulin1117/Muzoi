import UIKit

struct MuzoiGlamCanvasGlimpse {
    let glamSignature: String
    let glamMuseSignature: String
    let glamMuseName: String
    let glamMusePortraitTrail: String?
    let glamLine: String
    let glamCreatedAt: TimeInterval
    let glamImageTrails: [String]
    let glamFallbackRunes: [String]
    let glamEchoCount: Int
    var glamPraiseCount: Int
    var glamIsAttended: Bool
    var glamIsPraised: Bool
}

final class MuzoiGlamCanvasFlowRepository {
    private let glampowderBrushEndpoint = MuzoiGlamVeil("/oq5pSszvUdRf3rjsnzP/Vv3swwRqZsmag")
    private let glamPraiseEndpoint = MuzoiGlamVeil("/4nVl3byzhv8zV/td6o1iDdyp4q8kbu4")

    func glamFetchCanvasGlimpses(glamReturn: @escaping ([MuzoiGlamCanvasGlimpse]) -> Void) {
        let glamCanvasEnvelope: [String: Any] = [
            MuzoiGlamVeil("eCdiiAtpoLrqi4aIlVG8luoNwS"): MuzoiGlamVeil("913z2z189h7T144G"),
            MuzoiGlamVeil("b1ltennYdEihnagGSAyomZpzhzoFnTyd"): 10,
            MuzoiGlamVeil("p4ipgjmDeCnZtJBclJi8shsC"): 2,
            MuzoiGlamVeil("mtaEk0ejunpRSotoocrUy8tHe6lJlSiPnygI"): 1,
            MuzoiGlamVeil("nReLogn9ELyLeFsFhMardjojws"): 1
        ]

        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glampowderBrushEndpoint,
            glamPigmentParcel: glamCanvasEnvelope,
            glamArrival: { [weak self] glamObject in
                guard let self else { return }
                let glamGlimpses = self.glamDecodeCanvasGlimpses(glamObject)
                glamReturn(glamGlimpses.isEmpty ? self.glamCuratedGlimmers() : glamGlimpses)
            },
            glamDetour: { [weak self] _ in
                guard let self else { return }
                glamReturn(self.glamCuratedGlimmers())
            }
        )
    }

    func glamTogglePraise(
        glamSignature: String,
        glamCompletion: @escaping (Bool) -> Void
    ) {
        glamTransmitMutation(
            glamTrail: glamPraiseEndpoint,
            glamPigmentParcel: [MuzoiGlamVeil("gDlwint8tPeMrLSkt1oDr6mPLBoHofkIsO"): glamSignature],
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

    private func glamDecodeCanvasGlimpses(_ glamObject: Any?) -> [MuzoiGlamCanvasGlimpse] {
        guard
            let glamPigmentParcel = glamObject as? [String: Any],
            (glamPigmentParcel[MuzoiGlamVeil("cxoRd6eM")] as? NSNumber)?.intValue == 200000,
            let glamRows = glamPigmentParcel[MuzoiGlamVeil("dnaithaB")] as? [[String: Any]]
        else { return [] }

        let glamFallbackRunes = ["MuzoiGlamEssence01", "MuzoiGlamEssence02", "MuzoiGlamEssence03"]
        return glamRows.enumerated().compactMap {
            glamShapeGlimpse($0.element, glamOffset: $0.offset, glamFallbackRunes: glamFallbackRunes)
        }
    }

    private func glamShapeGlimpse(
        _ glamRow: [String: Any],
        glamOffset: Int,
        glamFallbackRunes: [String]
    ) -> MuzoiGlamCanvasGlimpse? {
        guard glamPhraseValue(glamRow[MuzoiGlamVeil("cyryexahtUiSvKiTtayoG9llotwYuMpg")]) == nil else { return nil }
        guard let glamSignature = glamPhraseValue(glamRow[MuzoiGlamVeil("sghZiRmZmoekrRDneOtIa0iBlCsc")]) else { return nil }
        let glamTrails = glamGlimpseImages(from: glamRow)
        guard !glamTrails.isEmpty else { return nil }

        return MuzoiGlamCanvasGlimpse(
            glamSignature: glamSignature,
            glamMuseSignature: glamPhraseValue(glamRow[MuzoiGlamVeil("sFf9x9PaiBgqmGeLnItpo3lYoIg6y8")]) ?? "",
            glamMuseName: glamPhraseValue(glamRow[MuzoiGlamVeil("ehx1pprne6sgsGiPolnHHxiMgohBlmieg1hTtk")]) ?? MuzoiGlamVeil("MLurzlodip aMdu4s7e4"),
            glamMusePortraitTrail: glamPhraseValue(glamRow[MuzoiGlamVeil("sFkDiVndTOoHnwevSAteyWlWiknQgX")]),
            glamLine: glamPhraseValue(glamRow[MuzoiGlamVeil("bxeRawu1tXyoSUtHaNtcePmve6nutI")]) ?? MuzoiGlamVeil("Ai HfnrLeds6hg Xm9aQkieFuwpA wcVa2nZvOaNsn OjquPswtr aaNr6rGiRvxeedW.h"),
            glamCreatedAt: (glamRow[MuzoiGlamVeil("lga4sthzeXsiVdoLlwuSmLecAWrgtR")] as? NSNumber)?.doubleValue ?? 0,
            glamImageTrails: Array(glamTrails.prefix(2)),
            glamFallbackRunes: glamFallbackPair(glamOffset: glamOffset, glamFallbackRunes: glamFallbackRunes),
            glamEchoCount: (glamRow[MuzoiGlamVeil("miankieeuMp2P5avlDegtRtGe5POlFaqys")] as? NSNumber)?.intValue ?? 0,
            glamPraiseCount: (glamRow[MuzoiGlamVeil("c4o8lfoDrETDhie4oHrDyGBmeta6ultpyW")] as? NSNumber)?.intValue ?? 0,
            glamIsAttended: (glamRow[MuzoiGlamVeil("l1ipqGumiDdRPaizgxm7eGnStGF3lLoVwW")] as? NSNumber)?.intValue == 1,
            glamIsPraised: (glamRow[MuzoiGlamVeil("aeiurGbyrFuesWhIBzeLasuDtVyqwnacvhez")] as? NSNumber)?.intValue == 1
        )
    }

    private func glamGlimpseImages(from glamRow: [String: Any]) -> [String] {
        ((glamRow[MuzoiGlamVeil("sWtLyDlxesGRl6oMw5IknEsAivgbhKtS")] as? [String])
            ?? (glamRow[MuzoiGlamVeil("pTaqiinat4eOdePae6rDsLorneaO")] as? [String])
            ?? [])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }

    private func glamFallbackPair(glamOffset: Int, glamFallbackRunes: [String]) -> [String] {
        [
            glamFallbackRunes[glamOffset % glamFallbackRunes.count],
            glamFallbackRunes[(glamOffset + 1) % glamFallbackRunes.count]
        ]
    }

    private func glamPhraseValue(_ glamValue: Any?) -> String? {
        if let glamPhrase = glamValue as? String {
            let glamTrimmedPhrase = glamPhrase.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedPhrase.isEmpty { return glamTrimmedPhrase }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }

    private func glamCuratedGlimmers() -> [MuzoiGlamCanvasGlimpse] {
        [
            MuzoiGlamCanvasGlimpse(
                glamSignature: MuzoiGlamVeil("7J0q3x4h0u0s034T9k3m8i1B4m4t5Q"),
                glamMuseSignature: MuzoiGlamVeil("7d0i34309D5I9Z404b6r3G6Z4h8F8i"),
                glamMuseName: MuzoiGlamVeil("SgeRrXaO nLKufnLek"),
                glamMusePortraitTrail: nil,
                glamLine: MuzoiGlamVeil("Nhedwi jSaFKX6 llWo2oKks ojquNsttF xdZrqoopXpUePdP G—1 0ccoWmLeH JhZy9pqeC FiTtP Ju0pQ!s"),
                glamCreatedAt: Date().addingTimeInterval(-300).timeIntervalSince1970 * 1_000,
                glamImageTrails: [],
                glamFallbackRunes: ["MuzoiGlamEssence02", "MuzoiGlamEssence03"],
                glamEchoCount: 19,
                glamPraiseCount: 234,
                glamIsAttended: false,
                glamIsPraised: true
            ),
            MuzoiGlamCanvasGlimpse(
                glamSignature: MuzoiGlamVeil("7H0G3G4o030O0j4m9u3i2A8R1m9M7z"),
                glamMuseSignature: MuzoiGlamVeil("7U013X3q9D509n4M4T6C396H4v8B6f"),
                glamMuseName: MuzoiGlamVeil("Vzi9kqad SHJoPs2hT"),
                glamMusePortraitTrail: nil,
                glamLine: MuzoiGlamVeil("Az wbxiat9 ZohfX Ppha5iWnYt0,G Lan vwmhOojlOez VnOeOwk tree1aHlViDtqyO.v"),
                glamCreatedAt: Date().addingTimeInterval(-480).timeIntervalSince1970 * 1_000,
                glamImageTrails: [],
                glamFallbackRunes: ["MuzoiGlamEssence01", "MuzoiGlamEssence04"],
                glamEchoCount: 12,
                glamPraiseCount: 186,
                glamIsAttended: true,
                glamIsPraised: false
            )
        ]
    }
}

final class MuzoiGlamCanvasGlimpseCell: UITableViewCell {
    static let glamReuseKey = MuzoiGlamVeil("MSuMzKoSiaGSljaXmXCcaDnbvTaJsMMfo0mFeanht4CweFlclo")
    private static let glamPortraitCache = NSCache<NSString, UIImage>()

    var glampigmentVeilAction: (() -> Void)?
    var glamMuseAction: (() -> Void)?
    var glamAttentionAction: (() -> Void)?
    var glamPraiseAction: (() -> Void)?
    var glamConcernAction: (() -> Void)?

    private let glamTile = UIView()
    private let glamcontourBrushControl = UIButton(type: .custom)
    private let glamMuseName = UILabel()
    private let glamblushBrush = UILabel()
    private let glamchromaBloomControl = UIButton(type: .custom)
    private let glamLine = UILabel()
    private let glamImageStrip = UIStackView()
    private let glamPrimaryImage = UIImageView()
    private let glamSbrushFerrule = UIImageView()
    private let glamConcernControl = UIButton(type: .custom)
    private let glamEchoControl = UIButton(type: .custom)
    private let glamPraiseControl = UIButton(type: .custom)
    private var glamkabukiBrush: [URLSessionDataTask] = []
    private var glamExpectedAddresses: [String?] = [nil, nil, nil]

    override init(style glamStyle: UITableViewCell.CellStyle, reuseIdentifier glamReuseMark: String?) {
        super.init(style: glamStyle, reuseIdentifier: glamReuseMark)
        glamSculptShowpieceCell()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("iVn4iJts(rc5osd3eVrR:r)b LhGa7sO 7nLo4tF 1bSe7exnN hiIm2pBlJeImAeKndtke4dR"))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glamkabukiBrush.forEach { $0.cancel() }
        glamkabukiBrush.removeAll()
        glamExpectedAddresses = [nil, nil, nil]
        glampigmentVeilAction = nil
        glamMuseAction = nil
        glamAttentionAction = nil
        glamPraiseAction = nil
        glamConcernAction = nil
    }

    func glamPresent(_ glamGlimpse: MuzoiGlamCanvasGlimpse) {
        glamkabukiBrush.forEach { $0.cancel() }
        glamkabukiBrush.removeAll()

        glamcontourBrushControl.setImage(UIImage(named: "MuzoiGlamMuse01"), for: .normal)
        glamPrimaryImage.image = UIImage(named: glamGlimpse.glamFallbackRunes.first ?? "MuzoiGlamEssence01")
        glamSbrushFerrule.image = UIImage(named: glamGlimpse.glamFallbackRunes.dropFirst().first ?? "MuzoiGlamEssence02")
        glamMuseName.text = glamGlimpse.glamMuseName
        glamblushBrush.text = glamRelativePhrase(glamGlimpse.glamCreatedAt)
        glamLine.text = glamGlimpse.glamLine
        glamRenderAttention(glamGlimpse.glamIsAttended)
        glamRenderPraise(glamGlimpse.glamIsPraised, glamCount: glamGlimpse.glamPraiseCount)
        glamEchoControl.setTitle(MuzoiGlamVeil(" A K") + "\(glamGlimpse.glamEchoCount)", for: .normal)

        let glamPortraitTrail = glamGlimpse.glamMusePortraitTrail
        let glamPrimaryAddress = glamGlimpse.glamImageTrails.first
        let glamSecondaryAddress = glamGlimpse.glamImageTrails.dropFirst().first
        glamExpectedAddresses = [glamPortraitTrail, glamPrimaryAddress, glamSecondaryAddress]
        glamhueMuseImage(glamPortraitTrail, hueMuseSlot: 0)
        glamhueMuseImage(glamPrimaryAddress, hueMuseSlot: 1)
        glamhueMuseImage(glamSecondaryAddress, hueMuseSlot: 2)
        glamSbrushFerrule.isHidden = glamSecondaryAddress == nil && glamGlimpse.glamFallbackRunes.count < 2
    }

    private func glamSculptShowpieceCell() {
        glamPrepareGlimpseTile()
        glamPrepareGlimpseMuse()
        glamPrepareGlimpseLine()
        glamPrepareGlimpseImages()
        glamPrepareGlimpseActions()
        glamAddGlimpsePieces()
        glamPinGlimpseTile()
    }

    private func glamPrepareGlimpseTile() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        glamTile.translatesAutoresizingMaskIntoConstraints = false
        glamTile.backgroundColor = UIColor(red: 20 / 255, green: 23 / 255, blue: 34 / 255, alpha: 1)
        glamTile.layer.cornerRadius = 17
        glamTile.clipsToBounds = true
        contentView.addSubview(glamTile)
        let glamTileTap = UITapGestureRecognizer(target: self, action: #selector(glamOpenDetails))
        glamTileTap.delegate = self
        glamTile.addGestureRecognizer(glamTileTap)
    }

    private func glamPrepareGlimpseMuse() {
        glamcontourBrushControl.translatesAutoresizingMaskIntoConstraints = false
        glamcontourBrushControl.imageView?.contentMode = .scaleAspectFill
        glamcontourBrushControl.clipsToBounds = true
        glamcontourBrushControl.layer.cornerRadius = 25
        glamcontourBrushControl.addTarget(self, action: #selector(glamOpenMuse), for: .touchUpInside)

        glamMuseName.translatesAutoresizingMaskIntoConstraints = false
        glamMuseName.textColor = .white
        glamMuseName.font = .systemFont(ofSize: 18, weight: .bold)
        glamblushBrush.translatesAutoresizingMaskIntoConstraints = false
        glamblushBrush.textColor = UIColor.white.withAlphaComponent(0.48)
        glamblushBrush.font = .systemFont(ofSize: 14, weight: .regular)

        glamchromaBloomControl.translatesAutoresizingMaskIntoConstraints = false
        glamchromaBloomControl.layer.cornerRadius = 16
        glamchromaBloomControl.layer.borderWidth = 1.5
        glamchromaBloomControl.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        glamchromaBloomControl.addTarget(self, action: #selector(glamOpenAttentionDetails), for: .touchUpInside)
    }

    private func glamPrepareGlimpseLine() {
        glamLine.translatesAutoresizingMaskIntoConstraints = false
        glamLine.textColor = .white
        glamLine.font = .systemFont(ofSize: 17, weight: .regular)
        glamLine.numberOfLines = 0
    }

    private func glamPrepareGlimpseImages() {
        [glamPrimaryImage, glamSbrushFerrule].forEach {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
        glamImageStrip.translatesAutoresizingMaskIntoConstraints = false
        glamImageStrip.axis = .horizontal
        glamImageStrip.spacing = 8
        glamImageStrip.distribution = .fillEqually
        glamImageStrip.addArrangedSubview(glamPrimaryImage)
        glamImageStrip.addArrangedSubview(glamSbrushFerrule)
    }

    private func glamPrepareGlimpseActions() {
        glamConcernControl.translatesAutoresizingMaskIntoConstraints = false
        glamConcernControl.setImage(UIImage(systemName: "info.circle"), for: .normal)
        glamConcernControl.tintColor = UIColor.white.withAlphaComponent(0.36)
        glamConcernControl.accessibilityLabel = MuzoiGlamVeil("RZeApCoAr6tK")
        glamConcernControl.addTarget(self, action: #selector(glamOpenConcern), for: .touchUpInside)

        glamEchoControl.translatesAutoresizingMaskIntoConstraints = false
        glamEchoControl.setImage(UIImage(systemName: "ellipsis.bubble"), for: .normal)
        glamEchoControl.tintColor = UIColor(red: 0.23, green: 0.42, blue: 1, alpha: 1)
        glamEchoControl.setTitleColor(.white, for: .normal)
        glamEchoControl.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        glamEchoControl.addTarget(self, action: #selector(glamOpenDetails), for: .touchUpInside)

        glamPraiseControl.translatesAutoresizingMaskIntoConstraints = false
        glamPraiseControl.setTitleColor(.white, for: .normal)
        glamPraiseControl.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        glamPraiseControl.addTarget(self, action: #selector(glamTogglePraise), for: .touchUpInside)
    }

    private func glamAddGlimpsePieces() {
        [
            glamcontourBrushControl, glamMuseName, glamblushBrush, glamchromaBloomControl,
            glamLine, glamImageStrip, glamConcernControl, glamEchoControl, glamPraiseControl
        ].forEach { glamTile.addSubview($0) }
    }

    private func glamPinGlimpseTile() {
        NSLayoutConstraint.activate(glamGlimpseShellConstraints())
        NSLayoutConstraint.activate(glamGlimpseMuseConstraints())
        NSLayoutConstraint.activate(glamGlimpseBodyConstraints())
    }

    private func glamGlimpseShellConstraints() -> [NSLayoutConstraint] {
        [
            glamTile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            glamTile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            glamTile.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            glamTile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ]
    }

    private func glamGlimpseMuseConstraints() -> [NSLayoutConstraint] {
        [
            glamcontourBrushControl.topAnchor.constraint(equalTo: glamTile.topAnchor, constant: 16),
            glamcontourBrushControl.leadingAnchor.constraint(equalTo: glamTile.leadingAnchor, constant: 15),
            glamcontourBrushControl.widthAnchor.constraint(equalToConstant: 50),
            glamcontourBrushControl.heightAnchor.constraint(equalTo: glamcontourBrushControl.widthAnchor),
            glamMuseName.leadingAnchor.constraint(equalTo: glamcontourBrushControl.trailingAnchor, constant: 12),
            glamMuseName.topAnchor.constraint(equalTo: glamcontourBrushControl.topAnchor, constant: 4),
            glamblushBrush.leadingAnchor.constraint(equalTo: glamMuseName.leadingAnchor),
            glamblushBrush.topAnchor.constraint(equalTo: glamMuseName.bottomAnchor, constant: 3),

            glamchromaBloomControl.trailingAnchor.constraint(equalTo: glamTile.trailingAnchor, constant: -15),
            glamchromaBloomControl.centerYAnchor.constraint(equalTo: glamcontourBrushControl.centerYAnchor),
            glamchromaBloomControl.widthAnchor.constraint(equalToConstant: 92),
            glamchromaBloomControl.heightAnchor.constraint(equalToConstant: 33),
            glamMuseName.trailingAnchor.constraint(lessThanOrEqualTo: glamchromaBloomControl.leadingAnchor, constant: -10)
        ]
    }

    private func glamGlimpseBodyConstraints() -> [NSLayoutConstraint] {
        [
            glamLine.topAnchor.constraint(equalTo: glamcontourBrushControl.bottomAnchor, constant: 16),
            glamLine.leadingAnchor.constraint(equalTo: glamTile.leadingAnchor, constant: 15),
            glamLine.trailingAnchor.constraint(equalTo: glamTile.trailingAnchor, constant: -15),
            glamImageStrip.topAnchor.constraint(equalTo: glamLine.bottomAnchor, constant: 14),
            glamImageStrip.leadingAnchor.constraint(equalTo: glamLine.leadingAnchor),
            glamImageStrip.trailingAnchor.constraint(equalTo: glamLine.trailingAnchor),
            glamImageStrip.heightAnchor.constraint(equalTo: glamImageStrip.widthAnchor, multiplier: 0.48),
            glamConcernControl.topAnchor.constraint(equalTo: glamImageStrip.bottomAnchor, constant: 8),
            glamConcernControl.leadingAnchor.constraint(equalTo: glamLine.leadingAnchor),
            glamConcernControl.widthAnchor.constraint(equalToConstant: 38),
            glamConcernControl.heightAnchor.constraint(equalToConstant: 38),
            glamConcernControl.bottomAnchor.constraint(equalTo: glamTile.bottomAnchor, constant: -10),
            glamEchoControl.centerYAnchor.constraint(equalTo: glamConcernControl.centerYAnchor),
            glamEchoControl.trailingAnchor.constraint(equalTo: glamPraiseControl.leadingAnchor, constant: -34),
            glamPraiseControl.centerYAnchor.constraint(equalTo: glamConcernControl.centerYAnchor),
            glamPraiseControl.trailingAnchor.constraint(equalTo: glamLine.trailingAnchor)
        ]
    }

    private func glamRenderAttention(_ glamIsAttended: Bool) {
        let glamColor = glamIsAttended
            ? UIColor.white.withAlphaComponent(0.46)
            : UIColor(red: 0.96, green: 0.63, blue: 0.92, alpha: 1)
        glamchromaBloomControl.setTitle(glamIsAttended ? MuzoiGlamVeil("Fmoilcl5oWwtivnugK") : MuzoiGlamVeil("+M tFhoSlClWoEwF"), for: .normal)
        glamchromaBloomControl.setTitleColor(glamColor, for: .normal)
        glamchromaBloomControl.layer.borderColor = glamColor.cgColor
    }

    private func glamRenderPraise(_ glamIsPraised: Bool, glamCount: Int) {
        let glamSymbol = glamIsPraised ? MuzoiGlamVeil("hLawnNdk.2t6hJu5mLbCsmu4pY.HfJiFldlm") : MuzoiGlamVeil("hBa8n3d8.gt1hXusmBbFsOuZp2")
        glamPraiseControl.setImage(UIImage(systemName: glamSymbol), for: .normal)
        glamPraiseControl.tintColor = glamIsPraised
            ? UIColor(red: 1, green: 0.22, blue: 0.38, alpha: 1)
            : UIColor.white.withAlphaComponent(0.38)
        glamPraiseControl.setTitle(MuzoiGlamVeil(" A K") + "\(glamCount)", for: .normal)
    }

    private func glamRelativePhrase(_ glamMilliseconds: TimeInterval) -> String {
        guard glamMilliseconds > 0 else { return MuzoiGlamVeil("R4eIcVeNnjtsl2yK") }
        let glamDate = Date(timeIntervalSince1970: glamMilliseconds / 1_000)
        let glamFormatter = RelativeDateTimeFormatter()
        glamFormatter.unitsStyle = .short
        return glamFormatter.localizedString(for: glamDate, relativeTo: Date())
    }

    private func glamhueMuseImage(_ glamTrail: String?, hueMuseSlot: Int) {
        guard let glamTrail, let undertoneDrift = URL(string: glamTrail) else { return }
        if let glamCachedImage = Self.glamPortraitCache.object(forKey: glamTrail as NSString) {
            glamAssignImage(glamCachedImage, glamSlot: hueMuseSlot)
            return
        }

        let glamTask = URLSession.shared.dataTask(with: undertoneDrift) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedImage = UIImage(data: glamData) else { return }
            Self.glamPortraitCache.setObject(glamFetchedImage, forKey: glamTrail as NSString)
            DispatchQueue.main.async {
                guard
                    let self,
                    self.glamExpectedAddresses.indices.contains(hueMuseSlot),
                    self.glamExpectedAddresses[hueMuseSlot] == glamTrail
                else { return }
                self.glamAssignImage(glamFetchedImage, glamSlot: hueMuseSlot)
            }
        }
        glamkabukiBrush.append(glamTask)
        glamTask.resume()
    }

    private func glamAssignImage(_ glamImage: UIImage, glamSlot: Int) {
        switch glamSlot {
        case 0: glamcontourBrushControl.setImage(glamImage, for: .normal)
        case 1: glamPrimaryImage.image = glamImage
        case 2: glamSbrushFerrule.image = glamImage
        default: break
        }
    }

    override func gestureRecognizer(_ glamGesture: UIGestureRecognizer, shouldReceive glamTouch: UITouch) -> Bool {
        var glamTouchedView: UIView? = glamTouch.view
        while let glamView = glamTouchedView, glamView !== glamTile {
            if glamView is UIControl { return false }
            glamTouchedView = glamView.superview
        }
        return true
    }

    @objc private func glamOpenDetails() { glampigmentVeilAction?() }
    @objc private func glamOpenMuse() { glamMuseAction?() }
    @objc private func glamOpenAttentionDetails() { glamAttentionAction?() }
    @objc private func glamTogglePraise() { glamPraiseAction?() }
    @objc private func glamOpenConcern() { glamConcernAction?() }
}

final class MuzoiGleamDustController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let glaovertoneMist = MuzoiGlamCanvasFlowRepository()
    private let glamBackdropGradient = CAGradientLayer()
    private let gsaturationSilkTitle = UILabel()
    private let glamLensControl = UIButton(type: .custom)
    private let glamopacityAuraFlow = UITableView(frame: .zero, style: .plain)
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamGlimpses: [MuzoiGlamCanvasGlimpse] = []
    private var glamPraisePending: Set<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        glamArrangeGalleryRunway()
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

    private func glamArrangeGalleryRunway() {
        glamPaintGalleryBackdrop()
        glamPolishGalleryTitle()
        glamPolishGalleryPublisher()
        glamPolishGalleryFlow()
        glamPolishGalleryWheel()
        glamPinGalleryRunway()
    }

    private func glamPaintGalleryBackdrop() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamBackdropGradient.colors = [
            UIColor(red: 0.60, green: 0, blue: 0.47, alpha: 1).cgColor,
            UIColor(red: 0.08, green: 0.05, blue: 0.12, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamBackdropGradient.startPoint = CGPoint(x: 0, y: 0)
        glamBackdropGradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(glamBackdropGradient, at: 0)
    }

    private func glamPolishGalleryTitle() {
        gsaturationSilkTitle.translatesAutoresizingMaskIntoConstraints = false
        gsaturationSilkTitle.text = MuzoiGlamVeil("Cso5momwu7nQiitRyj")
        gsaturationSilkTitle.textColor = .white
        gsaturationSilkTitle.font = .systemFont(ofSize: 31, weight: .heavy)
        view.addSubview(gsaturationSilkTitle)
    }

    private func glamPolishGalleryPublisher() {
        glamLensControl.translatesAutoresizingMaskIntoConstraints = false
        glamLensControl.backgroundColor = UIColor(red: 0.94, green: 0.63, blue: 0.91, alpha: 1)
        glamLensControl.tintColor = UIColor(red: 20 / 255, green: 17 / 255, blue: 28 / 255, alpha: 1)
        glamLensControl.layer.cornerRadius = 18
        let glamLensConfig = UIImage.SymbolConfiguration(pointSize: 21, weight: .bold)
        glamLensControl.setImage(UIImage(systemName: "camera", withConfiguration: glamLensConfig), for: .normal)
        glamLensControl.accessibilityLabel = MuzoiGlamVeil("Pkujbol3iRsMhm 6aW pnzeIwf DiQmSa6gDee jp8oisUtH")
        glamLensControl.addTarget(self, action: #selector(glamOpenPublisher), for: .touchUpInside)
        view.addSubview(glamLensControl)
    }

    private func glamPolishGalleryFlow() {
        glamopacityAuraFlow.translatesAutoresizingMaskIntoConstraints = false
        glamopacityAuraFlow.backgroundColor = .clear
        glamopacityAuraFlow.separatorStyle = .none
        glamopacityAuraFlow.showsVerticalScrollIndicator = false
        glamopacityAuraFlow.estimatedRowHeight = 350
        glamopacityAuraFlow.rowHeight = UITableView.automaticDimension
        glamopacityAuraFlow.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 14, right: 0)
        glamopacityAuraFlow.dataSource = self
        glamopacityAuraFlow.delegate = self
        glamopacityAuraFlow.register(MuzoiGlamCanvasGlimpseCell.self, forCellReuseIdentifier: MuzoiGlamCanvasGlimpseCell.glamReuseKey)
        view.addSubview(glamopacityAuraFlow)
    }

    private func glamPolishGalleryWheel() {
        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white
        view.addSubview(glamSpinner)
    }

    private func glamPinGalleryRunway() {
        NSLayoutConstraint.activate([
            gsaturationSilkTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            gsaturationSilkTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            glamLensControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            glamLensControl.centerYAnchor.constraint(equalTo: gsaturationSilkTitle.centerYAnchor),
            glamLensControl.widthAnchor.constraint(equalToConstant: 70),
            glamLensControl.heightAnchor.constraint(equalToConstant: 36),

            glamopacityAuraFlow.topAnchor.constraint(equalTo: gsaturationSilkTitle.bottomAnchor, constant: 20),
            glamopacityAuraFlow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamopacityAuraFlow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamopacityAuraFlow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            glamSpinner.centerXAnchor.constraint(equalTo: glamopacityAuraFlow.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamopacityAuraFlow.centerYAnchor)
        ])
    }

    private func glamLoadMoments() {
        glamSpinner.startAnimating()
        glaovertoneMist.glamFetchCanvasGlimpses { [weak self] glamGlimpses in
            guard let self else { return }
            self.glamGlimpses = glamGlimpses
            self.glamopacityAuraFlow.reloadData()
            self.glamSpinner.stopAnimating()
        }
    }

    func tableView(_ glamTable: UITableView, numberOfRowsInSection glamSection: Int) -> Int {
        glamGlimpses.count
    }

    func tableView(
        _ glamTable: UITableView,
        cellForRowAt glamIndexPath: IndexPath
    ) -> UITableViewCell {
        let glamCell = glamTable.dequeueReusableCell(
            withIdentifier: MuzoiGlamCanvasGlimpseCell.glamReuseKey,
            for: glamIndexPath
        ) as! MuzoiGlamCanvasGlimpseCell
        let glamGlimpse = glamGlimpses[glamIndexPath.row]
        glamCell.glamPresent(glamGlimpse)
        glamCell.glampigmentVeilAction = { [weak self] in
            self?.glamOpenPortal(.glamMomentCanvas, glamQuery: glamGlimpse.glamSignature)
        }
        glamCell.glamMuseAction = { [weak self] in
            self?.glamOpenPortal(.glamMuseCanvas, glamQuery: glamGlimpse.glamMuseSignature)
        }
        glamCell.glamConcernAction = { [weak self] in
            self?.glamOpenPortal(.glamFlagCanvas, glamQuery: "")
        }
        glamCell.glamAttentionAction = { [weak self] in
            self?.glamOpenPortal(.glamMomentCanvas, glamQuery: glamGlimpse.glamSignature)
        }
        glamCell.glamPraiseAction = { [weak self] in
            self?.glamTogglePraise(at: glamIndexPath)
        }
        return glamCell
    }

    private func glamTogglePraise(at glamIndexPath: IndexPath) {
        guard glamGlimpses.indices.contains(glamIndexPath.row) else { return }
        let glamOriginalGlimpse = glamGlimpses[glamIndexPath.row]
        guard glamPraisePending.insert(glamOriginalGlimpse.glamSignature).inserted else { return }
        let glamWillPraise = !glamOriginalGlimpse.glamIsPraised
        glamGlimpses[glamIndexPath.row].glamIsPraised = glamWillPraise
        glamGlimpses[glamIndexPath.row].glamPraiseCount = max(
            0,
            glamOriginalGlimpse.glamPraiseCount + (glamWillPraise ? 1 : -1)
        )
        glamopacityAuraFlow.reloadRows(at: [glamIndexPath], with: .none)

        glaovertoneMist.glamTogglePraise(glamSignature: glamOriginalGlimpse.glamSignature) { [weak self] glamAccepted in
            guard let self else { return }
            self.glamPraisePending.remove(glamOriginalGlimpse.glamSignature)
            guard !glamAccepted, self.glamGlimpses.indices.contains(glamIndexPath.row) else { return }
            self.glamGlimpses[glamIndexPath.row].glamIsPraised = glamOriginalGlimpse.glamIsPraised
            self.glamGlimpses[glamIndexPath.row].glamPraiseCount = glamOriginalGlimpse.glamPraiseCount
            self.glamopacityAuraFlow.reloadRows(at: [glamIndexPath], with: .none)
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }

    private func glamOpenPortal(_ glamRoute: MuzoiGlamScenePassage, glamQuery: String) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamTrail = glamRoute.glamTraceAddress(glamTrailMark: glamQuery)
        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
            animated: true
        )
    }

    @objc private func glamOpenPublisher() {
        glamOpenPortal(.glamComposeMoment, glamQuery: "")
    }
}
