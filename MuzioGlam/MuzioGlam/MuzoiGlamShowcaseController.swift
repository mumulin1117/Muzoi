import UIKit

struct MuzoiGlamShowcaseMoment {
    let glamIdentity: String
    let glamMuseIdentity: String
    let glamMuseName: String
    let glamCaption: String
    let glamCoverAddress: String?
    let glamMusePortraitAddress: String?
    let glamFallbackAsset: String
    let glamPraiseCount: Int
}

final class MuzoiGlamShowcaseRepository {
    private let glamDynamicEndpoint = "/qpsvdfrsz/vswqsa"

    func glamFetchMoments(glamYield: @escaping ([MuzoiGlamShowcaseMoment]) -> Void) {
        let glamShowcaseEnvelope: [String: Any] = [
            "editorialGlow": "93219714",
            "blendingSymphony": 10,
            "pigmentBliss": 2,
            "makeupStorytelling": 1,
            "neonEyeshadow": 1
        ]

        MuzoiGlamSignalRelay.glamTransmit(
            glamEndpoint: glamDynamicEndpoint,
            glamEnvelope: glamShowcaseEnvelope,
            glamSuccess: { [weak self] glamObject in
                guard let self else { return }
                let glamMoments = self.glamDecodeMoments(glamObject)
                glamYield(glamMoments.isEmpty ? self.glamFallbackMoments() : glamMoments)
            },
            glamFailure: { [weak self] _ in
                guard let self else { return }
                glamYield(self.glamFallbackMoments())
            }
        )
    }

    private func glamDecodeMoments(_ glamObject: Any?) -> [MuzoiGlamShowcaseMoment] {
        guard
            let glamEnvelope = glamObject as? [String: Any],
            (glamEnvelope["code"] as? NSNumber)?.intValue == 200000,
            let glamRows = glamEnvelope["data"] as? [[String: Any]]
        else { return [] }

        let glamFallbackAssets = ["MuzoiGlamEssence01", "MuzoiGlamEssence02", "MuzoiGlamEssence03"]
        return glamRows.enumerated().compactMap { glamOffset, glamRow in
            guard
                let glamCoverAddress = glamTextValue(glamRow["creativityGlowup"]),
                let glamIdentity = glamTextValue(glamRow["shimmerDetails"])
            else { return nil }

            return MuzoiGlamShowcaseMoment(
                glamIdentity: glamIdentity,
                glamMuseIdentity: glamTextValue(glamRow["sfxPigmentology"]) ?? "",
                glamMuseName: glamTextValue(glamRow["expressionHighlight"]) ?? "Muzoi Muse",
                glamCaption: glamTextValue(glamRow["beautyStatement"]) ?? "A new creative look just landed.",
                glamCoverAddress: glamCoverAddress,
                glamMusePortraitAddress: glamRow["skinToneStyling"] as? String,
                glamFallbackAsset: glamFallbackAssets[glamOffset % glamFallbackAssets.count],
                glamPraiseCount: (glamRow["colorTheoryBeauty"] as? NSNumber)?.intValue ?? 0
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

    private func glamFallbackMoments() -> [MuzoiGlamShowcaseMoment] {
        [
            MuzoiGlamShowcaseMoment(
                glamIdentity: "703401207664709",
                glamMuseIdentity: "703395944636486",
                glamMuseName: "Vika Hosh",
                glamCaption: "Sometimes the look finds you before you find it.",
                glamCoverAddress: nil,
                glamMusePortraitAddress: nil,
                glamFallbackAsset: "MuzoiGlamEssence02",
                glamPraiseCount: 13
            ),
            MuzoiGlamShowcaseMoment(
                glamIdentity: "703401207648325",
                glamMuseIdentity: "703395944636485",
                glamMuseName: "Nari Rue",
                glamCaption: "Just finished my boldest look yet.",
                glamCoverAddress: nil,
                glamMusePortraitAddress: nil,
                glamFallbackAsset: "MuzoiGlamEssence01",
                glamPraiseCount: 21
            )
        ]
    }
}

final class MuzoiGlamShortcutControl: UIControl {
    private let glamGradient = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamGlyph = UIImageView()

    init(
        glamText: String,
        glamSymbol: String,
        glamColors: [UIColor]
    ) {
        super.init(frame: .zero)
        glamTitle.text = glamText
        glamGlyph.image = UIImage(systemName: glamSymbol)
        glamGradient.colors = glamColors.map(\.cgColor)
        glamBuildControl()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamGradient.frame = bounds
        layer.cornerRadius = 17
        glamGradient.cornerRadius = 17
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.16) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
                self.alpha = self.isHighlighted ? 0.82 : 1
            }
        }
    }

    private func glamBuildControl() {
        clipsToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.withAlphaComponent(0.22).cgColor
        glamGradient.startPoint = CGPoint(x: 0, y: 0.5)
        glamGradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(glamGradient, at: 0)

        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 16, weight: .black)
        glamTitle.numberOfLines = 2
        glamTitle.adjustsFontSizeToFitWidth = true
        glamTitle.minimumScaleFactor = 0.78

        glamGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamGlyph.contentMode = .scaleAspectFit
        glamGlyph.tintColor = UIColor.white.withAlphaComponent(0.92)
        glamGlyph.layer.shadowColor = UIColor.black.cgColor
        glamGlyph.layer.shadowOpacity = 0.28
        glamGlyph.layer.shadowRadius = 5

        addSubview(glamTitle)
        addSubview(glamGlyph)

        NSLayoutConstraint.activate([
            glamTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            glamTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamTitle.trailingAnchor.constraint(lessThanOrEqualTo: glamGlyph.leadingAnchor, constant: -6),
            glamGlyph.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            glamGlyph.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamGlyph.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            glamGlyph.heightAnchor.constraint(equalTo: glamGlyph.widthAnchor)
        ])
    }
}

final class MuzoiGlamShowcaseCell: UICollectionViewCell {
    static let glamReuseKey = "MuzoiGlamShowcaseCell"
    private static let glamCoverCache = NSCache<NSString, UIImage>()
    private static let glamMuseCache = NSCache<NSString, UIImage>()

    var glamDetailAction: (() -> Void)?
    var glamMuseAction: (() -> Void)?
    var glamReportAction: (() -> Void)?

    private let glamCover = UIImageView()
    private let glamShade = CAGradientLayer()
    private let glamPlayControl = UIButton(type: .custom)
    private let glamPraiseControl = UIButton(type: .custom)
    private let glamMusePortrait = UIImageView()
    private let glamMuseName = UILabel()
    private let glamCaption = UILabel()
    private let glamReportControl = UIButton(type: .custom)
    private var glamCoverTask: URLSessionDataTask?
    private var glamMuseTask: URLSessionDataTask?
    private var glamExpectedCoverAddress: String?
    private var glamExpectedMuseAddress: String?

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamBuildCell()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamShade.frame = bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        glamCoverTask?.cancel()
        glamMuseTask?.cancel()
        glamExpectedCoverAddress = nil
        glamExpectedMuseAddress = nil
        glamDetailAction = nil
        glamMuseAction = nil
        glamReportAction = nil
    }

    func glamPresent(_ glamMoment: MuzoiGlamShowcaseMoment) {
        glamCoverTask?.cancel()
        glamMuseTask?.cancel()
        glamCover.image = UIImage(named: glamMoment.glamFallbackAsset)
        glamMusePortrait.image = UIImage(named: "MuzoiGlamMuse01")
        glamMuseName.text = "@\(glamMoment.glamMuseName)"
        glamCaption.text = glamMoment.glamCaption
        glamPraiseControl.accessibilityLabel = "Open look details, \(glamMoment.glamPraiseCount) likes"
        glamExpectedCoverAddress = glamMoment.glamCoverAddress
        glamExpectedMuseAddress = glamMoment.glamMusePortraitAddress
        glamLoadPortrait(
            glamMoment.glamCoverAddress,
            glamCache: Self.glamCoverCache,
            glamIsMuse: false
        )
        glamLoadPortrait(
            glamMoment.glamMusePortraitAddress,
            glamCache: Self.glamMuseCache,
            glamIsMuse: true
        )
    }

    private func glamBuildCell() {
        contentView.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamCover.translatesAutoresizingMaskIntoConstraints = false
        glamCover.contentMode = .scaleAspectFill
        glamCover.clipsToBounds = true
        contentView.addSubview(glamCover)

        glamShade.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.82).cgColor]
        glamShade.startPoint = CGPoint(x: 0.5, y: 0.45)
        glamShade.endPoint = CGPoint(x: 0.5, y: 1)
        contentView.layer.addSublayer(glamShade)

        glamPlayControl.translatesAutoresizingMaskIntoConstraints = false
        glamPlayControl.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        glamPlayControl.layer.borderColor = UIColor.white.cgColor
        glamPlayControl.layer.borderWidth = 5
        glamPlayControl.layer.cornerRadius = 38
        glamPlayControl.tintColor = .white
        glamPlayControl.setImage(UIImage(systemName: "play.fill"), for: .normal)
        glamPlayControl.imageView?.contentMode = .scaleAspectFit
        glamPlayControl.accessibilityLabel = "Open look details"
        glamPlayControl.addTarget(self, action: #selector(glamOpenDetails), for: .touchUpInside)

        glamPraiseControl.translatesAutoresizingMaskIntoConstraints = false
        glamPraiseControl.backgroundColor = UIColor.black.withAlphaComponent(0.88)
        glamPraiseControl.layer.cornerRadius = 32
        glamPraiseControl.tintColor = UIColor(red: 1, green: 0.24, blue: 0.55, alpha: 1)
        let glamHeartConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        glamPraiseControl.setImage(UIImage(systemName: "heart", withConfiguration: glamHeartConfig), for: .normal)
        glamPraiseControl.addTarget(self, action: #selector(glamOpenDetails), for: .touchUpInside)

        glamMusePortrait.translatesAutoresizingMaskIntoConstraints = false
        glamMusePortrait.contentMode = .scaleAspectFill
        glamMusePortrait.clipsToBounds = true
        glamMusePortrait.layer.cornerRadius = 25
        glamMusePortrait.layer.borderWidth = 2
        glamMusePortrait.layer.borderColor = UIColor.white.cgColor
        glamMusePortrait.isUserInteractionEnabled = true
        glamMusePortrait.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(glamOpenMuse)))

        glamMuseName.translatesAutoresizingMaskIntoConstraints = false
        glamMuseName.textColor = .white
        glamMuseName.font = .systemFont(ofSize: 21, weight: .bold)
        glamMuseName.adjustsFontSizeToFitWidth = true
        glamMuseName.minimumScaleFactor = 0.72

        glamCaption.translatesAutoresizingMaskIntoConstraints = false
        glamCaption.textColor = .white
        glamCaption.font = .systemFont(ofSize: 17, weight: .regular)
        glamCaption.numberOfLines = 2
        glamCaption.lineBreakMode = .byTruncatingTail

        glamReportControl.translatesAutoresizingMaskIntoConstraints = false
        glamReportControl.setTitle("!", for: .normal)
        glamReportControl.setTitleColor(UIColor.black.withAlphaComponent(0.72), for: .normal)
        glamReportControl.titleLabel?.font = .systemFont(ofSize: 17, weight: .black)
        glamReportControl.backgroundColor = UIColor.white.withAlphaComponent(0.68)
        glamReportControl.layer.cornerRadius = 16
        glamReportControl.accessibilityLabel = "Report"
        glamReportControl.addTarget(self, action: #selector(glamOpenReport), for: .touchUpInside)

        [glamPlayControl, glamPraiseControl, glamMusePortrait, glamMuseName, glamCaption, glamReportControl].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            glamCover.topAnchor.constraint(equalTo: contentView.topAnchor),
            glamCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            glamCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            glamCover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            glamPlayControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            glamPlayControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -18),
            glamPlayControl.widthAnchor.constraint(equalToConstant: 76),
            glamPlayControl.heightAnchor.constraint(equalTo: glamPlayControl.widthAnchor),

            glamPraiseControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            glamPraiseControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -52),
            glamPraiseControl.widthAnchor.constraint(equalToConstant: 64),
            glamPraiseControl.heightAnchor.constraint(equalTo: glamPraiseControl.widthAnchor),

            glamMusePortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            glamMusePortrait.bottomAnchor.constraint(equalTo: glamCaption.topAnchor, constant: -11),
            glamMusePortrait.widthAnchor.constraint(equalToConstant: 50),
            glamMusePortrait.heightAnchor.constraint(equalTo: glamMusePortrait.widthAnchor),

            glamMuseName.leadingAnchor.constraint(equalTo: glamMusePortrait.trailingAnchor, constant: 12),
            glamMuseName.centerYAnchor.constraint(equalTo: glamMusePortrait.centerYAnchor),
            glamReportControl.leadingAnchor.constraint(equalTo: glamMuseName.trailingAnchor, constant: 10),
            glamReportControl.centerYAnchor.constraint(equalTo: glamMuseName.centerYAnchor),
            glamReportControl.widthAnchor.constraint(equalToConstant: 32),
            glamReportControl.heightAnchor.constraint(equalTo: glamReportControl.widthAnchor),
            glamReportControl.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -92),

            glamCaption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            glamCaption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            glamCaption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func glamLoadPortrait(
        _ glamAddress: String?,
        glamCache: NSCache<NSString, UIImage>,
        glamIsMuse: Bool
    ) {
        guard let glamAddress, let glamURL = URL(string: glamAddress) else { return }
        if let glamCachedImage = glamCache.object(forKey: glamAddress as NSString) {
            if glamIsMuse { glamMusePortrait.image = glamCachedImage } else { glamCover.image = glamCachedImage }
            return
        }

        let glamTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamFetchedImage = UIImage(data: glamData) else { return }
            glamCache.setObject(glamFetchedImage, forKey: glamAddress as NSString)
            DispatchQueue.main.async {
                guard let self else { return }
                if glamIsMuse {
                    guard self.glamExpectedMuseAddress == glamAddress else { return }
                    self.glamMusePortrait.image = glamFetchedImage
                } else {
                    guard self.glamExpectedCoverAddress == glamAddress else { return }
                    UIView.transition(
                        with: self.glamCover,
                        duration: 0.22,
                        options: .transitionCrossDissolve,
                        animations: { self.glamCover.image = glamFetchedImage }
                    )
                }
            }
        }
        if glamIsMuse { glamMuseTask = glamTask } else { glamCoverTask = glamTask }
        glamTask.resume()
    }

    @objc private func glamOpenDetails() {
        glamDetailAction?()
    }

    @objc private func glamOpenMuse() {
        glamMuseAction?()
    }

    @objc private func glamOpenReport() {
        glamReportAction?()
    }
}

final class MuzoiGlamShowcaseController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    private let glamRepository = MuzoiGlamShowcaseRepository()
    private let glamBackdrop = UIView()
    private let glamBackdropGradient = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamShortcutStack = UIStackView()
    private let glamMomentLayout = UICollectionViewFlowLayout()
    private lazy var glamMomentRail = UICollectionView(frame: .zero, collectionViewLayout: glamMomentLayout)
    private let glamPublishControl = UIButton(type: .custom)
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamMoments: [MuzoiGlamShowcaseMoment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildCanvas()
        glamFetchMoments()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamBackdropGradient.frame = glamBackdrop.bounds
        let glamItemSize = glamMomentRail.bounds.size
        if glamMomentLayout.itemSize != glamItemSize {
            glamMomentLayout.itemSize = glamItemSize
            glamMomentLayout.invalidateLayout()
        }
    }

    private func glamBuildCanvas() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamBackdrop.translatesAutoresizingMaskIntoConstraints = false
        glamBackdropGradient.colors = [
            UIColor(red: 0.56, green: 0, blue: 0.45, alpha: 1).cgColor,
            UIColor(red: 0.12, green: 0.06, blue: 0.16, alpha: 1).cgColor
        ]
        glamBackdropGradient.startPoint = CGPoint(x: 0, y: 0)
        glamBackdropGradient.endPoint = CGPoint(x: 1, y: 1)
        glamBackdrop.layer.addSublayer(glamBackdropGradient)
        view.addSubview(glamBackdrop)

        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.text = "Discover"
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 31, weight: .heavy)
        glamTitle.layer.shadowColor = UIColor.black.cgColor
        glamTitle.layer.shadowOpacity = 0.26
        glamTitle.layer.shadowRadius = 5
        view.addSubview(glamTitle)

        let glamTrickControl = MuzoiGlamShortcutControl(
            glamText: "TRICK &\nBLEND",
            glamSymbol: "paintbrush.pointed.fill",
            glamColors: [UIColor(red: 0.22, green: 0.07, blue: 0.14, alpha: 1), UIColor(red: 0.70, green: 0.31, blue: 0.12, alpha: 1)]
        )
        glamTrickControl.addTarget(self, action: #selector(glamOpenTrickArchive), for: .touchUpInside)
        glamTrickControl.accessibilityLabel = "Open aroma knowledge library"

        let glamExpertControl = MuzoiGlamShortcutControl(
            glamText: "TRYON\nAI",
            glamSymbol: "ellipsis.bubble.fill",
            glamColors: [UIColor(red: 0.18, green: 0.06, blue: 0.28, alpha: 1), UIColor(red: 0.68, green: 0.05, blue: 0.74, alpha: 1)]
        )
        glamExpertControl.addTarget(self, action: #selector(glamOpenSparkExpert), for: .touchUpInside)
        glamExpertControl.accessibilityLabel = "Open AI makeup expert"

        glamShortcutStack.translatesAutoresizingMaskIntoConstraints = false
        glamShortcutStack.axis = .horizontal
        glamShortcutStack.spacing = 10
        glamShortcutStack.distribution = .fillEqually
        glamShortcutStack.addArrangedSubview(glamTrickControl)
        glamShortcutStack.addArrangedSubview(glamExpertControl)
        view.addSubview(glamShortcutStack)

        glamMomentLayout.scrollDirection = .horizontal
        glamMomentLayout.minimumLineSpacing = 0
        glamMomentRail.translatesAutoresizingMaskIntoConstraints = false
        glamMomentRail.backgroundColor = .clear
        glamMomentRail.isPagingEnabled = true
        glamMomentRail.showsHorizontalScrollIndicator = false
        glamMomentRail.decelerationRate = .fast
        glamMomentRail.dataSource = self
        glamMomentRail.delegate = self
        glamMomentRail.register(MuzoiGlamShowcaseCell.self, forCellWithReuseIdentifier: MuzoiGlamShowcaseCell.glamReuseKey)
        view.addSubview(glamMomentRail)

        glamPublishControl.translatesAutoresizingMaskIntoConstraints = false
        glamPublishControl.backgroundColor = UIColor(red: 0.94, green: 0.45, blue: 0.86, alpha: 1)
        glamPublishControl.tintColor = UIColor(red: 20 / 255, green: 17 / 255, blue: 28 / 255, alpha: 1)
        glamPublishControl.layer.cornerRadius = 30
        glamPublishControl.layer.shadowColor = UIColor.black.cgColor
        glamPublishControl.layer.shadowOpacity = 0.30
        glamPublishControl.layer.shadowRadius = 12
        glamPublishControl.layer.shadowOffset = CGSize(width: 0, height: 6)
        let glamAddConfig = UIImage.SymbolConfiguration(pointSize: 29, weight: .black)
        glamPublishControl.setImage(UIImage(systemName: "plus", withConfiguration: glamAddConfig), for: .normal)
        glamPublishControl.accessibilityLabel = "Publish a new showcase"
        glamPublishControl.addTarget(self, action: #selector(glamOpenPublisher), for: .touchUpInside)
        view.addSubview(glamPublishControl)

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white
        view.addSubview(glamSpinner)

        NSLayoutConstraint.activate([
            glamBackdrop.topAnchor.constraint(equalTo: view.topAnchor),
            glamBackdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamBackdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamBackdrop.bottomAnchor.constraint(equalTo: glamMomentRail.topAnchor),

            glamTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            glamTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            glamShortcutStack.topAnchor.constraint(equalTo: glamTitle.bottomAnchor, constant: 24),
            glamShortcutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            glamShortcutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            glamShortcutStack.heightAnchor.constraint(equalToConstant: 80),

            glamMomentRail.topAnchor.constraint(equalTo: glamShortcutStack.bottomAnchor, constant: 24),
            glamMomentRail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamMomentRail.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamMomentRail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            glamPublishControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            glamPublishControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -132),
            glamPublishControl.widthAnchor.constraint(equalToConstant: 60),
            glamPublishControl.heightAnchor.constraint(equalTo: glamPublishControl.widthAnchor),

            glamSpinner.centerXAnchor.constraint(equalTo: glamMomentRail.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamMomentRail.centerYAnchor)
        ])
    }

    private func glamFetchMoments() {
        glamSpinner.startAnimating()
        glamRepository.glamFetchMoments { [weak self] glamMoments in
            guard let self else { return }
            self.glamMoments = glamMoments
            self.glamMomentRail.reloadData()
            self.glamSpinner.stopAnimating()
        }
    }

    func collectionView(_ glamGrid: UICollectionView, numberOfItemsInSection glamSection: Int) -> Int {
        glamMoments.count
    }

    func collectionView(
        _ glamGrid: UICollectionView,
        cellForItemAt glamIndexPath: IndexPath
    ) -> UICollectionViewCell {
        let glamCell = glamGrid.dequeueReusableCell(
            withReuseIdentifier: MuzoiGlamShowcaseCell.glamReuseKey,
            for: glamIndexPath
        ) as! MuzoiGlamShowcaseCell
        let glamMoment = glamMoments[glamIndexPath.item]
        glamCell.glamPresent(glamMoment)
        glamCell.glamDetailAction = { [weak self] in
            self?.glamOpenPortal(.glamStoryDetail, glamQuery: glamMoment.glamIdentity)
        }
        glamCell.glamMuseAction = { [weak self] in
            self?.glamOpenPortal(.glamProfileDetail, glamQuery: glamMoment.glamMuseIdentity)
        }
        glamCell.glamReportAction = { [weak self] in
            self?.glamOpenPortal(.glamReportForm, glamQuery: "")
        }
        return glamCell
    }

    private func glamOpenPortal(_ glamRoute: MuzoiGlamPortalRoute, glamQuery: String) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamAddress = glamRoute.glamComposeAddress(glamQuery: glamQuery)
        navigationController?.pushViewController(
            MuzoiGlamPortalController(glamEntryAddress: glamAddress),
            animated: true
        )
    }

    @objc private func glamOpenTrickArchive() {
        glamOpenPortal(.glamMuseArchive, glamQuery: "0")
    }

    @objc private func glamOpenSparkExpert() {
        glamOpenPortal(.glamSparkExpert, glamQuery: "")
    }

    @objc private func glamOpenPublisher() {
        glamOpenPortal(.glamPublishShowcase, glamQuery: "")
    }
}
