import UIKit

enum MuzoiGlamLegalDocumentKind {
    case glamlashCurl
    case glamlashLiftnvas
    case glamDiscretionCanvas

    var glamTitle: String {
        switch self {
        case .glamlashCurl: return MuzoiGlamVeil("EYn1da AUosjegr1 RLViJceeFnRsueA yAOg3rXeVegmbeMngtx")
        case .glamlashLiftnvas: return MuzoiGlamVeil("TQe0ramUsh PocfS ESCeWrzv2i3cWer")
        case .glamDiscretionCanvas: return MuzoiGlamVeil("PMr4iqvXatcHyH RPto7l0iec3yv")
        }
    }

    var glamActionTitle: String {
        self == .glamlashCurl ? MuzoiGlamVeil("Adg5rfeZeB") : MuzoiGlamVeil("CilCogs3eM")
    }

    var glamBody: String {
        switch self {
        case .glamlashCurl: return MuzoiGlamCovenantCheckController.browPowder
        case .glamlashLiftnvas: return MuzoiGlamCovenantCheckController.glabaseDropdy
        case .glamDiscretionCanvas: return MuzoiGlamCovenantCheckController.glamDiscretionBody
        }
    }
}

final class MuzoiGlamCovenantCheckController: UIViewController {
    var glamDidAccept: (() -> Void)?

    private let glambrowTintKind: MuzoiGlamLegalDocumentKind
    private let glamCanvas = UIScrollView()
    private let glambrowPomade = UILabel()
    private let glamAcceptControl = UIButton(type: .system)

    init(glamKind: MuzoiGlamLegalDocumentKind) {
        self.glambrowTintKind = glamKind
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("iGnVi1tC(7c5ozdxelrm:F)R VhZassr pn0oSt7 vbKe5evn3 oi8m4pPliewmLefnCtwecd5"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        glamInkCovenantScroll()
    }

    private func glamInkCovenantScroll() {
        glamPolishDocumentChrome()
        glamPinDocumentCanvas()
        glamPolishDocumentBody()
        glamPolishDocumentAction()
        glamPinDocumentConstraints()
    }

    private func glamPolishDocumentChrome() {
        title = glambrowTintKind.glamTitle
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(glambrowWax)
        )
    }

    private func glamPinDocumentCanvas() {
        glamCanvas.translatesAutoresizingMaskIntoConstraints = false
        glambrowPomade.translatesAutoresizingMaskIntoConstraints = false
        glamAcceptControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glamCanvas)
        view.addSubview(glamAcceptControl)
        glamCanvas.addSubview(glambrowPomade)
    }

    private func glamPolishDocumentBody() {
        glambrowPomade.numberOfLines = 0
        glambrowPomade.font = .systemFont(ofSize: 15, weight: .regular)
        glambrowPomade.textColor = UIColor.white.withAlphaComponent(0.82)
        glambrowPomade.text = glambrowTintKind.glamBody
    }

    private func glamPolishDocumentAction() {
        var glamControlStyle = UIButton.Configuration.filled()
        glamControlStyle.title = glambrowTintKind.glamActionTitle
        glamControlStyle.baseForegroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamControlStyle.baseBackgroundColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
        glamControlStyle.cornerStyle = .capsule
        glamAcceptControl.configuration = glamControlStyle
        glamAcceptControl.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        glamAcceptControl.addTarget(self, action: #selector(glamAcceptDocument), for: .touchUpInside)
    }

    private func glamPinDocumentConstraints() {
        NSLayoutConstraint.activate([
            glamCanvas.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamCanvas.bottomAnchor.constraint(equalTo: glamAcceptControl.topAnchor, constant: -16),

            glambrowPomade.topAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.topAnchor, constant: 20),
            glambrowPomade.leadingAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.leadingAnchor, constant: 20),
            glambrowPomade.trailingAnchor.constraint(equalTo: glamCanvas.frameLayoutGuide.trailingAnchor, constant: -20),
            glambrowPomade.bottomAnchor.constraint(equalTo: glamCanvas.contentLayoutGuide.bottomAnchor, constant: -20),

            glamAcceptControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            glamAcceptControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            glamAcceptControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            glamAcceptControl.heightAnchor.constraint(equalToConstant: 54)
        ])
    }

    @objc private func glamAcceptDocument() {
        if glambrowTintKind == .glamlashCurl {
            MuzoibakingPuffom.glamCommon.glamamberVeilvenant = true
            glamDidAccept?()
        }
        dismiss(animated: true)
    }

    @objc private func glambrowWax() {
        dismiss(animated: true)
    }

    fileprivate static let browPowder = """
    MUZOI: GLAM END USER LICENSE AGREEMENT
    Effective date: August 7, 2026
    
    1. Agreement and scope
    This End User License Agreement ("EULA") is a binding agreement between you and the provider of Muzoi: Glam ("Muzoi," "we," or "us"). Muzoi is a creative makeup application for discovering artistic looks, sharing photo or motion-based makeup stories, exploring special-effects techniques, and receiving creative suggestions from an AI makeup artist. By selecting Agree, creating an account, or using Muzoi, you accept this EULA, the Terms of Service, and the Privacy Policy. If you do not accept them, do not use the app.
    
    Muzoi is licensed, not sold. Subject to this EULA and the Apple Media Services Usage Rules, we grant you a personal, limited, non-exclusive, non-transferable, non-sublicensable, revocable license to use Muzoi on Apple-branded devices you own or control. You may not copy, distribute, rent, lease, sell, sublicense, reverse engineer, decompile, bypass security, extract source code, or create unauthorized derivative works, except where applicable law expressly permits it.
    
    2. Eligibility and account integrity
    You must be at least 18 years old, have legal capacity to enter this agreement, and be legally permitted to use Muzoi in the country or region where you reside. You must provide truthful, current account information and may not create an account for another person without authorization. You may not impersonate a person or organization, conceal an unlawful identity, evade a prior suspension, automate account creation, transfer an account, or allow another person to use your credentials. You are responsible for safeguarding your password and for activity performed through your account. Notify us promptly at Muzoi@gmail.com if you believe your account has been accessed without permission.
    
    3. User conduct and content standards
    You retain ownership of original makeup photographs, captions, profile material, and other content you submit. You grant Muzoi a worldwide, non-exclusive, royalty-free license to host, reproduce, format, display, and distribute that content only as reasonably necessary to operate, moderate, secure, and improve the service. You represent that you own your content or have all required permissions, including consent from identifiable people shown in it.
    
    You must not create, upload, promote, request, or distribute content that is unlawful; pornographic or sexually exploitative; involving or endangering minors; threatening; harassing; bullying; hateful; discriminatory; defamatory; fraudulent; deceptive; graphically violent; encouraging self-harm; facilitating regulated or criminal activity; infringing intellectual-property, privacy, publicity, or contractual rights; or containing malware, hidden tracking, spam, or unauthorized advertising. Do not sexualize real people without consent, rank people by attractiveness, encourage dangerous cosmetic practices, solicit private credentials, manipulate engagement, scrape user data, or attempt unauthorized access. AI features may not be used to generate abusive, deceptive, infringing, or unsafe material.
    
    4. Reporting, blocking, moderation, and enforcement
    Muzoi provides controls for reporting objectionable content or conduct and for blocking abusive users. Use these tools honestly and provide enough information for review. False or malicious reports are prohibited. We may use automated screening and human review, restrict visibility while a report is assessed, and preserve relevant records where needed for safety or legal compliance. We aim to review safety concerns within a reasonable period, prioritizing credible threats, exploitation, and risks involving minors.
    
    We may reject, filter, remove, or restrict content and may warn users, limit features, suspend accounts, permanently terminate accounts, prevent repeat registration, preserve evidence, or notify competent authorities where appropriate. Serious violations may result in immediate action without advance notice. Blocking limits supported interactions but cannot guarantee that a person will never encounter the blocked user elsewhere.
    
    5. Safety, AI output, and external material
    Makeup instructions and AI-generated suggestions are provided for creative inspiration, not medical, dermatological, legal, or professional advice. Patch-test products, follow manufacturer instructions, and seek qualified help for allergic reactions or health concerns. AI output may be incomplete, inaccurate, or unsuitable. You remain responsible for deciding whether and how to use it.
    
    Third-party pages or material may be available through the app. We do not control third-party services and are not responsible for their availability, accuracy, or practices. Your use of them may be governed by separate terms.
    
    6. Termination and account deletion
    You may stop using Muzoi at any time and may initiate account deletion through the in-app settings. A deletion request removes the account and associated data that we are not legally required to retain. Some content may remain temporarily in backups, safety records, or records needed to resolve disputes, prevent fraud, enforce rights, or comply with law. We may terminate this license if you violate these terms. Upon termination, you must stop using Muzoi.
    
    7. Apple terms and contact
    Apple is not responsible for maintaining or supporting Muzoi. To the extent required by applicable law, Apple has no warranty obligation concerning the app. Apple and its subsidiaries are third-party beneficiaries of this EULA and may enforce it after your acceptance. Nothing in this EULA limits rights that cannot lawfully be excluded. Questions, safety reports, or account concerns may be sent to Muzoi@gmail.com.
    """

    fileprivate static let glabaseDropdy = """
    MUZOI: GLAM TERMS OF SERVICE
    Effective date: August 7, 2026
    
    1. Acceptance of these Terms
    These Terms of Service govern your access to Muzoi: Glam and its related features. Muzoi is a creative makeup platform where adults can discover artistic and special-effects looks, publish makeup stories, interact with other beauty enthusiasts, and obtain creative suggestions from an AI makeup artist. By creating an account, selecting the legal-consent control, or continuing to use Muzoi, you agree to these Terms, the End User License Agreement, and the Privacy Policy. If you disagree, you must not access the service.
    
    2. Account eligibility and registration
    You must be at least 18 years old and legally capable of entering a binding agreement where you reside. You must provide accurate, current registration information and use Muzoi only for lawful purposes. The sign-in flow may create an account automatically when no account exists for the submitted email address. You are responsible for checking that the address is yours, choosing a secure password, keeping credentials confidential, and promptly reporting suspected unauthorized access to Muzoi@gmail.com.
    
    You may not impersonate another person, register through deceptive identity information, create accounts through automated means, sell or transfer an account, share credentials to avoid restrictions, or create a replacement account after suspension without written permission. We may request reasonable information to investigate account ownership, safety complaints, or suspected fraud. We will not ask you to disclose your password by email.
    
    3. Your content and permissions
    "User Content" includes profile information, photographs, motion-based posts, captions, comments, reactions, reports, prompts, and other material you submit. You retain ownership of your original User Content. By submitting it, you grant Muzoi a worldwide, non-exclusive, royalty-free, sublicensable license to store, reproduce, adapt for technical formatting, display, and distribute it as necessary to provide, secure, moderate, and improve Muzoi. This license ends when the content is deleted, except for reasonable backup periods, material shared by others before deletion, and records retained for legitimate safety or legal purposes.
    
    You promise that you own the submitted material or have permission to use it and that identifiable individuals have consented where required. Do not upload confidential information belonging to another person. Muzoi may remove material when ownership or consent cannot reasonably be established.
    
    4. Prohibited behavior
    You may not submit, request, encourage, or distribute material or conduct that is illegal, sexually explicit, pornographic, exploitative, abusive, threatening, harassing, bullying, hateful, discriminatory, defamatory, fraudulent, misleading, graphically violent, or invasive of privacy. Content involving the sexualization, exploitation, grooming, or endangerment of minors is strictly prohibited and may be reported to appropriate authorities.
    
    You may not impersonate others; disclose private personal information; infringe copyright, trademark, publicity, or other rights; promote self-harm or dangerous cosmetic procedures; distribute malware or spam; manipulate rankings, reactions, reports, or engagement; scrape or harvest user information; interfere with technical protections; probe the service for vulnerabilities; access another account; or use Muzoi to facilitate criminal or regulated transactions. Muzoi must not be used primarily for anonymous encounters, attractiveness ranking, sexual solicitation, physical threats, or targeted humiliation.
    
    5. AI-assisted features
    AI suggestions are generated for creative inspiration and may be inaccurate, incomplete, repetitive, or unsuitable. They are not medical, dermatological, or professional advice. You must evaluate suggestions before acting on them, follow product safety instructions, and stop using products that cause irritation. You may not use AI features to create deceptive, unlawful, infringing, discriminatory, exploitative, or harmful material. You remain responsible for prompts you provide and material you publish.
    
    6. Reporting, blocking, and moderation
    Muzoi provides mechanisms to report objectionable content and abusive conduct and to block users. Reports must be made in good faith. Include relevant details so the concern can be reviewed. We may use automated tools and trained reviewers to filter, assess, restrict, or remove content. We may temporarily reduce visibility or limit interactions while investigating.
    
    Enforcement may include a warning, content removal, loss of publishing or interaction features, temporary suspension, permanent account termination, prevention of repeat registration, preservation of relevant records, or referral to authorities. Severe conduct may result in immediate action. Repeated violations or attempts to evade enforcement may lead to permanent removal. We may notify a reporting user that a review is complete but may not disclose confidential disciplinary or legal information.
    
    7. Account deletion and ending use
    You may initiate deletion from the in-app settings. Deletion is intended to remove your account and associated personal data unless retention is required for security, fraud prevention, dispute resolution, enforcement, or law. Merely deleting the app or signing out does not delete the account. If the in-app process cannot be completed, contact Muzoi@gmail.com from the registered address. We may suspend or terminate access when you violate these Terms, create risk, or expose Muzoi or others to legal liability.
    
    8. Service availability and intellectual property
    Muzoi’s interface, branding, software, and original materials are protected by applicable intellectual-property laws. Except for the limited license granted in the EULA, no rights are transferred to you. Features may change, become unavailable, or be discontinued. We do not guarantee uninterrupted operation or that every submitted item will remain available.
    
    9. Disclaimers and responsibility
    Muzoi is provided on an "as is" and "as available" basis to the extent permitted by law. We do not guarantee the accuracy of user submissions, AI output, or external material. Nothing in these Terms excludes consumer rights or liability that cannot legally be limited. You are responsible for lawful use of the service and for harm caused by your violation of these Terms or another person’s rights.
    
    10. Updates and contact
    We may revise these Terms to reflect legal, safety, or functional changes. Material revisions will be presented through an appropriate in-app notice or updated effective date. Continued use after the revised Terms become effective constitutes acceptance where permitted by law. Questions, complaints, copyright concerns, safety reports, and account requests may be sent to Muzoi@gmail.com.
    """

    fileprivate static let glamDiscretionBody = """
    MUZOI: GLAM PRIVACY POLICY
    Effective date: August 7, 2026
    
    1. Scope and contact
    This Privacy Policy explains how Muzoi: Glam ("Muzoi," "we," or "us") handles information when you create an account or use the app. Muzoi supports discovery and sharing of creative makeup looks, profile interaction, safety reporting, and AI-assisted makeup inspiration. This Policy applies to information processed through the iOS app and the service pages opened inside it. Questions, privacy requests, safety concerns, and account-deletion requests may be sent to Muzoi@gmail.com.
    
    2. Information you provide
    Account information may include your email address, account identifier, authentication token, consent status, password or equivalent credential, and information needed to keep you signed in. Muzoi stores only the account information required for authentication and operation. You should never send your password to us by email.
    
    Profile and User Content may include a display name, profile photograph, biography, creative makeup photographs, motion-based posts, captions, comments, reactions, follow status, reports, blocks, and other information you choose to publish. Content you post may be visible to other users according to the feature in which it appears. Do not submit sensitive personal information or material you do not have permission to share.
    
    Communications and safety information may include the content of support requests, reports, identifiers of reported accounts or posts, evidence you voluntarily provide, moderation decisions, blocks, and records needed to investigate abuse. AI feature information may include prompts, requested styling themes, and generated responses needed to provide the feature. Do not include confidential, health, identity-document, or other sensitive information in an AI prompt.
    
    3. Information collected during use
    We may process basic technical and activity information required to deliver and secure the service, such as app version, device and operating-system characteristics, request timestamps, feature interactions, crash or error information, authentication status, and security signals. We do not use this information to secretly identify anonymous individuals or build profiles unrelated to Muzoi’s operation.
    
    If you choose a system feature such as the photo library or camera, iOS will request permission where required. Access is used only for the feature you selected, such as choosing or creating makeup content. Denying an optional permission will not prevent access to unrelated features. You can change permissions in iOS Settings.
    
    Transactions for digital features, if offered, are processed by Apple through StoreKit. Muzoi may receive a product identifier and transaction status needed to unlock the selected feature, but does not receive your full card number or Apple Account password. Apple handles its information under Apple’s own privacy terms.
    
    4. How information is used
    We use information to create and authenticate accounts; display profiles and submitted looks; provide requested AI output; preserve preferences and consent choices; operate follows, reactions, reports, and blocks; respond to support requests; detect spam, fraud, unauthorized access, and policy violations; filter and moderate objectionable content; enforce the EULA and Terms; maintain reliability; comply with legal obligations; and protect users, Muzoi, Apple, and the public.
    
    We do not sell personal information. We do not use information from Contacts, Photos, or other protected device sources to build an unrelated database. We do not require tracking permission or unrelated device permissions as a condition for ordinary account access. Information collected for one purpose will not be repurposed in a materially incompatible way without notice and any consent required by law.
    
    5. Sharing and disclosure
    Information may be displayed to other users when you intentionally publish profile information or User Content. We may disclose limited information to service providers that host, secure, moderate, or support Muzoi, but only as necessary for those functions and subject to protections at least equivalent to those described here. If information is shared with a third-party AI provider, Muzoi will disclose that use and obtain explicit permission where Apple policy or applicable law requires it.
    
    We may disclose information when reasonably necessary to comply with law, lawful process, or regulatory requests; protect safety; investigate fraud or abuse; enforce agreements; defend legal claims; or respond to emergencies. We do not authorize service providers to use Muzoi information for their independent advertising. If ownership of Muzoi changes, information may be transferred as part of that transaction subject to this Policy and applicable law.
    
    6. Retention, deletion, and consent choices
    Information is retained only for as long as reasonably necessary to provide Muzoi, maintain security, resolve disputes, enforce policies, and meet legal requirements. Account and profile information generally remains while the account is active. Deleted content and account records may persist for a limited period in backups. Safety, fraud, transaction, or legal records may be retained longer where reasonably required.
    
    If you created an account, you may initiate account deletion through the in-app settings. Deleting the app or signing out does not delete the account. A valid deletion request removes the account and associated information that we are not legally required to retain. If the in-app process is unavailable, contact Muzoi@gmail.com from the registered email address. We may take reasonable steps to verify account ownership before completing the request.
    
    You may withdraw optional consent by changing the relevant in-app selection or iOS permission. Withdrawing consent does not affect processing already lawfully completed. Some information is required to maintain an account; if you do not want that information processed, you may request account deletion.
    
    7. Security and account responsibility
    We use reasonable administrative and technical measures designed to protect information from unauthorized access, alteration, disclosure, or destruction. No storage or transmission system is completely secure. Use a unique password, keep your device protected, and notify Muzoi@gmail.com if you suspect unauthorized account activity. We will not ask for your password by email.
    
    8. Adults only and international use
    Muzoi is intended only for people aged 18 or older and is not directed to children. We do not knowingly collect personal information from anyone under 18. If you believe a minor has provided information, contact Muzoi@gmail.com so that we can investigate and remove it where appropriate.
    
    Information may be processed in countries other than the one where you live. Where required, we use appropriate safeguards and honor rights available under applicable privacy law. Depending on your jurisdiction, you may have rights to request access, correction, deletion, restriction, portability, or objection. Contact us to exercise an applicable right.
    
    9. Policy updates
    We may update this Policy to reflect changes in the app, law, or privacy practices. Material changes will be communicated through an appropriate in-app notice or updated effective date. We encourage you to review this Policy periodically. Continued use after an update takes effect indicates acknowledgment of the revised Policy where permitted by law.
    """
}
