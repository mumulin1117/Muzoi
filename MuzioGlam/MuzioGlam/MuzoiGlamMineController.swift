import UIKit

struct MuzoiGlamMineProfile {
    let glamIdentity: String
    let glamDisplayName: String
    let glamBrief: String
    let glamPortraitAddress: String?
    let glamFollowingCount: Int
    let glamFansCount: Int
}

final class MuzoiGlamMineRepository {
    private let glamProfileEndpoint = "/agchuvaniutezz/tonktolmo"

    func glamFetchProfile(glamYield: @escaping (MuzoiGlamMineProfile) -> Void) {
        let glamStore = MuzoiGlamSessionStore.glamShared
        guard let glamIdentity = glamStore.glamCurrentIdentity, !glamIdentity.isEmpty else {
            glamYield(glamFallbackProfile())
            return
        }

        MuzoiGlamSignalRelay.glamTransmit(
            glamEndpoint: glamProfileEndpoint,
            glamEnvelope: ["makeupMoodDrop": glamIdentity],
            glamSuccess: { [weak self] glamObject in
                guard let self else { return }
                glamYield(self.glamDecodeProfile(glamObject) ?? self.glamFallbackProfile())
            },
            glamFailure: { [weak self] _ in
                guard let self else { return }
                glamYield(self.glamFallbackProfile())
            }
        )
    }

    private func glamDecodeProfile(_ glamObject: Any?) -> MuzoiGlamMineProfile? {
        guard
            let glamEnvelope = glamObject as? [String: Any],
            (glamEnvelope["code"] as? NSNumber)?.intValue == 200000,
            let glamData = glamEnvelope["data"] as? [String: Any],
            let glamIdentity = glamTextValue(glamData["eyeshadowGalaxySwirl"])
        else { return nil }

        return MuzoiGlamMineProfile(
            glamIdentity: glamIdentity,
            glamDisplayName: glamTextValue(glamData["makeupArtSpiral"]) ?? "Muzoi",
            glamBrief: glamTextValue(glamData["videoMakeupStory"]) ?? "Creating a new glam world, one look at a time.",
            glamPortraitAddress: glamTextValue(glamData["shadingCraftFocus"]),
            glamFollowingCount: (glamData["lookCreationHive"] as? NSNumber)?.intValue ?? 0,
            glamFansCount: (glamData["glamourGrungeFlow"] as? NSNumber)?.intValue ?? 0
        )
    }

    private func glamFallbackProfile() -> MuzoiGlamMineProfile {
        let glamStore = MuzoiGlamSessionStore.glamShared
        let glamEmail = glamStore.glamCurrentEmail ?? "muzoi@gmail.com"
        let glamEmailStem = glamEmail.split(separator: "@").first.map(String.init) ?? "Muzoi"
        let glamName = glamEmailStem.prefix(1).uppercased() + glamEmailStem.dropFirst()
        return MuzoiGlamMineProfile(
            glamIdentity: glamStore.glamCurrentIdentity ?? "muzoi-local-profile",
            glamDisplayName: glamName,
            glamBrief: "Creating a new glam world, one look at a time.",
            glamPortraitAddress: nil,
            glamFollowingCount: 0,
            glamFansCount: 0
        )
    }

    private func glamTextValue(_ glamValue: Any?) -> String? {
        if let glamText = glamValue as? String {
            let glamTrimmedText = glamText.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedText.isEmpty { return glamTrimmedText }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }
}

final class MuzoiGlamVaultControl: UIControl {
    private let glamBackdrop = UIImageView(image: UIImage(named: "MuzoiGlamVaultBackdrop"))
    private let glamCaption = UILabel()
    private let glamEntryHint = UILabel()

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamBuildControl()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.16) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
                self.alpha = self.isHighlighted ? 0.84 : 1
            }
        }
    }

    private func glamBuildControl() {
        clipsToBounds = true
        layer.cornerRadius = 20
        glamBackdrop.translatesAutoresizingMaskIntoConstraints = false
        glamBackdrop.contentMode = .scaleToFill
        glamBackdrop.isUserInteractionEnabled = false

        glamCaption.translatesAutoresizingMaskIntoConstraints = false
        glamCaption.text = "My balance"
        glamCaption.textColor = .white
        glamCaption.font = .systemFont(ofSize: 20, weight: .medium)

        glamEntryHint.translatesAutoresizingMaskIntoConstraints = false
        glamEntryHint.text = "Open >"
        glamEntryHint.textColor = .white
        glamEntryHint.font = .systemFont(ofSize: 16, weight: .bold)
        glamEntryHint.textAlignment = .center
        glamEntryHint.layer.borderWidth = 1.5
        glamEntryHint.layer.borderColor = UIColor.white.cgColor
        glamEntryHint.layer.cornerRadius = 16
        glamEntryHint.clipsToBounds = true

        addSubview(glamBackdrop)
        addSubview(glamCaption)
        addSubview(glamEntryHint)

        NSLayoutConstraint.activate([
            glamBackdrop.topAnchor.constraint(equalTo: topAnchor),
            glamBackdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
            glamBackdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
            glamBackdrop.bottomAnchor.constraint(equalTo: bottomAnchor),
            glamCaption.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 124),
            glamCaption.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamEntryHint.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            glamEntryHint.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamEntryHint.widthAnchor.constraint(equalToConstant: 88),
            glamEntryHint.heightAnchor.constraint(equalToConstant: 34),
            glamCaption.trailingAnchor.constraint(lessThanOrEqualTo: glamEntryHint.leadingAnchor, constant: -8)
        ])
    }
}

final class MuzoiGlamMineRowControl: UIControl {
    private let glamGlyph = UIImageView()
    private let glamTitle = UILabel()
    private let glamChevron = UIImageView()

    init(glamText: String, glamSymbol: String, glamTint: UIColor) {
        super.init(frame: .zero)
        glamTitle.text = glamText
        glamGlyph.image = UIImage(systemName: glamSymbol)
        glamGlyph.tintColor = glamTint
        glamBuildControl()
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted
                ? UIColor(red: 0.15, green: 0.16, blue: 0.23, alpha: 1)
                : UIColor(red: 0.11, green: 0.12, blue: 0.18, alpha: 1)
        }
    }

    private func glamBuildControl() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.11, green: 0.12, blue: 0.18, alpha: 1)
        layer.cornerRadius = 16

        glamGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamGlyph.contentMode = .scaleAspectFit
        glamGlyph.layer.shadowColor = glamGlyph.tintColor.cgColor
        glamGlyph.layer.shadowOpacity = 0.65
        glamGlyph.layer.shadowRadius = 7

        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.textColor = .white
        glamTitle.font = .systemFont(ofSize: 19, weight: .regular)

        glamChevron.translatesAutoresizingMaskIntoConstraints = false
        glamChevron.image = UIImage(systemName: "chevron.right")
        glamChevron.tintColor = UIColor(red: 0.31, green: 1, blue: 0.79, alpha: 1)
        glamChevron.contentMode = .scaleAspectFit

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

final class MuzoiGlamMineController: UIViewController {
    private static let glamPortraitPlaceholder = UIImage(
        systemName: "person.crop.circle.fill",
        withConfiguration: UIImage.SymbolConfiguration(pointSize: 62, weight: .regular)
    )?.withRenderingMode(.alwaysTemplate)

    private let glamRepository = MuzoiGlamMineRepository()
    private let glamRootGradient = CAGradientLayer()
    private let glamCanvas = UIScrollView()
    private let glamContent = UIView()
    private let glamHeaderBackdrop = UIView()
    private let glamHeaderGradient = CAGradientLayer()
    private let glamTitle = UILabel()
    private let glamPortrait = UIImageView()
    private let glamName = UILabel()
    private let glamBrief = UILabel()
    private let glamFollowingCaption = UILabel()
    private let glamFollowingValue = UILabel()
    private let glamFansCaption = UILabel()
    private let glamFansValue = UILabel()
    private let glamVaultControl = MuzoiGlamVaultControl()
    private let glamRows = UIStackView()
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamPortraitTask: URLSessionDataTask?
    private var glamExpectedPortraitAddress: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildCanvas()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        glamLoadProfile()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamRootGradient.frame = view.bounds
        glamHeaderGradient.frame = glamHeaderBackdrop.bounds
    }

    deinit {
        glamPortraitTask?.cancel()
    }

    private func glamBuildCanvas() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamRootGradient.colors = [
            UIColor(red: 0.62, green: 0, blue: 0.49, alpha: 1).cgColor,
            UIColor(red: 0.10, green: 0.04, blue: 0.13, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamRootGradient.startPoint = CGPoint(x: 0, y: 0)
        glamRootGradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(glamRootGradient, at: 0)
        glamCanvas.translatesAutoresizingMaskIntoConstraints = false
        glamCanvas.showsVerticalScrollIndicator = false
        glamContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamCanvas)
        glamCanvas.addSubview(glamContent)

        glamHeaderBackdrop.translatesAutoresizingMaskIntoConstraints = false
        glamHeaderGradient.colors = [
            UIColor(red: 0.62, green: 0, blue: 0.49, alpha: 1).cgColor,
            UIColor(red: 0.13, green: 0.05, blue: 0.16, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamHeaderGradient.startPoint = CGPoint(x: 0, y: 0)
        glamHeaderGradient.endPoint = CGPoint(x: 1, y: 1)
        glamHeaderBackdrop.layer.addSublayer(glamHeaderGradient)
        glamContent.addSubview(glamHeaderBackdrop)

        glamTitle.translatesAutoresizingMaskIntoConstraints = false
        glamTitle.text = "Mine"
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
        glamBrief.translatesAutoresizingMaskIntoConstraints = false
        glamBrief.textColor = UIColor.white.withAlphaComponent(0.85)
        glamBrief.font = .systemFont(ofSize: 16, weight: .regular)
        glamBrief.numberOfLines = 1
        glamBrief.lineBreakMode = .byTruncatingTail

        glamConfigureMetric(glamFollowingCaption, glamText: "Follow")
        glamConfigureMetric(glamFansCaption, glamText: "Fans")
        [glamFollowingValue, glamFansValue].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 18, weight: .bold)
        }

        glamVaultControl.translatesAutoresizingMaskIntoConstraints = false
        glamVaultControl.accessibilityLabel = "Open my balance"
        glamVaultControl.addTarget(self, action: #selector(glamOpenVault), for: .touchUpInside)

        let glamInboxRow = MuzoiGlamMineRowControl(
            glamText: "Message",
            glamSymbol: "bubble.left.and.bubble.right",
            glamTint: UIColor(red: 1, green: 0.82, blue: 0.22, alpha: 1)
        )
        glamInboxRow.addTarget(self, action: #selector(glamOpenInbox), for: .touchUpInside)
        let glamEditRow = MuzoiGlamMineRowControl(
            glamText: "Edit profile",
            glamSymbol: "square.and.pencil",
            glamTint: UIColor(red: 0.29, green: 0.39, blue: 1, alpha: 1)
        )
        glamEditRow.addTarget(self, action: #selector(glamOpenEditor), for: .touchUpInside)
        let glamSettingsRow = MuzoiGlamMineRowControl(
            glamText: "Settings",
            glamSymbol: "gearshape",
            glamTint: UIColor(red: 0.94, green: 0.13, blue: 0.91, alpha: 1)
        )
        glamSettingsRow.addTarget(self, action: #selector(glamOpenSettings), for: .touchUpInside)

        glamRows.translatesAutoresizingMaskIntoConstraints = false
        glamRows.axis = .vertical
        glamRows.spacing = 12
        glamRows.distribution = .fillEqually
        [glamInboxRow, glamEditRow, glamSettingsRow].forEach { glamRows.addArrangedSubview($0) }

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white

        [
            glamTitle, glamPortrait, glamName, glamBrief,
            glamFollowingCaption, glamFollowingValue, glamFansCaption, glamFansValue,
            glamVaultControl, glamRows, glamSpinner
        ].forEach { glamContent.addSubview($0) }

        NSLayoutConstraint.activate([
            glamCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamCanvas.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            glamContent.topAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.topAnchor),
            glamContent.leadingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.leadingAnchor),
            glamContent.trailingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.trailingAnchor),
            glamContent.bottomAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.bottomAnchor),
            glamContent.widthAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.widthAnchor),

            glamHeaderBackdrop.topAnchor.constraint(equalTo: glamContent.topAnchor),
            glamHeaderBackdrop.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor),
            glamHeaderBackdrop.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor),
            glamHeaderBackdrop.bottomAnchor.constraint(equalTo: glamVaultControl.bottomAnchor),

            glamTitle.topAnchor.constraint(equalTo: glamContent.topAnchor, constant: 10),
            glamTitle.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 16),

            glamPortrait.topAnchor.constraint(equalTo: glamTitle.bottomAnchor, constant: 34),
            glamPortrait.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 16),
            glamPortrait.widthAnchor.constraint(equalToConstant: 80),
            glamPortrait.heightAnchor.constraint(equalTo: glamPortrait.widthAnchor),
            glamName.leadingAnchor.constraint(equalTo: glamPortrait.trailingAnchor, constant: 14),
            glamName.topAnchor.constraint(equalTo: glamPortrait.topAnchor, constant: 7),
            glamName.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -16),
            glamBrief.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            glamBrief.topAnchor.constraint(equalTo: glamName.bottomAnchor, constant: 3),
            glamBrief.trailingAnchor.constraint(equalTo: glamName.trailingAnchor),

            glamFollowingCaption.leadingAnchor.constraint(equalTo: glamName.leadingAnchor),
            glamFollowingCaption.topAnchor.constraint(equalTo: glamBrief.bottomAnchor, constant: 12),
            glamFollowingValue.leadingAnchor.constraint(equalTo: glamFollowingCaption.trailingAnchor, constant: 8),
            glamFollowingValue.centerYAnchor.constraint(equalTo: glamFollowingCaption.centerYAnchor),
            glamFansCaption.leadingAnchor.constraint(equalTo: glamFollowingValue.trailingAnchor, constant: 28),
            glamFansCaption.centerYAnchor.constraint(equalTo: glamFollowingCaption.centerYAnchor),
            glamFansValue.leadingAnchor.constraint(equalTo: glamFansCaption.trailingAnchor, constant: 8),
            glamFansValue.centerYAnchor.constraint(equalTo: glamFansCaption.centerYAnchor),
            glamFansValue.trailingAnchor.constraint(lessThanOrEqualTo: glamContent.trailingAnchor, constant: -16),

            glamVaultControl.topAnchor.constraint(equalTo: glamPortrait.bottomAnchor, constant: 44),
            glamVaultControl.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 15),
            glamVaultControl.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -15),
            glamVaultControl.heightAnchor.constraint(equalToConstant: 90),

            glamRows.topAnchor.constraint(equalTo: glamVaultControl.bottomAnchor, constant: 25),
            glamRows.leadingAnchor.constraint(equalTo: glamVaultControl.leadingAnchor),
            glamRows.trailingAnchor.constraint(equalTo: glamVaultControl.trailingAnchor),
            glamRows.heightAnchor.constraint(equalToConstant: 198),
            glamRows.bottomAnchor.constraint(equalTo: glamContent.bottomAnchor, constant: -25),

            glamSpinner.centerXAnchor.constraint(equalTo: glamPortrait.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamPortrait.centerYAnchor)
        ])
    }

    private func glamConfigureMetric(_ glamLabel: UILabel, glamText: String) {
        glamLabel.translatesAutoresizingMaskIntoConstraints = false
        glamLabel.text = glamText
        glamLabel.textColor = UIColor.white.withAlphaComponent(0.52)
        glamLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }

    private func glamLoadProfile() {
        glamSpinner.startAnimating()
        glamRepository.glamFetchProfile { [weak self] glamProfile in
            guard let self else { return }
            self.glamName.text = glamProfile.glamDisplayName
            self.glamBrief.text = glamProfile.glamBrief
            self.glamFollowingValue.text = self.glamCompactCount(glamProfile.glamFollowingCount)
            self.glamFansValue.text = self.glamCompactCount(glamProfile.glamFansCount)
            self.glamLoadPortrait(glamProfile.glamPortraitAddress)
            self.glamSpinner.stopAnimating()
        }
    }

    private func glamCompactCount(_ glamCount: Int) -> String {
        guard glamCount >= 1_000 else { return "\(glamCount)" }
        let glamValue = Double(glamCount) / 1_000
        return String(format: glamValue >= 100 ? "%.0fk" : "%.1fk", glamValue)
    }

    private func glamLoadPortrait(_ glamAddress: String?) {
        glamPortraitTask?.cancel()
        glamExpectedPortraitAddress = glamAddress
        glamPortrait.image = Self.glamPortraitPlaceholder
        guard let glamAddress, let glamURL = URL(string: glamAddress) else { return }

        glamPortraitTask = URLSession.shared.dataTask(with: glamURL) { [weak self] glamData, _, _ in
            guard let glamData, let glamImage = UIImage(data: glamData) else { return }
            DispatchQueue.main.async {
                guard let self, self.glamExpectedPortraitAddress == glamAddress else { return }
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

    private func glamOpenPortal(_ glamRoute: MuzoiGlamPortalRoute) {
        UISelectionFeedbackGenerator().selectionChanged()
        let glamAddress = glamRoute.glamComposeAddress(glamQuery: "")
        navigationController?.pushViewController(
            MuzoiGlamPortalController(glamEntryAddress: glamAddress),
            animated: true
        )
    }

    @objc private func glamOpenInbox() { glamOpenPortal(.glamProfileEditor) }
    @objc private func glamOpenVault() { glamOpenPortal(.glamRadianceReserve) }
    @objc private func glamOpenEditor() { glamOpenPortal(.glamMuseEditor) }
    @objc private func glamOpenSettings() { glamOpenPortal(.glamSettings) }
}
