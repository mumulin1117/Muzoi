import UIKit

/// 启动和页面切换共用的彩妆加载面板。
@MainActor
private final class MuzoiGlamLoadingPanel: UIView {
    private let glass = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
    private let palette = MuzoiGlamPaletteIndicator()
    private let label = UILabel()
    private var portraitCenter: NSLayoutConstraint?
    private var compactCenter: NSLayoutConstraint?
    private var compact = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23; layer.shadowRadius = 22; layer.shadowOffset = CGSize(width: 0, height: 9)
        glass.layer.cornerRadius = 28; glass.layer.cornerCurve = .continuous; glass.clipsToBounds = true
        glass.layer.borderWidth = 0.7; glass.layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        glass.contentView.backgroundColor = UIColor(red: 0.14, green: 0.08, blue: 0.18, alpha: 0.28)
        pin(glass, to: self)
        label.text = "Loading…"
        label.textColor = UIColor(red: 1, green: 0.93, blue: 0.97, alpha: 1)
        label.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: .systemFont(ofSize: 15, weight: .medium), maximumPointSize: 22)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0; label.textAlignment = .center
        label.accessibilityTraits = [.staticText, .updatesFrequently]
        let stack = UIStackView(arrangedSubviews: [palette, label])
        stack.axis = .vertical; stack.alignment = .center; stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        palette.translatesAutoresizingMaskIntoConstraints = false
        let preferredArt = palette.widthAnchor.constraint(equalToConstant: 112); preferredArt.priority = .defaultHigh
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            preferredArt, palette.heightAnchor.constraint(equalTo: palette.widthAnchor),
            label.widthAnchor.constraint(equalTo: stack.widthAnchor)
        ])
        accessibilityViewIsModal = true
    }

    required init?(coder: NSCoder) { nil }

    func install(in host: UIView) {
        translatesAutoresizingMaskIntoConstraints = false; host.addSubview(self)
        let safe = host.safeAreaLayoutGuide
        let position = UILayoutGuide(); host.addLayoutGuide(position)
        NSLayoutConstraint.activate([
            position.topAnchor.constraint(equalTo: safe.topAnchor),
            position.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            position.widthAnchor.constraint(equalToConstant: 0),
            position.heightAnchor.constraint(equalTo: safe.heightAnchor, multiplier: 0.64),
            centerXAnchor.constraint(equalTo: safe.centerXAnchor),
            widthAnchor.constraint(lessThanOrEqualTo: safe.widthAnchor, constant: -40),
            topAnchor.constraint(greaterThanOrEqualTo: safe.topAnchor, constant: 12),
            bottomAnchor.constraint(lessThanOrEqualTo: safe.bottomAnchor, constant: -12),
            palette.widthAnchor.constraint(lessThanOrEqualTo: safe.heightAnchor, multiplier: 0.24)
        ])
        let width = widthAnchor.constraint(equalToConstant: 220); width.priority = .defaultHigh; width.isActive = true
        portraitCenter = centerYAnchor.constraint(equalTo: position.bottomAnchor)
        compactCenter = centerYAnchor.constraint(equalTo: safe.centerYAnchor)
        portraitCenter?.priority = .defaultHigh; compactCenter?.priority = .defaultHigh
        portraitCenter?.isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 28).cgPath
        if let host = superview {
            let next = host.safeAreaLayoutGuide.layoutFrame.height < 460
            if next != compact {
                compact = next
                if next { portraitCenter?.isActive = false; compactCenter?.isActive = true }
                else { compactCenter?.isActive = false; portraitCenter?.isActive = true }
            }
        }
    }

    func setMotionActive(_ active: Bool) {
        palette.setAnimating(active)
    }
}

@MainActor
private func pin(_ child: UIView, to host: UIView) {
    child.translatesAutoresizingMaskIntoConstraints = false; host.addSubview(child)
    NSLayoutConstraint.activate([child.topAnchor.constraint(equalTo: host.topAnchor), child.bottomAnchor.constraint(equalTo: host.bottomAnchor),
                                 child.leadingAnchor.constraint(equalTo: host.leadingAnchor), child.trailingAnchor.constraint(equalTo: host.trailingAnchor)])
}

@MainActor
final class MuzoiGlamPurchaseFeedbackView: UIView {
    private let indicator = MuzoiGlamNativePurchaseFeedback.makeActivityIndicator()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.18)
        accessibilityViewIsModal = true
        indicator.isAccessibilityElement = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) { nil }

    func present(over host: UIView) {
        pin(self, to: host)
        indicator.startAnimating()
    }

    func updateAccessibilityLabel(_ text: String) {
        indicator.accessibilityLabel = text
    }
}

nonisolated enum MuzoiGlamNativePurchaseFeedback {
    static let completed = NacreousPastelOvertureOpus("P7uurjcghhaasIex AcLoFmJphl0extDed.9")
    static let unableToContinue = NacreousPastelOvertureOpus("U5nJakbgl9eS 2t6oS iCDoPnOt9idnVuPeL")
    static let transactionFailed = NacreousPastelOvertureOpus("TOh1ey PtMrSaJnxsPaOcEtmiKovnk rcKoQuElzdt 8nWoFtk NbSeg pcNoomqpUlCe0tme5dc.r")
    static let confirmWithApple = NacreousPastelOvertureOpus("CGoSn4fbirrxmt pymovuQr4 KpiuOrGcnhyaJsNeS 7w8iNtihe dAdpDphlaeq.G")
    static let awaitingApproval = NacreousPastelOvertureOpus("Y7oZuxrL 6pfusrNcdhcaksaeI RirsK Jaiw0ahi8teidnRg2 ta3pTpRr9orvWa7lZ.x")
    static let ok = NacreousPastelOvertureOpus("OzKV")

    @MainActor
    static func makeActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        return indicator
    }
}

/// 固定在当前页面上方，不通过额外的控制器展示加载。
@MainActor
final class MuzoiGlamLoadingOverlay: UIView {
    static let background = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1)
    private enum State { case hidden, loading, revealing }
    private let launchImage = UIImageView(image: UIImage(named: "MuzoiLaunchBackground"))
    private let snapshotHost = UIView()
    private let blur = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let panel = MuzoiGlamLoadingPanel()
    private var state = State.hidden
    private var delayedPanel: Task<Void, Never>?
    private var delayedReveal: Task<Void, Never>?
    private var appearance: UIViewPropertyAnimator?
    private var fade: UIViewPropertyAnimator?
    private var marker = UUID()
    private var panelShownAt: TimeInterval?
    private var lastSnapshot: UIView?
    private var hostConstraints: [NSLayoutConstraint] = []
    private var motionActive = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true; backgroundColor = Self.background
        launchImage.contentMode = .scaleAspectFill; launchImage.clipsToBounds = true
        launchImage.accessibilityElementsHidden = true
        snapshotHost.accessibilityElementsHidden = true
        pin(launchImage, to: self); pin(snapshotHost, to: self); pin(blur, to: self)
        panel.install(in: self)
        accessibilityViewIsModal = true
        layer.zPosition = 100
    }
    required init?(coder: NSCoder) { nil }

    func attach(to host: UIView) {
        if superview === host { host.bringSubviewToFront(self); return }
        NSLayoutConstraint.deactivate(hostConstraints); removeFromSuperview()
        translatesAutoresizingMaskIntoConstraints = false; host.addSubview(self)
        hostConstraints = [topAnchor.constraint(equalTo: host.topAnchor), bottomAnchor.constraint(equalTo: host.bottomAnchor),
                           leadingAnchor.constraint(equalTo: host.leadingAnchor), trailingAnchor.constraint(equalTo: host.trailingAnchor)]
        NSLayoutConstraint.activate(hostConstraints)
    }

    func seedSnapshot(_ snapshot: UIView) { lastSnapshot = snapshot }

    func begin(showLaunch: Bool, over source: UIView?) {
        guard state != .loading else { return }
        let continuing = state == .revealing
        let visibleAlpha = CGFloat(layer.presentation()?.opacity ?? Float(alpha))
        marker = UUID(); delayedReveal?.cancel(); delayedReveal = nil
        fade?.stopAnimation(true); fade = nil
        stopAppearance()
        state = .loading
        isHidden = false
        alpha = continuing ? visibleAlpha : 1
        if !continuing {
            snapshotHost.subviews.forEach { $0.removeFromSuperview() }
            let snapshot = showLaunch ? nil : (source?.snapshotView(afterScreenUpdates: false) ?? lastSnapshot)
            if let snapshot { pin(snapshot, to: snapshotHost) }
            launchImage.isHidden = snapshot != nil
            snapshotHost.isHidden = snapshot == nil
            blur.isHidden = snapshot == nil
            blur.alpha = 0
            panel.alpha = 0; panel.isHidden = true; panelShownAt = nil
        }
        panel.setMotionActive(motionActive && !panel.isHidden)
        if continuing {
            panel.isHidden = false
            UIView.animate(withDuration: 0.16, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) { self.alpha = 1; self.panel.alpha = 1; self.blur.alpha = 1 }
            panel.setMotionActive(motionActive)
        } else {
            let current = marker
            delayedPanel?.cancel()
            delayedPanel = Task { [weak self] in
                try? await Task.sleep(nanoseconds: 180_000_000)
                guard !Task.isCancelled, let self, self.marker == current, self.state == .loading else { return }
                self.panel.isHidden = false; self.panelShownAt = ProcessInfo.processInfo.systemUptime
                self.panel.setMotionActive(self.motionActive)
                let animator = UIViewPropertyAnimator(duration: 0.20, curve: .easeOut) { self.panel.alpha = 1; self.blur.alpha = 1 }
                self.appearance = animator; animator.startAnimation()
            }
        }
    }

    func reveal(over readyView: UIView? = nil) {
        guard state == .loading else { return }
        delayedPanel?.cancel(); delayedPanel = nil
        stopAppearance()
        if let readyView, readyView.bounds.width > 0 { lastSnapshot = readyView.snapshotView(afterScreenUpdates: false) }
        state = .revealing
        let current = marker
        let visibleTime = panelShownAt.map { ProcessInfo.processInfo.systemUptime - $0 } ?? 1
        let hold = max(0.20, 0.44 - visibleTime)
        delayedReveal = Task { [weak self] in
            try? await Task.sleep(nanoseconds: UInt64(max(0, hold) * 1_000_000_000))
            guard !Task.isCancelled, let self, self.marker == current, self.state == .revealing else { return }
            self.fadeOut(current)
        }
    }

    private func fadeOut(_ current: UUID) {
        let animator = UIViewPropertyAnimator(duration: UIAccessibility.isReduceMotionEnabled ? 0.12 : 0.30, curve: .easeInOut) { self.alpha = 0 }
        animator.addCompletion { [weak self] _ in
            guard let self, self.marker == current, self.state == .revealing else { return }
            self.state = .hidden; self.isHidden = true; self.alpha = 1
            self.panel.isHidden = true; self.panel.setMotionActive(false)
            self.snapshotHost.subviews.forEach { $0.removeFromSuperview() }
            self.fade = nil
        }
        fade = animator; animator.startAnimation()
    }

    func clear() {
        marker = UUID(); delayedPanel?.cancel(); delayedReveal?.cancel()
        delayedPanel = nil; delayedReveal = nil
        fade?.stopAnimation(true); fade = nil; stopAppearance()
        state = .hidden; isHidden = true; alpha = 1
        panel.isHidden = true; panel.setMotionActive(false)
        snapshotHost.subviews.forEach { $0.removeFromSuperview() }; lastSnapshot = nil
    }
    func detach() { clear(); NSLayoutConstraint.deactivate(hostConstraints); hostConstraints.removeAll(); removeFromSuperview() }
    func setMotionActive(_ active: Bool) { motionActive = active; panel.setMotionActive(active && state == .loading && !panel.isHidden) }
    private func stopAppearance() {
        let visibleAlpha = CGFloat(panel.layer.presentation()?.opacity ?? Float(panel.alpha))
        let blurAlpha = CGFloat(blur.layer.presentation()?.opacity ?? Float(blur.alpha))
        appearance?.stopAnimation(true); appearance = nil; panel.alpha = visibleAlpha; blur.alpha = blurAlpha
    }
}

enum MuzoiGlamPurchasePhase { case submitting, verifying, finished }

enum MuzoiGlamPurchaseNotice {
    case loading, verifying, waitingForUpdate
    case confirmed, approvalPending, verificationPending, purchaseInProgress
    case invalidPurchaseRequest, purchaseNotReady
    case paymentUnavailable, productUnavailable, purchaseFailed, orderStorageUnavailable
    case receiptUnavailable, verificationUnavailable, verificationConnectionFailed, verificationResponseRejected

    static func result(status: String, reason: String?) -> Self? {
        switch status {
        case "verified": return .confirmed
        case "pending":
            switch reason {
            case "approvalPending": return .approvalPending
            case "purchaseInProgress": return .purchaseInProgress
            default: return .verificationPending
            }
        case "failed":
            switch reason {
            case "invalidPurchaseRequest": return .invalidPurchaseRequest
            case "purchaseNotReady": return .purchaseNotReady
            case "paymentUnavailable": return .paymentUnavailable
            case "productUnavailable": return .productUnavailable
            default: return .purchaseFailed
            }
        default: return nil
        }
    }

    var text: String {
        switch self {
        case .loading: return MuzoiGlamNativePurchaseFeedback.confirmWithApple
        case .verifying: return "Confirming your purchase…"
        case .confirmed: return MuzoiGlamNativePurchaseFeedback.completed
        case .approvalPending: return MuzoiGlamNativePurchaseFeedback.awaitingApproval
        case .verificationUnavailable: return "Purchases are currently unavailable. Please try again later."
        case .verificationPending, .verificationConnectionFailed, .verificationResponseRejected,
             .receiptUnavailable, .waitingForUpdate: return "Your purchase is pending confirmation."
        case .purchaseInProgress: return "Your purchase is still processing."
        case .purchaseNotReady: return "Please wait for the connection and try again."
        case .paymentUnavailable: return "Purchases are currently unavailable."
        case .productUnavailable: return "This item is currently unavailable."
        default: return MuzoiGlamNativePurchaseFeedback.transactionFailed
        }
    }
}
