import UIKit
import UserNotifications

@MainActor
final class MuzoiGlamShowingCoordinator: UIViewController {
    private let service = MuzoiGlamOpenService()
    private let resolver = MuzoiGlamAblyResolver()
    private let deviceID: String
    private let startsAtRegistration: Bool
    private var initialBackdrop: UIView?
    private var pendingAccount: MuzoiGlamShowingAccount?
    private var selectedAccount: String?
    private var isClosed = false
    private var canReuseNativeSession = false
    private var identity: MuzoiGlamShowingIdentity {
        MuzoiGlamShowingIdentity(deviceID: deviceID,
                             version: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.1",
                             pushToken: UserDefaults.standard.string(forKey: "muzoiGlam.gateway.pushToken"))
    }
    private var transition: Task<Void, Never>?
    private var generation = UUID()
    private var presentedPage: UIViewController?
    private var business: MuzoiGlamBusinessStream?
    private var purchaseSession: MuzoiGlamBusinessPurchaseSession?
    private var deferred: (() -> Void)?
    private var suspended = false
    private var checkedNotificationAuthorization = false

    private let overlay = MuzoiGlamLoadingOverlay()
    private var hasRevealedPage = false

    init(registration: Bool = false, backdrop: UIView? = nil) {
        startsAtRegistration = registration
        initialBackdrop = backdrop
        deviceID = TesseraCeruleanAtelierMuao.graphitewashLotusImprintMuao
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MuzoiGlamLoadingOverlay.background
        installOverlay()
        if let initialBackdrop { overlay.seedSnapshot(initialBackdrop); self.initialBackdrop = nil }
        if startsAtRegistration { showRegistration() } else { bootstrap() }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if overlay.superview !== presentedPage?.viewIfLoaded { installOverlay() }
    }

    func resume() {
        guard !isClosed else { return }
        suspended = false
        overlay.setMotionActive(true)
        if let deferred {
            self.deferred = nil
            deferred()
        } else if isViewLoaded, presentedPage == nil, transition == nil {
            bootstrap()
        }
        if let web = presentedPage as? MuzoiGlamShowingWeb, web.canStartBusiness { business?.start() }
        refreshBusinessReadiness()
        (presentedPage as? MuzoiGlamShowingWeb)?.resumePurchaseFeedback()
        MuzoiGlamBusinessPurchases.shared.recoverUnfinished()
    }

    func suspend() {
        suspended = true
        overlay.setMotionActive(false)
        business?.stop()
        if let web = presentedPage as? MuzoiGlamShowingWeb {
            // 相机授权弹窗会短暂让应用失焦，注册页等到真正进入后台再停止采集。
            if !web.isRegistration { web.stopCapture() }
            web.pausePurchaseFeedback()
        }
        refreshBusinessReadiness()
        if presentedPage == nil { cancelTransition() }
    }

    func enterBackground() {
        if let web = presentedPage as? MuzoiGlamShowingWeb, web.isRegistration {
            web.stopCapture()
        }
    }

    func close() {
        isClosed = true
        pendingAccount = nil
        cancelTransition()
        deferred = nil
        stopBusiness()
        (presentedPage as? MuzoiGlamShowingWeb)?.close()
        overlay.detach()
    }

    private func cancelTransition() {
        generation = UUID()
        transition?.cancel()
        transition = nil
    }

    private func active(_ marker: UUID) -> Bool { !isClosed && generation == marker && !Task.isCancelled }

    private func perform(_ action: @escaping @MainActor (MuzoiGlamShowingCoordinator, UUID) async -> Void) {
        cancelTransition()
        let marker = generation
        transition = Task { [weak self] in
            guard let self else { return }
            await action(self, marker)
            if self.generation == marker { self.transition = nil }
        }
    }

    private func bootstrap() {
        guard !suspended else {
            deferred = { [weak self] in self?.bootstrap() }
            return
        }
        guard transition == nil else { return }
        currentDocumentID = UUID()
        pendingAccount = nil
        selectedAccount = nil
        canReuseNativeSession = true
        stopBusiness()
        loadOverlay()
        perform { owner, marker in
            guard let reply = try? await owner.service.openUntilSuccessful(identity: owner.identity),
                  owner.active(marker) else { return }
            MuzoiGlamBusinessDiagnostic.record("openSucceeded")
            owner.whenVisible { $0.showRemote(reply.url, configuration: reply) }
        }
    }

    private func deliverRegistrationResult(_ url: URL, account: MuzoiGlamShowingAccount?, captured: MuzoiGlamOpenReply? = nil) {
        canReuseNativeSession = false
        pendingAccount = account
        selectedAccount = account?.email
        whenVisible { owner in
            owner.showRemote(url, configuration: captured, isRegistrationResult: true)
        }
    }

    private func whenVisible(_ action: @escaping (MuzoiGlamShowingCoordinator) -> Void) {
        if suspended { deferred = { [weak self] in if let self { action(self) } } }
        else { action(self) }
    }

    func showRegistration(login: Bool = false) {
        cancelTransition()
        deferred = nil
        pendingAccount = nil
        selectedAccount = nil
        canReuseNativeSession = false
        stopBusiness()
        guard let file = MuzoiGlamShowingIdentity.registrationEntry,
              let entry = identity.registrationURL(file, language: "en") else {
            MuzoiGlamBusinessDiagnostic.record("registrationEntryUnavailable")
            overlay.clear()
            return
        }
        var address = URLComponents(url: entry, resolvingAgainstBaseURL: false)
        if login { address?.fragment = "/login" }
        guard let url = address?.url else { return }
        showWeb(url, purpose: .registration) { owner, event in
            if case .registered(let url, let account, let reply) = event {
                owner.deliverRegistrationResult(url, account: account, captured: reply)
            }
        }
    }

    private func showMainHub(_ account: MuzoiGlamShowingAccount?) {
        stopBusiness()
        let session = CContourAccentbakingPuffom.glamCommon
        guard let account = account ?? pendingAccount else {
            // A cold-start Community page may reuse an existing authenticated A account.
            // With no valid A session, collect real credentials in the new registration UI.
            if canReuseNativeSession, session.glamHasporcelainMuse { enterNativeMain() }
            else { showRegistration(login: true) }
            return
        }
        loadOverlay()
        cancelTransition()
        let marker = generation
        let accepts: () -> Bool = { [weak self] in
            guard let self else { return false }
            return !self.isClosed && self.generation == marker
        }
        let completed: (Result<DewyHaloMuzEntryPalette, Error>) -> Void = { [weak self] result in
            guard let self, !self.isClosed, self.generation == marker else { return }
            switch result {
            case .success:
                self.pendingAccount = nil
                if self.suspended { self.deferred = { [weak self] in self?.enterNativeMain() } }
                else { self.enterNativeMain() }
            case .failure:
                self.whenVisible { owner in
                    owner.overlay.clear()
                    let title = account.operation == .register ? "Couldn’t create your account" : "Couldn’t sign in"
                    let message = account.operation == .register ? "Please try again, or log in if you already have an account." : "Please check your email and password, then try again."
                    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Back to log in", style: .cancel) { [weak owner] _ in owner?.showRegistration(login: true) })
                    alert.addAction(UIAlertAction(title: "Try again", style: .default) { [weak owner] _ in owner?.showMainHub(account) })
                    owner.present(alert, animated: true)
                }
            }
        }
        switch account.operation {
        case .login:
            session.glamespressoShadey(glammahoganyTone: account.email, glamBlendingGlowpath: account.password,
                                      shouldAccept: accepts, glamebonyDepth: completed)
        case .register:
            session.glamRegister(email: account.email, password: account.password, shouldAccept: accepts, completion: completed)
        }
    }

    private func enterNativeMain() {
        guard !isClosed, let app = UIApplication.shared.delegate as? AppDelegate else { return }
        pendingAccount = nil
        app.glamunderEyeSet(brighteningVeil: true)
    }

    private func showRemote(_ url: URL, configuration: MuzoiGlamOpenReply? = nil,
                            connection: MuzoiGlamBusinessConnection? = nil, isRegistrationResult: Bool = false) {
        cancelTransition()
        stopBusiness()
        let needsLookup = isRegistrationResult && configuration == nil
        let mayUseBusiness = connection != nil || needsLookup || configuration?.hasBusinessConfiguration == true
        let page = showWeb(url, purpose: .remote(mayUseBusiness: mayUseBusiness)) { owner, event in
            switch event {
            case .confirmed(.welcome): owner.showRegistration()
            case .confirmed(.community):
                owner.cancelTransition()
                UserDefaults.standard.set(true, forKey: "muzoiCommunityRulesAccepted")
                owner.showMainHub(owner.pendingAccount)
            case .logout: owner.signedOut()
            case .openLink(let target):
                (owner.presentedPage as? MuzoiGlamShowingWeb)?.openBusinessLink(target.absoluteString)
            case .legacyPurchase:
                // The legacy string bridge has no server order. Never fabricate one or
                // call the old unconditional-success callback before receipt validation.
                (owner.presentedPage as? MuzoiGlamShowingWeb)?.purchaseUnavailable()
            default: break
            }
        }
        MuzoiGlamBusinessDiagnostic.record("remoteWebViewPresented")
        if let connection {
            startBusiness(connection, on: page)
        } else if mayUseBusiness {
            perform { owner, marker in
                await owner.prepareBusiness(on: page, configuration: configuration,
                                            isRegistrationResult: isRegistrationResult, marker: marker)
            }
        }
    }

    private func prepareBusiness(on page: MuzoiGlamShowingWeb, configuration: MuzoiGlamOpenReply?,
                                 isRegistrationResult: Bool, marker: UUID) async {
        let identity = identity
        let service = service
        let account = selectedAccount
        var reply = configuration
        if reply == nil {
            reply = try? await service.open(identity: identity, account: account)
            guard let reply, MuzoiGlamShowingURL.sameDocument(reply.url, page.currentAddress) else { return }
        }

        while active(marker), presentedPage === page, let candidate = reply {
            do {
                let connection = try await resolver.connection(for: candidate)
                guard active(marker), presentedPage === page else { return }
                if let connection { startBusiness(connection, on: page) }
                return
            } catch {
                guard active(marker) else { return }
                MuzoiGlamBusinessDiagnostic.record("connectionRejected")
                try? await Task.sleep(nanoseconds: 1_500_000_000)
            }
            guard active(marker),
                  let fresh = try? await MuzoiGlamOpenService.retry(operation: {
                      try await service.open(identity: identity, account: account)
                  }), active(marker), presentedPage === page else { return }
            if !MuzoiGlamShowingURL.sameDocument(fresh.url, page.currentAddress) {
                if !isRegistrationResult { whenVisible { $0.showRemote(fresh.url, configuration: fresh) } }
                return
            }
            reply = fresh
        }
    }

    private func startBusiness(_ connection: MuzoiGlamBusinessConnection, on page: MuzoiGlamShowingWeb) {
        page.enableBusiness()
        MuzoiGlamBusinessDiagnostic.record("businessWebView")
        let stream = MuzoiGlamBusinessStream(connection) { [weak self] in
            guard let self else { throw CancellationError() }
            let fresh = try await self.service.open(identity: self.identity, account: self.selectedAccount)
            guard let refreshed = try await self.resolver.connection(for: fresh) else {
                throw MuzoiGlamShowingError.changedDestination
            }
            return refreshed
        } onMessage: { [weak self, weak page] message, timestamp in
            guard let self, let page, self.presentedPage === page else { return }
            self.handleBusinessMessage(message, timestamp: timestamp, page: page)
        } onChanged: { [weak self, weak page] in
            guard let self, let page, self.presentedPage === page else { return }
            self.bootstrap()
        } onSubscriptionChanged: { [weak self, weak page] in
            guard let self, let page, self.presentedPage === page else { return }
            self.refreshBusinessReadiness()
        }
        business = stream
        refreshBusinessReadiness()
        if !suspended, page.canStartBusiness { stream.start() }
    }

    private func refreshBusinessReadiness() {
        guard let page = presentedPage as? MuzoiGlamShowingWeb else { return }
        let purchases = MuzoiGlamBusinessPurchases.shared
        let isBusiness = page.isRemoteBusiness && business != nil
        let pageReady = page.canAcceptBusinessActions
        if isBusiness, pageReady, let business, purchaseSession == nil {
            let session = MuzoiGlamBusinessPurchaseSession(id: UUID(), channel: business.channel)
            purchaseSession = session
            purchases.attach(session, paymentProgress: { [weak self, weak page] order, phase in
                guard let self, let page, self.presentedPage === page, self.purchaseSession == session else { return }
                page.updatePurchaseProgress(order: order, phase: phase)
            }) { [weak self, weak page] payload, notice in
                guard let self, let page, self.presentedPage === page, self.purchaseSession == session else { return }
                page.deliverPurchaseResult(payload, notice: notice)
            }
        }
        let state = MuzoiGlamBusinessReadiness(business: isBusiness, pageReady: pageReady, foreground: !suspended,
                                          subscribed: business?.isSubscribed == true, paymentAvailable: purchases.isAvailable)
        if let purchaseSession { purchases.setReady(state.purchaseEnabled, for: purchaseSession) }
        page.deliverBusinessReadiness(state)
        if isBusiness, pageReady, !suspended { requestNotificationAuthorization() }
    }

    private func requestNotificationAuthorization() {
        guard !checkedNotificationAuthorization, UIApplication.shared.applicationState == .active else { return }
        checkedNotificationAuthorization = true
        Task { [weak self] in
            let center = UNUserNotificationCenter.current()
            guard await center.notificationSettings().authorizationStatus == .notDetermined,
                  let self else { return }
            // 读取系统设置期间可能离开 B 页，弹窗前再次核对。
            guard let page = self.presentedPage as? MuzoiGlamShowingWeb, page.isRemoteBusiness, self.business != nil,
                  !self.isClosed, !self.suspended, page.canAcceptBusinessActions,
                  UIApplication.shared.applicationState == .active else {
                self.checkedNotificationAuthorization = false
                return
            }
            _ = try? await center.requestAuthorization(options: [.alert, .badge, .sound])
        }
    }

    private func invalidatePurchaseSession() {
        guard let purchaseSession else { return }
        self.purchaseSession = nil
        MuzoiGlamBusinessPurchases.shared.detach(purchaseSession)
    }

    private func handleBusinessMessage(_ packet: [String: Any], timestamp: Double?, page: MuzoiGlamShowingWeb) {
        guard presentedPage === page, !suspended else { return }
        let config = MuzoiGlamBusinessConfiguration.profile
        switch MuzoiGlamBusinessCommand.read(packet) {
        case .logout:
            signedOut()
        case .connected(let address):
            // 实时消息只更新网页地址，网页确认后的跳转由 WebView 消息触发。
            if page.currentAddress != address, let connection = business?.destination(address) {
                showRemote(address, connection: connection)
            } else {
                page.deliverBusinessMessage(packet)
            }
        case .purchase(let product, let order):
            guard let purchaseSession, page.canAcceptBusinessActions else { return }
            guard let timestamp, abs(Date().timeIntervalSince1970 * 1_000 - timestamp) <= 120_000 else {
                page.deliverPurchaseResult(config.purchase(order: order, product: product, status: "failed", reason: "purchaseExpired"))
                return
            }
            refreshBusinessReadiness()
            MuzoiGlamBusinessPurchases.shared.request(order: order, product: product, session: purchaseSession)
        case .invalidPurchase:
            page.deliverPurchaseResult(config.purchase(order: "", product: "", status: "failed", reason: "invalidPurchaseRequest"))
        case .openBrowser(let address):
            guard page.canAcceptBusinessActions else { return }
            page.openBusinessLink(address.absoluteString) { [weak self, weak page] success in
                guard let self, let page, self.presentedPage === page else { return }
                page.deliverBusinessMessage(config.opened(success))
            }
        case .forward:
            page.deliverBusinessMessage(packet)
        }
    }

    func signedOut() {
        cancelTransition()
        deferred = nil
        pendingAccount = nil
        selectedAccount = nil
        CContourAccentbakingPuffom.glamCommon.glamSealEntry()
        guard let page = presentedPage as? MuzoiGlamShowingWeb, page.usesBusinessWebsiteData else {
            showRegistration()
            return
        }
        stopBusiness()
        currentDocumentID = UUID()
        loadOverlay()
        perform { owner, marker in
            await page.clearBusinessWebsiteSession()
            guard owner.active(marker) else { return }
            owner.showRegistration()
        }
    }

    private func stopBusiness() {
        let previous = business
        business = nil
        invalidatePurchaseSession()
        previous?.close()
    }

    @discardableResult
    private func showWeb(_ url: URL, purpose: MuzoiGlamShowingWeb.Purpose,
                         action: @escaping (MuzoiGlamShowingCoordinator, MuzoiGlamShowingWeb.Event) -> Void) -> MuzoiGlamShowingWeb {
        loadOverlay()
        let pageID = UUID()
        currentDocumentID = pageID
        let web = MuzoiGlamShowingWeb(document: url, purpose: purpose) { [weak self] event in
            guard let self, self.currentDocumentID == pageID else { return }
            switch event {
            case .loading, .loadStopped:
                self.invalidatePurchaseSession()
                self.business?.stop()
                if case .registration = purpose {
                    if case .loading = event { self.loadOverlay(captureCurrentPage: false) }
                    else { self.hideOverlay() }
                } else if case .loadStopped = event, self.overlay.superview === self.presentedPage?.viewIfLoaded {
                    self.overlay.clear()
                }
            case .ready:
                if case .registration = purpose { self.hideOverlay() }
                else if self.overlay.superview === self.presentedPage?.viewIfLoaded { self.overlay.clear() }
                if let page = self.presentedPage as? MuzoiGlamShowingWeb {
                    if page.isOnboardingDocument {
                        self.cancelTransition()
                        self.stopBusiness()
                        MuzoiGlamBusinessDiagnostic.record("onboardingWebViewReady")
                        return
                    }
                    if !self.suspended, page.canStartBusiness { self.business?.start() }
                }
                self.refreshBusinessReadiness()
            default: action(self, event)
            }
        }
        stage(web)
        if case .remote = purpose {
            hasRevealedPage = true
            overlay.attach(to: web.view, belowContent: true)
        }
        return web
    }

    private var currentDocumentID = UUID()

    private func stage(_ page: UIViewController) {
        let previous = presentedPage

        presentedPage = page
        (previous as? MuzoiGlamShowingWeb)?.close()
        previous?.willMove(toParent: nil)
        previous?.view.removeFromSuperview()
        previous?.removeFromParent()
        addChild(page)
        page.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(page.view)
        if overlay.superview === view { view.bringSubviewToFront(overlay) }
        NSLayoutConstraint.activate([
            page.view.topAnchor.constraint(equalTo: view.topAnchor), page.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            page.view.leadingAnchor.constraint(equalTo: view.leadingAnchor), page.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        page.didMove(toParent: self)
    }
}

private extension MuzoiGlamShowingCoordinator {
    func installOverlay() {
        overlay.attach(to: view.window ?? view)
    }

    func loadOverlay(captureCurrentPage: Bool = true) {
        installOverlay()
        view.endEditing(true)
        (presentedPage as? MuzoiGlamShowingWeb)?.pausePurchaseFeedback()
        overlay.begin(showLaunch: !hasRevealedPage && !startsAtRegistration,
                      over: captureCurrentPage ? presentedPage?.viewIfLoaded : nil)
    }
    func hideOverlay() {
        hasRevealedPage = true
        overlay.reveal(over: presentedPage?.viewIfLoaded)
    }
}
