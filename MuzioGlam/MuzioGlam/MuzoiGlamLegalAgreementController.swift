import UIKit

enum MuzoiGlamLegalDocumentKind {
    case glamEULA
    case glamTerms
    case glamPrivacy

    var glamTitle: String {
        switch self {
        case .glamEULA: return "End User License Agreement"
        case .glamTerms: return "Terms of Service"
        case .glamPrivacy: return "Privacy Policy"
        }
    }

    var glamActionTitle: String {
        self == .glamEULA ? "Agree" : "Close"
    }

    var glamBody: String {
        switch self {
        case .glamEULA: return MuzoiGlamLegalAgreementController.glamAgreementText
        case .glamTerms: return MuzoiGlamLegalAgreementController.glamTermsText
        case .glamPrivacy: return MuzoiGlamLegalAgreementController.glamPrivacyText
        }
    }
}

final class MuzoiGlamLegalAgreementController: UIViewController {
    var glamDidAccept: (() -> Void)?

    private let glamKind: MuzoiGlamLegalDocumentKind
    private let glamCanvas = UIScrollView()
    private let glamDocument = UILabel()
    private let glamAcceptControl = UIButton(type: .system)

    init(glamKind: MuzoiGlamLegalDocumentKind) {
        self.glamKind = glamKind
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildCanvas()
    }

    private func glamBuildCanvas() {
        title = glamKind.glamTitle
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(glamCloseDocument)
        )

        glamCanvas.translatesAutoresizingMaskIntoConstraints = false
        glamDocument.translatesAutoresizingMaskIntoConstraints = false
        glamAcceptControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamCanvas)
        view.addSubview(glamAcceptControl)
        glamCanvas.addSubview(glamDocument)

        glamDocument.numberOfLines = 0
        glamDocument.font = .systemFont(ofSize: 15, weight: .regular)
        glamDocument.textColor = UIColor.white.withAlphaComponent(0.82)
        glamDocument.text = glamKind.glamBody

        var glamControlStyle = UIButton.Configuration.filled()
        glamControlStyle.title = glamKind.glamActionTitle
        glamControlStyle.baseForegroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamControlStyle.baseBackgroundColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
        glamControlStyle.cornerStyle = .capsule
        glamAcceptControl.configuration = glamControlStyle
        glamAcceptControl.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        glamAcceptControl.addTarget(self, action: #selector(glamAcceptDocument), for: .touchUpInside)

        NSLayoutConstraint.activate([
            glamCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamCanvas.bottomAnchor.constraint(equalTo: glamAcceptControl.topAnchor, constant: -16),

            glamDocument.topAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.topAnchor, constant: 20),
            glamDocument.leadingAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.leadingAnchor, constant: 20),
            glamDocument.trailingAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.trailingAnchor, constant: -20),
            glamDocument.bottomAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.bottomAnchor, constant: -20),

            glamAcceptControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            glamAcceptControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            glamAcceptControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            glamAcceptControl.heightAnchor.constraint(equalToConstant: 54)
        ])
    }

    @objc private func glamAcceptDocument() {
        if glamKind == .glamEULA {
            MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA = true
            glamDidAccept?()
        }
        dismiss(animated: true)
    }

    @objc private func glamCloseDocument() {
        dismiss(animated: true)
    }

    fileprivate static let glamAgreementText = """
    Welcome to Muzoi: Glam. This End User License Agreement governs access to the app.

    Eligibility and identity
    You must be at least 18 years old, legally permitted to use this app where you reside, and provide accurate local identity and account information. Accounts created through false identity details may be suspended.

    Conduct standards
    Do not submit illegal, abusive, threatening, hateful, discriminatory, deceptive, sexually explicit, exploitative, infringing, or harmful material. Do not impersonate others, harass anyone, distribute malware, manipulate engagement, or attempt unauthorized access.

    Safety controls
    Muzoi: Glam provides reporting and blocking controls. Reports may be reviewed and relevant access may be limited while an investigation is underway. Blocking prevents further interaction through supported areas of the app.

    Moderation and enforcement
    Material may be screened, restricted, or removed. Violations may result in warnings, feature restrictions, account suspension, permanent removal, preservation of evidence, or referral to appropriate authorities when legally required.

    Account responsibility
    Keep your credentials secure and notify the app operator if you suspect unauthorized access. You are responsible for activity performed through your account.

    By selecting Agree, you confirm that you understand and accept these rules, the Terms of Service, and the Privacy Policy.
    """

    fileprivate static let glamTermsText = """
    These Terms of Service describe the rules for using Muzoi: Glam.

    Use the app lawfully and respectfully. You may not impersonate another person, interfere with app operation, attempt unauthorized access, submit harmful material, or violate another person’s rights.

    You are responsible for protecting your credentials and for activity performed through your account. Access may be restricted or ended when these terms, applicable law, or safety requirements are violated.

    Features may evolve as the app improves. Continued use after a clearly presented update means that you accept the revised terms.
    """

    fileprivate static let glamPrivacyText = """
    This Privacy Policy explains how Muzoi: Glam handles information stored through the app.

    The app may store account credentials, profile details, preferences, consent status, and app activity needed to provide its features. Local account records remain in the app sandbox unless a permitted service is expressly introduced.

    Information is used to authenticate access, preserve preferences, support safety reviews, prevent abuse, and improve reliability. Credentials should never be shared with another person.

    You may stop using the app at any time. Signing out clears only the active sign-in state and does not silently erase other locally registered profiles.
    """
}
