import UIKit

final class MuzoiGlamRadianceControl: UIButton {
    private let glamRadianceLayer = CAGradientLayer()

    override init(frame glamFrame: CGRect) {
        super.init(frame: glamFrame)
        glamRadianceLayer.colors = [
            UIColor(red: 250 / 255, green: 190 / 255, blue: 226 / 255, alpha: 1).cgColor,
            UIColor(red: 223 / 255, green: 120 / 255, blue: 232 / 255, alpha: 1).cgColor
        ]
        glamRadianceLayer.startPoint = CGPoint(x: 0.20, y: 0.28)
        glamRadianceLayer.endPoint = CGPoint(x: 0.80, y: 0.72)
        layer.insertSublayer(glamRadianceLayer, at: 0)
        clipsToBounds = true
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        glamRadianceLayer.frame = bounds
        layer.cornerRadius = bounds.height / 2
        glamRadianceLayer.cornerRadius = bounds.height / 2
    }
}

final class MuzoiGlamFieldShell: UIView {
    let glamField = UITextField()

    init(glamAsset: String, glamHint: String, glamSecure: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white.withAlphaComponent(0.36)
        layer.cornerRadius = 27
        clipsToBounds = true

        let glamGlyph = UIImageView(image: UIImage(named: glamAsset))
        glamGlyph.translatesAutoresizingMaskIntoConstraints = false
        glamGlyph.tintColor = .white
        glamGlyph.contentMode = .scaleAspectFit

        glamField.translatesAutoresizingMaskIntoConstraints = false
        glamField.textColor = .white
        glamField.tintColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
        glamField.font = .systemFont(ofSize: 17, weight: .medium)
        glamField.isSecureTextEntry = glamSecure
        glamField.autocorrectionType = .no
        glamField.spellCheckingType = .no
        glamField.attributedPlaceholder = NSAttributedString(
            string: glamHint,
            attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.72)]
        )

        addSubview(glamGlyph)
        addSubview(glamField)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 54),
            glamGlyph.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            glamGlyph.centerYAnchor.constraint(equalTo: centerYAnchor),
            glamGlyph.widthAnchor.constraint(equalToConstant: 24),
            glamGlyph.heightAnchor.constraint(equalToConstant: 24),
            glamField.leadingAnchor.constraint(equalTo: glamGlyph.trailingAnchor, constant: 14),
            glamField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            glamField.topAnchor.constraint(equalTo: topAnchor),
            glamField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class MuzoiGlamAuthEntryController: UIViewController, UITextFieldDelegate {
    private let glamBackdrop = CAGradientLayer()
    private let glamUpperAura = CAGradientLayer()
    private let glamCanvas = UIScrollView()
    private let glamContent = UIView()
    private let glamEULAControl = UIButton(type: .system)
    private let glamHeadline = UILabel()
    private let glamEmailShell = MuzoiGlamFieldShell(
        glamAsset: "MuzoiGlamEmailGlyph",
        glamHint: "Enter your email",
        glamSecure: false
    )
    private let glamSecretShell = MuzoiGlamFieldShell(
        glamAsset: "MuzoiGlamSecretGlyph",
        glamHint: "Enter your password",
        glamSecure: true
    )
    private let glamProceedControl = MuzoiGlamRadianceControl(type: .custom)
    private let glamCreationNote = UILabel()
    private let glamFaultNote = UILabel()
    private let glamConsentControl = UIButton(type: .system)
    private let glamTermsControl = UIButton(type: .system)
    private let glamPrivacyControl = UIButton(type: .system)
    private let glamConsentPrefix = UILabel()
    private let glamConsentJoiner = UILabel()
    private let glamSpinner = UIActivityIndicatorView(style: .medium)
    private var glamDidOfferInitialEULA = false

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildBackdrop()
        glamBuildCanvas()
        glamBindActions()
        glamObserveKeyboard()
        glamRefreshConsentControl()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !glamDidOfferInitialEULA else { return }
        glamDidOfferInitialEULA = true
        if !MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA {
            glamPresentAgreement()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glamBackdrop.frame = view.bounds
        glamUpperAura.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: min(410, view.bounds.height * 0.52))
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func glamBuildBackdrop() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamBackdrop.colors = [
            UIColor(red: 31 / 255, green: 7 / 255, blue: 24 / 255, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor,
            UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1).cgColor
        ]
        glamBackdrop.startPoint = CGPoint(x: 0.56, y: 0)
        glamBackdrop.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(glamBackdrop, at: 0)

        glamUpperAura.colors = [
            UIColor(red: 225 / 255, green: 0, blue: 207 / 255, alpha: 0.48).cgColor,
            UIColor(red: 86 / 255, green: 42 / 255, blue: 160 / 255, alpha: 0.22).cgColor,
            UIColor.clear.cgColor
        ]
        glamUpperAura.startPoint = CGPoint(x: 0, y: 0)
        glamUpperAura.endPoint = CGPoint(x: 0.72, y: 1)
        view.layer.insertSublayer(glamUpperAura, above: glamBackdrop)
    }

    private func glamBuildCanvas() {
        glamCanvas.translatesAutoresizingMaskIntoConstraints = false
        glamCanvas.keyboardDismissMode = .interactive
        glamCanvas.alwaysBounceVertical = true
        glamContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamCanvas)
        glamCanvas.addSubview(glamContent)

        [
            glamEULAControl,
            glamHeadline,
            glamEmailShell,
            glamSecretShell,
            glamProceedControl,
            glamCreationNote,
            glamFaultNote,
            glamConsentControl,
            glamConsentPrefix,
            glamTermsControl,
            glamConsentJoiner,
            glamPrivacyControl
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            glamContent.addSubview($0)
        }

        var glamEULAStyle = UIButton.Configuration.gray()
        glamEULAStyle.title = "EULA"
        glamEULAStyle.baseForegroundColor = .white
        glamEULAStyle.baseBackgroundColor = UIColor.white.withAlphaComponent(0.13)
        glamEULAStyle.cornerStyle = .capsule
        glamEULAControl.configuration = glamEULAStyle
        glamEULAControl.layer.borderWidth = 1
        glamEULAControl.layer.borderColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 0.8).cgColor
        glamEULAControl.layer.cornerRadius = 18

        glamHeadline.text = "Welcome Login"
        glamHeadline.textColor = .white
        glamHeadline.font = .systemFont(ofSize: 30, weight: .heavy)
        glamHeadline.adjustsFontSizeToFitWidth = true
        glamHeadline.minimumScaleFactor = 0.8

        glamEmailShell.glamField.keyboardType = .emailAddress
        glamEmailShell.glamField.textContentType = .username
        glamEmailShell.glamField.autocapitalizationType = .none
        glamEmailShell.glamField.returnKeyType = .next
        glamEmailShell.glamField.delegate = self

        glamSecretShell.glamField.textContentType = .password
        glamSecretShell.glamField.returnKeyType = .go
        glamSecretShell.glamField.delegate = self

        glamProceedControl.setTitle("Login", for: .normal)
        glamProceedControl.setTitleColor(UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1), for: .normal)
        glamProceedControl.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        glamProceedControl.accessibilityHint = "Signs in or creates an account when the email is new."

        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamProceedControl.addSubview(glamSpinner)

        glamCreationNote.text = "If the account doesn’t exist, we’ll create one for you."
        glamCreationNote.textColor = UIColor.white.withAlphaComponent(0.62)
        glamCreationNote.font = .systemFont(ofSize: 12, weight: .medium)
        glamCreationNote.textAlignment = .center
        glamCreationNote.numberOfLines = 0

        glamFaultNote.textColor = UIColor(red: 1, green: 0.47, blue: 0.58, alpha: 1)
        glamFaultNote.font = .systemFont(ofSize: 13, weight: .semibold)
        glamFaultNote.textAlignment = .center
        glamFaultNote.numberOfLines = 0

        glamConsentPrefix.text = "I agree to the"
        glamConsentJoiner.text = "and"
        [glamConsentPrefix, glamConsentJoiner].forEach {
            $0.textColor = UIColor.white.withAlphaComponent(0.62)
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }
        glamStyleLegalControl(glamTermsControl, glamTitle: "Terms")
        glamStyleLegalControl(glamPrivacyControl, glamTitle: "Privacy Policy")
        glamConsentControl.tintColor = UIColor(red: 70 / 255, green: 244 / 255, blue: 195 / 255, alpha: 1)
        glamConsentControl.accessibilityLabel = "Accept legal agreements"

        NSLayoutConstraint.activate([
            glamCanvas.topAnchor.constraint(equalTo: view.topAnchor),
            glamCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            glamContent.topAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.topAnchor),
            glamContent.leadingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.leadingAnchor),
            glamContent.trailingAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.trailingAnchor),
            glamContent.bottomAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.bottomAnchor),
            glamContent.widthAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.widthAnchor),
            glamContent.heightAnchor.constraint(greaterThanOrEqualTo: glamCanvas.frameLayoutGuide.heightAnchor),

            glamEULAControl.topAnchor.constraint(equalTo: glamContent.safeAreaLayoutGuide.topAnchor, constant: 20),
            glamEULAControl.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 20),
            glamEULAControl.widthAnchor.constraint(equalToConstant: 68),
            glamEULAControl.heightAnchor.constraint(equalToConstant: 36),

            glamHeadline.topAnchor.constraint(equalTo: glamEULAControl.bottomAnchor, constant: 50),
            glamHeadline.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 40),
            glamHeadline.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -40),

            glamEmailShell.topAnchor.constraint(equalTo: glamHeadline.bottomAnchor, constant: 96),
            glamEmailShell.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 20),
            glamEmailShell.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -20),

            glamSecretShell.topAnchor.constraint(equalTo: glamEmailShell.bottomAnchor, constant: 30),
            glamSecretShell.leadingAnchor.constraint(equalTo: glamEmailShell.leadingAnchor),
            glamSecretShell.trailingAnchor.constraint(equalTo: glamEmailShell.trailingAnchor),

            glamProceedControl.topAnchor.constraint(equalTo: glamSecretShell.bottomAnchor, constant: 70),
            glamProceedControl.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 20),
            glamProceedControl.trailingAnchor.constraint(equalTo: glamContent.trailingAnchor, constant: -20),
            glamProceedControl.heightAnchor.constraint(equalToConstant: 54),
            glamSpinner.centerXAnchor.constraint(equalTo: glamProceedControl.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: glamProceedControl.centerYAnchor),

            glamCreationNote.topAnchor.constraint(equalTo: glamProceedControl.bottomAnchor, constant: 10),
            glamCreationNote.leadingAnchor.constraint(equalTo: glamProceedControl.leadingAnchor, constant: 12),
            glamCreationNote.trailingAnchor.constraint(equalTo: glamProceedControl.trailingAnchor, constant: -12),

            glamFaultNote.topAnchor.constraint(equalTo: glamCreationNote.bottomAnchor, constant: 8),
            glamFaultNote.leadingAnchor.constraint(equalTo: glamProceedControl.leadingAnchor),
            glamFaultNote.trailingAnchor.constraint(equalTo: glamProceedControl.trailingAnchor),

            glamConsentControl.leadingAnchor.constraint(equalTo: glamContent.leadingAnchor, constant: 20),
            glamConsentControl.bottomAnchor.constraint(equalTo: glamContent.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            glamConsentControl.widthAnchor.constraint(equalToConstant: 30),
            glamConsentControl.heightAnchor.constraint(equalToConstant: 30),

            glamConsentPrefix.leadingAnchor.constraint(equalTo: glamConsentControl.trailingAnchor, constant: 6),
            glamConsentPrefix.centerYAnchor.constraint(equalTo: glamConsentControl.centerYAnchor),
            glamTermsControl.leadingAnchor.constraint(equalTo: glamConsentPrefix.trailingAnchor, constant: 3),
            glamTermsControl.centerYAnchor.constraint(equalTo: glamConsentControl.centerYAnchor),
            glamConsentJoiner.leadingAnchor.constraint(equalTo: glamTermsControl.trailingAnchor, constant: 3),
            glamConsentJoiner.centerYAnchor.constraint(equalTo: glamConsentControl.centerYAnchor),
            glamPrivacyControl.leadingAnchor.constraint(equalTo: glamConsentJoiner.trailingAnchor, constant: 3),
            glamPrivacyControl.centerYAnchor.constraint(equalTo: glamConsentControl.centerYAnchor),
            glamPrivacyControl.trailingAnchor.constraint(lessThanOrEqualTo: glamContent.trailingAnchor, constant: -12),

            glamFaultNote.bottomAnchor.constraint(lessThanOrEqualTo: glamConsentControl.topAnchor, constant: -18)
        ])

        let glamDismissTap = UITapGestureRecognizer(target: self, action: #selector(glamDismissKeyboard))
        glamDismissTap.cancelsTouchesInView = false
        glamCanvas.addGestureRecognizer(glamDismissTap)
    }

    private func glamStyleLegalControl(_ glamControl: UIButton, glamTitle: String) {
        var glamStyle = UIButton.Configuration.plain()
        glamStyle.title = glamTitle
        glamStyle.baseForegroundColor = UIColor(red: 70 / 255, green: 244 / 255, blue: 195 / 255, alpha: 1)
        glamStyle.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0)
        glamControl.configuration = glamStyle
        glamControl.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
    }

    private func glamBindActions() {
        glamEULAControl.addTarget(self, action: #selector(glamOpenAgreement), for: .touchUpInside)
        glamProceedControl.addTarget(self, action: #selector(glamSubmitCredentials), for: .touchUpInside)
        glamConsentControl.addTarget(self, action: #selector(glamToggleConsent), for: .touchUpInside)
        glamTermsControl.addTarget(self, action: #selector(glamOpenTerms), for: .touchUpInside)
        glamPrivacyControl.addTarget(self, action: #selector(glamOpenPrivacy), for: .touchUpInside)
        glamEmailShell.glamField.addTarget(self, action: #selector(glamClearFault), for: .editingChanged)
        glamSecretShell.glamField.addTarget(self, action: #selector(glamClearFault), for: .editingChanged)
    }

    private func glamObserveKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(glamKeyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(glamKeyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func glamSubmitCredentials() {
        glamDismissKeyboard()
        let glamEmail = glamEmailShell.glamField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let glamSecret = glamSecretShell.glamField.text ?? ""

        guard !glamEmail.isEmpty else {
            glamShowFault("Please enter your email.", glamFocus: glamEmailShell.glamField)
            return
        }
        guard glamEmail.contains("@"), glamEmail.contains(".") else {
            glamShowFault("Please enter a valid email address.", glamFocus: glamEmailShell.glamField)
            return
        }
        guard !glamSecret.isEmpty else {
            glamShowFault("Please enter your password.", glamFocus: glamSecretShell.glamField)
            return
        }
        guard glamSecret.count >= 6 else {
            glamShowFault("Your password must contain at least 6 characters.", glamFocus: glamSecretShell.glamField)
            return
        }
        guard MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA else {
            glamShowFault("Please review and accept the legal agreements.", glamFocus: nil)
            glamPresentAgreement()
            return
        }

        glamSetSubmitting(true)
        MuzoiGlamSessionStore.glamShared.glamAuthenticate(
            glamEmail: glamEmail,
            glamSecret: glamSecret
        ) { [weak self] glamResult in
            guard let self else { return }
            self.glamSetSubmitting(false)
            switch glamResult {
            case .success:
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                (UIApplication.shared.delegate as? AppDelegate)?.glamShowMainCanvas(glamAnimated: true)
            case .failure(let glamFault):
                self.glamShowFault(glamFault.localizedDescription, glamFocus: self.glamSecretShell.glamField)
            }
        }
    }

    private func glamSetSubmitting(_ glamSubmitting: Bool) {
        glamProceedControl.isEnabled = !glamSubmitting
        glamEmailShell.glamField.isEnabled = !glamSubmitting
        glamSecretShell.glamField.isEnabled = !glamSubmitting
        glamProceedControl.setTitle(glamSubmitting ? nil : "Login", for: .normal)
        glamSubmitting ? glamSpinner.startAnimating() : glamSpinner.stopAnimating()
        glamProceedControl.alpha = glamSubmitting ? 0.82 : 1
    }

    private func glamShowFault(_ glamText: String, glamFocus: UITextField?) {
        glamFaultNote.text = glamText
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        glamFocus?.becomeFirstResponder()
    }

    @objc private func glamClearFault() {
        glamFaultNote.text = nil
    }

    @objc private func glamToggleConsent() {
        let glamNextValue = !MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA
        MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA = glamNextValue
        glamRefreshConsentControl()
        if !glamNextValue {
            glamFaultNote.text = nil
        }
    }

    private func glamRefreshConsentControl() {
        let glamAccepted = MuzoiGlamSessionStore.glamShared.glamHasAcceptedEULA
        let glamSymbol = glamAccepted ? "checkmark.circle.fill" : "circle"
        glamConsentControl.setImage(UIImage(systemName: glamSymbol), for: .normal)
        glamConsentControl.accessibilityValue = glamAccepted ? "Accepted" : "Not accepted"
    }

    @objc private func glamOpenAgreement() {
        glamPresentLegalDocument(glamKind: .glamEULA)
    }

    private func glamPresentAgreement() {
        glamPresentLegalDocument(glamKind: .glamEULA)
    }

    @objc private func glamOpenTerms() {
        glamPresentLegalDocument(glamKind: .glamTerms)
    }

    @objc private func glamOpenPrivacy() {
        glamPresentLegalDocument(glamKind: .glamPrivacy)
    }

    private func glamPresentLegalDocument(glamKind: MuzoiGlamLegalDocumentKind) {
        guard presentedViewController == nil else { return }
        let glamAgreement = MuzoiGlamLegalAgreementController(glamKind: glamKind)
        if glamKind == .glamEULA {
            glamAgreement.glamDidAccept = { [weak self] in
                self?.glamRefreshConsentControl()
                self?.glamFaultNote.text = nil
            }
        }
        let glamNavigation = UINavigationController(rootViewController: glamAgreement)
        glamNavigation.modalPresentationStyle = .pageSheet
        if let glamSheet = glamNavigation.sheetPresentationController {
            glamSheet.detents = [.large()]
            glamSheet.prefersGrabberVisible = true
        }
        present(glamNavigation, animated: true)
    }

    @objc private func glamDismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func glamKeyboardWillShow(_ glamNotice: Notification) {
        guard
            let glamFrame = glamNotice.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let glamDuration = glamNotice.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }

        let glamCoveredHeight = max(0, view.bounds.maxY - view.convert(glamFrame, from: nil).minY)
        let glamInsets = UIEdgeInsets(top: 0, left: 0, bottom: glamCoveredHeight + 12, right: 0)
        UIView.animate(withDuration: glamDuration) {
            self.glamCanvas.contentInset = glamInsets
            self.glamCanvas.scrollIndicatorInsets = glamInsets
        }
    }

    @objc private func glamKeyboardWillHide(_ glamNotice: Notification) {
        let glamDuration = glamNotice.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25
        UIView.animate(withDuration: glamDuration) {
            self.glamCanvas.contentInset = .zero
            self.glamCanvas.scrollIndicatorInsets = .zero
        }
    }

    func textFieldShouldReturn(_ glamActiveField: UITextField) -> Bool {
        if glamActiveField === glamEmailShell.glamField {
            glamSecretShell.glamField.becomeFirstResponder()
        } else {
            glamSubmitCredentials()
        }
        return true
    }
}
