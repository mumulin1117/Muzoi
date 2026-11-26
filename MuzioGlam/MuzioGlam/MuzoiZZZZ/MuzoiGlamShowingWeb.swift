import UIKit
import WebKit
import SafariServices
import AVFoundation

@MainActor
final class MuzoiGlamShowingMessageProxy: NSObject, WKScriptMessageHandler {
    private let deliver: (WKScriptMessage) -> Void

    init(_ deliver: @escaping (WKScriptMessage) -> Void) { self.deliver = deliver }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        deliver(message)
    }
}

@MainActor
final class MuzoiGlamShowingWeb: UIViewController, WKNavigationDelegate, WKUIDelegate {
    enum Purpose {
        case registration
        case remote(mayUseBusiness: Bool)
    }

    enum Event {
        case loading, loadStopped, ready, logout
        case confirmed(MuzoiGlamShowingPage)
        case legacyPurchase(String), openLink(URL)
        case registered(URL, MuzoiGlamShowingAccount?, MuzoiGlamOpenReply?)
    }

    private static let identityWorld = WKContentWorld.world(name: "MuzoiGlamRegistrationIdentity")
    private static let businessWebsiteDataID = UUID(uuidString: "7E07E611-5849-4BA3-83C8-83FDCD8BB309")!
    private let purpose: Purpose
    private let onEvent: (Event) -> Void
    private let document: URL
    private var handlers: Set<String> = []
    private var registrationBottom: NSLayoutConstraint?
    private var keyboardObservers: [NSObjectProtocol] = []
    private var navigation: WKNavigation?
    private var ready = false
    private var closed = false
    private var submitted = false
    private var loadID = UUID()
    private var navigationReadyTask: Task<Void, Never>?
    private var queued: [[String: Any]] = []
    private var sentBusinessReadiness: MuzoiGlamBusinessReadiness?
    private var businessDocumentID: String?
    private var purchaseProgress: (order: String, notice: MuzoiGlamPurchaseNotice)?
    private var purchaseProgressTimeout: Task<Void, Never>?
    private var purchaseNotice: (order: String, notice: MuzoiGlamPurchaseNotice, failed: Bool)?
    private var purchaseFeedbackView: MuzoiGlamPurchaseFeedbackView?
    private var purchaseResultDialog: MatteAccentMuzNoticeMatteTextureMuz?
    private var purchaseResultDismissal: Task<Void, Never>?
    private var purchaseInputBlocked = false
    private lazy var web = makeWebView()

    private static let businessMediaGestureScript = """
        (() => {
          let lastActivation = -Infinity;
          const activate = event => {
            if (event.isTrusted) lastActivation = performance.now();
          };
          addEventListener('pointerup', activate, { capture: true, passive: true });
          addEventListener('click', activate, { capture: true, passive: true });
          addEventListener('keydown', event => {
            if ((event.key === 'Enter' || event.key === ' ') && !event.repeat) activate(event);
          }, true);
          globalThis.muzoiGlamCanPromptForMedia = () => performance.now() - lastActivation <= 10000;
        })();
        """

    var canAcceptBusinessActions: Bool {
        guard ready, !closed, !isOnboardingDocument, viewIfLoaded?.window != nil,
              presentedViewController == nil else { return false }
        return !isRemoteBusiness || businessDocumentID != nil
    }
    var currentAddress: URL { document }
    var isRegistration: Bool {
        if case .registration = purpose { return true }
        return false
    }
    var usesBusinessWebsiteData: Bool {
        if case .remote(true) = purpose { return true }
        return false
    }
    private(set) var isRemoteBusiness = false
    private(set) var isOnboardingDocument = false
    var canStartBusiness: Bool { ready && !closed && !isOnboardingDocument && businessDocumentID != nil }

    func enableBusiness() {
        isRemoteBusiness = true
        applyBusinessSafeArea()
    }

    init(document: URL, purpose: Purpose, onEvent: @escaping (Event) -> Void) {
        self.document = document
        self.purpose = purpose
        self.onEvent = onEvent
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MuzoiGlamLoadingOverlay.background
        view.addSubview(web)
        NSLayoutConstraint.activate([
            web.topAnchor.constraint(equalTo: view.topAnchor), registrationBottomConstraint(),
            web.leadingAnchor.constraint(equalTo: view.leadingAnchor), web.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
//        if case .registration = purpose {
//            for name in [UIResponder.keyboardWillShowNotification, UIResponder.keyboardWillHideNotification, UIResponder.keyboardWillChangeFrameNotification] {
//                keyboardObservers.append(NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { [weak self] note in
//                    MainActor.assumeIsolated { self?.adjustRegistrationKeyboard(note) }
//                })
//            }
//        }
        load()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resumePurchaseFeedback()
    }

    private func registrationBottomConstraint() -> NSLayoutConstraint {
        if case .registration = purpose {
            let bottom = web.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            registrationBottom = bottom
            return bottom
        }
        return web.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }

//    private func adjustRegistrationKeyboard(_ notification: Notification) {
//        guard let bottom = registrationBottom, let window = view.window else { return }
//        let info = notification.userInfo ?? [:]
//        let hidden = notification.name == UIResponder.keyboardWillHideNotification
//        let screenFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
//        let frame = view.convert(window.convert(screenFrame, from: window.screen.coordinateSpace), from: window)
//        let overlap = hidden || !frame.intersects(view.bounds) ? 0 : max(0, view.bounds.maxY - frame.minY)
//        bottom.constant = -overlap
//        let duration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
//        let curve = (info[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt) ?? 7
//        UIView.animate(withDuration: duration, delay: 0, options: [UIView.AnimationOptions(rawValue: curve << 16), .beginFromCurrentState]) {
//            self.view.layoutIfNeeded()
//        }
//    }

    private func makeWebView() -> WKWebView {
        let configuration = WKWebViewConfiguration()
        if usesBusinessWebsiteData, #available(iOS 17.0, *) {
            configuration.websiteDataStore = WKWebsiteDataStore(forIdentifier: Self.businessWebsiteDataID)
        } else {
            configuration.websiteDataStore = .nonPersistent()
        }
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        let controller = configuration.userContentController
        switch purpose {
        case .registration:
            handlers = ["openUrl"]
            let compactForm = """
                (() => {
                  const style = document.createElement('style');
                  style.textContent = `
                    @media (max-height: 420px) {
                      html[data-muzoi-entry-form] .app-page__header { padding-top: max(env(safe-area-inset-top), 4px); padding-bottom: 4px; }
                      html[data-muzoi-entry-form] .back-button { width: 44px; height: 44px; }
                      html[data-muzoi-entry-form] .footer-actions { padding: 1px 16px; gap: 2px; }
                      html[data-muzoi-entry-form] .app-button { min-height: 44px; padding: 10px 16px; font-size: 16px; }
                      html[data-muzoi-entry-form] .legal-links { margin: 0; font-size: 12px; line-height: 1.2; }
                      html[data-muzoi-entry-form] .page-body { padding-top: 12px; padding-bottom: 12px; }
                      html[data-muzoi-entry-form] .page-body h1 { font-size: 28px; line-height: 1.2; }
                      html[data-muzoi-entry-form] .auth-form { margin-top: 16px; gap: 12px; }
                      html[data-muzoi-entry-form] .auth-field__surface { padding-top: 10px; padding-bottom: 10px; font-size: 16px; line-height: 22px; }
                      html[data-muzoi-entry-form] .switch-auth { margin-top: 12px; font-size: 13px; line-height: 1.5; }
                    }`;
                  document.head.appendChild(style);
                  const mark = () => {
                    const route = location.hash.slice(1).split('?')[0];
                    if (route === '/login' || route === '/register/nickname') document.documentElement.dataset.muzoiEntryForm = '';
                    else delete document.documentElement.dataset.muzoiEntryForm;
                  };
                  mark(); addEventListener('hashchange', mark);
                })();
                """
            controller.addUserScript(WKUserScript(source: compactForm, injectionTime: .atDocumentEnd, forMainFrameOnly: true))
            let dismissKeyboard = """
                document.addEventListener('click', event => {
                    if (!event.target.closest('input, textarea, select, [contenteditable], button, a, label')) {
                        const active = document.activeElement;
                        if (active?.matches('input, textarea, [contenteditable]')) active.blur();
                    }
                });
                """
            controller.addUserScript(WKUserScript(source: dismissKeyboard, injectionTime: .atDocumentStart, forMainFrameOnly: true))
            controller.addUserScript(WKUserScript(source: MuzoiGlamShowingAccount.observingHandoff,
                                                   injectionTime: .atDocumentStart, forMainFrameOnly: true))
            controller.addUserScript(WKUserScript(source: MuzoiGlamShowingAccount.observingSubmittedIdentity,
                                                   injectionTime: .atDocumentStart, forMainFrameOnly: true,
                                                   in: Self.identityWorld))
        case .remote(let mayUseBusiness):
            handlers = ["muzoiGlamSignOut", "refractiveBeautyJournal", "holographicStyleArchive"]
            handlers.formUnion(MuzoiGlamShowingPage.allCases.map(\.handler))
            // 兼容已部署的旧欢迎页，跳转仍由按钮消息触发。
            let directWelcome = """
                (() => {
                  if (document.body?.dataset.muzoiPage !== 'welcome') return;
                  const dialog = document.getElementById('muzoi-eula');
                  const button = document.getElementById('muzoi-start');
                  if (!dialog || !button) return;
                  if (dialog.open) dialog.close();
                  dialog.remove();
                  button.addEventListener('click', event => {
                    const bridge = window.MuzoiGlamBridge;
                    if (!bridge || bridge.isLocked()) return;
                    event.stopImmediatePropagation();
                    bridge.activate(button);
                  }, true);
                })();
                """
            controller.addUserScript(WKUserScript(source: directWelcome, injectionTime: .atDocumentEnd, forMainFrameOnly: true))
            if mayUseBusiness {
                handlers.formUnion(["biomechanicalMakeupRenderer", "kineticMakeupAnimation"])
                let mapping = MuzoiGlamBusinessConfiguration.profile.incoming
                // 配置中的退出消息可能与旧网页使用同一个名称，WebKit 只允许注册一次。
                for name in [mapping.directCloseHandler, mapping.closeAction] where !name.isEmpty {
                    handlers.insert(name)
                }
                configuration.preferences.javaScriptCanOpenWindowsAutomatically = false
                controller.addUserScript(WKUserScript(source: Self.businessMediaGestureScript, injectionTime: .atDocumentStart,
                                                      forMainFrameOnly: true, in: .defaultClient))
            }
            let state = """
            (() => {
              const documentID = crypto.getRandomValues(new Uint32Array(4)).join('-');
              let onboarding = false;
              window.addEventListener('muzoi:ready', ({detail}) => {
                if (detail?.page === 'welcome' || detail?.page === 'rules') onboarding = true;
              });
              let current = Object.freeze({
                event: 'muzoiGlamBusinessState', version: 1, business: false,
                subscribed: false, purchaseEnabled: false, reason: '\(mayUseBusiness ? "pageLoading" : "notBusiness")'
              });
              Object.defineProperty(window, 'MuzoiGlamBusinessDocumentID', { value: documentID });
              Object.defineProperty(window, 'MuzoiGlamOnboardingDocument', { get: () => onboarding });
              Object.defineProperty(window, 'MuzoiGlamBusinessState', { get: () => current });
              window.addEventListener('message', ({data, source}) => {
                if (source === null && data?.event === 'muzoiGlamBusinessState' && data.version === 1) {
                  current = Object.freeze({...data});
                }
              });
            })();
            """
            controller.addUserScript(WKUserScript(source: state, injectionTime: .atDocumentStart, forMainFrameOnly: true))
        }
        let proxy = MuzoiGlamShowingMessageProxy { [weak self] in self?.read($0) }
        for name in handlers {
            controller.add(proxy, name: name)
        }

        let view = WKWebView(frame: .zero, configuration: configuration)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.navigationDelegate = self
        view.uiDelegate = self
        view.isOpaque = false
        view.backgroundColor = .clear
        view.scrollView.backgroundColor = .clear
        view.scrollView.contentInsetAdjustmentBehavior = .never
        view.scrollView.keyboardDismissMode = .interactive
        view.allowsBackForwardNavigationGestures = true
        view.allowsLinkPreview = false
        return view
    }

    private func load() {
        guard !closed else { return }
        let url = document
        ready = false
        submitted = false
        resetNavigationState()
        if case .registration = purpose, url.isFileURL,
           let entry = MuzoiGlamShowingIdentity.registrationEntry,
           MuzoiGlamShowingURL.sameDocument(url, entry) {
            navigation = web.loadFileURL(url, allowingReadAccessTo: entry.deletingLastPathComponent())
            return
        }
        guard MuzoiGlamShowingURL.https(url.absoluteString) != nil else { return }
        navigation = web.load(URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20))
    }

    private func resetNavigationState() {
        loadID = UUID()
        clearPurchaseFeedback()
        navigationReadyTask?.cancel()
        navigationReadyTask = nil
        queued.removeAll()
        sentBusinessReadiness = nil
        businessDocumentID = nil
        isOnboardingDocument = false
    }

    func close() {
        guard !closed else { return }
        stopCapture()
        if presentedViewController is SFSafariViewController { dismiss(animated: false) }
        clearPurchaseFeedback()
        closed = true
        keyboardObservers.forEach(NotificationCenter.default.removeObserver)
        keyboardObservers.removeAll()
        navigationReadyTask?.cancel()
        queued.removeAll()
        if isViewLoaded {
            handlers.forEach { web.configuration.userContentController.removeScriptMessageHandler(forName: $0) }
            web.configuration.userContentController.removeAllUserScripts()
            web.stopLoading()
            web.navigationDelegate = nil
            web.uiDelegate = nil
        }
    }

    func clearBusinessWebsiteSession() async {
        guard usesBusinessWebsiteData, isViewLoaded else { return }
        let store = web.configuration.websiteDataStore
        close()
        if store.isPersistent {
            await store.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: .distantPast)
        }
    }

    private func accepts(_ url: URL) -> Bool {
        switch purpose {
        case .registration: return MuzoiGlamShowingURL.sameDocument(document, url)
        case .remote: return MuzoiGlamShowingURL.sameOrigin(document, url)
        }
    }

    private func read(_ message: WKScriptMessage) {
        guard !closed, !submitted, message.frameInfo.isMainFrame, message.webView === web,
              let frame = message.frameInfo.request.url, let current = web.url,
              accepts(frame), accepts(current), handlers.contains(message.name) else { return }

        if case .remote = purpose,
           let page = MuzoiGlamShowingPage.confirmation(name: message.name, body: message.body) {
            guard !purchaseInputBlocked, MuzoiGlamShowingURL.sameDocument(frame, current) else { return }
            submitted = true
            onEvent(.confirmed(page))
            return
        }
        guard ready else { return }

        switch purpose {
        case .registration:
            guard message.name == "openUrl", let address = MuzoiGlamShowingURL.https(message.body) else { return }
            submitted = true
            let submittedFrom = loadID
            web.callAsyncJavaScript("return window.muzoiGlamSubmittedIdentity?.() ?? null;",
                arguments: [:], in: message.frameInfo, in: Self.identityWorld) { [weak self] result in
                guard let self, !self.closed, self.loadID == submittedFrom,
                      let current = self.web.url, self.accepts(current) else { return }
                let fields = (try? result.get()) as? [String: String]
                let isRegistration = fields?["operation"] == "register"
                let account = isRegistration ? MuzoiGlamShowingAccount.registration(username: fields?["nickname"])
                    : MuzoiGlamShowingAccount(email: fields?["email"], password: fields?["password"])
                self.web.callAsyncJavaScript("return window.muzoiGlamRegistrationHandoff?.(address) ?? null;",
                    arguments: ["address": address.absoluteString], in: message.frameInfo, in: .page) { [weak self] capture in
                    guard let self, !self.closed, self.loadID == submittedFrom else { return }
                    let reply = (try? capture.get()).flatMap { value -> MuzoiGlamOpenReply? in
                        guard JSONSerialization.isValidJSONObject(value),
                              let data = try? JSONSerialization.data(withJSONObject: value),
                              let reply = try? MuzoiGlamOpenReply(data: data),
                              MuzoiGlamShowingURL.sameDocument(reply.url, address) else { return nil }
                        return reply
                    }
                    self.onEvent(.registered(address, account, reply))
                }
            }
        case .remote:
            let business = isRemoteBusiness
            guard !isOnboardingDocument, purchaseProgress == nil, !business || businessDocumentID != nil else { return }
            if business, message.name == "kineticMakeupAnimation",
               let url = MuzoiGlamShowingURL.https(message.body) {
                onEvent(.openLink(url)); return
            }
            if business, message.name == "biomechanicalMakeupRenderer",
               let product = MuzoiGlamShowingURL.text(message.body), product.utf8.count <= 255 {
                onEvent(.legacyPurchase(product)); return
            }
            let logout = (message.body as? [String: String])?["action"] == "logout"
                || message.name == "refractiveBeautyJournal" || message.name == "holographicStyleArchive"
            let directClose = business && message.name == MuzoiGlamBusinessConfiguration.profile.incoming.directCloseHandler
            guard logout || directClose else { return }
            submitted = true
            onEvent(.logout)
        }
    }

    func purchaseUnavailable() {
        queuePurchaseNotice(.verificationUnavailable, order: "", failed: true)
    }

    func deliverBusinessMessage(_ payload: [String: Any]) {
        dispatchBusinessMessage(payload, isPurchaseResult: false)
    }

    func updatePurchaseProgress(order: String, phase: MuzoiGlamPurchasePhase) {
        guard ready, !closed, isRemoteBusiness else { return }
        if phase == .finished {
            if purchaseProgress?.order == order { clearPurchaseProgress() }
            if purchaseNotice?.order == order, purchaseNotice?.notice == .waitingForUpdate {
                purchaseNotice = nil
                removePurchaseResultView()
            }
            resumePurchaseFeedback()
            return
        }
        let notice: MuzoiGlamPurchaseNotice = phase == .submitting ? .loading : .verifying
        guard purchaseProgress?.order != order || purchaseProgress?.notice != notice else { return }
        clearPurchaseProgress()
        if phase == .submitting || purchaseNotice?.order == order {
            purchaseNotice = nil
        }
        purchaseProgress = (order, notice)
        purchaseProgressTimeout = Task { [weak self] in
            try? await Task.sleep(nanoseconds: 60_000_000_000)
            guard !Task.isCancelled, let self else { return }
            self.clearPurchaseProgress()
            self.queuePurchaseNotice(.waitingForUpdate, order: order)
        }
        resumePurchaseFeedback()
    }

    func deliverPurchaseResult(_ payload: [String: Any], notice: MuzoiGlamPurchaseNotice? = nil) {
        guard ready, !closed, isRemoteBusiness else { return }
        dispatchBusinessMessage(payload, isPurchaseResult: true)

        let mapping = MuzoiGlamBusinessConfiguration.profile.outgoing
        guard let status = payload[mapping.status] as? String else { return }
        let order = payload[mapping.orderID] as? String ?? ""
        if status == "cancelled" {
            if purchaseProgress?.order == order { clearPurchaseProgress() }
            if purchaseNotice?.order == order {
                purchaseNotice = nil
                removePurchaseResultView()
            }
            resumePurchaseFeedback()
            return
        }
        let reason = payload[mapping.reason] as? String
        guard let feedback = notice ?? MuzoiGlamPurchaseNotice.result(status: status, reason: reason) else { return }
        if purchaseProgress?.order == order, status != "pending" || purchaseProgress?.notice == .verifying {
            clearPurchaseProgress()
        }
        queuePurchaseNotice(feedback, order: order, failed: status == "failed")
    }

    private func dispatchBusinessMessage(_ payload: [String: Any], isPurchaseResult: Bool) {
        guard !closed, isRemoteBusiness, JSONSerialization.isValidJSONObject(payload) else { return }
        if !ready {
            if queued.count == 64 { queued.removeFirst() }
            queued.append(payload)
            return
        }
        guard let businessDocumentID, let location = web.url, accepts(location) else { return }
        let callback = MuzoiGlamBusinessConfiguration.profile.outgoing
        let isOpenResult = payload[callback.event] as? String == callback.openEvent
        let script = isOpenResult
            ? "new CustomEvent(name, { detail: payload })"
            : "new MessageEvent('message', { data: payload })"
        web.callAsyncJavaScript("""
            if (window.MuzoiGlamBusinessDocumentID !== documentID) return false;
            window.dispatchEvent(\(script));
            return true;
            """,
                                arguments: ["payload": payload, "name": callback.openEvent, "documentID": businessDocumentID],
                                in: nil, in: .page) { result in
            guard isPurchaseResult else { return }
            let dispatched = ((try? result.get()) as? Bool) == true
            MuzoiGlamBusinessDiagnostic.record(dispatched ? "purchaseResultDispatched" : "purchaseResultDispatchFailed")
        }
    }

    private func queuePurchaseNotice(_ notice: MuzoiGlamPurchaseNotice, order: String, failed: Bool = false) {
        if purchaseNotice?.order != order || purchaseNotice?.notice != notice || purchaseNotice?.failed != failed {
            removePurchaseResultView()
            purchaseNotice = (order, notice, failed)
        }
        resumePurchaseFeedback()
    }

    func resumePurchaseFeedback() {
        guard ready, !closed, isRemoteBusiness else { return }
        setPurchaseInputBlocked(purchaseProgress != nil)
        guard UIApplication.shared.applicationState == .active, viewIfLoaded?.window != nil else { return }

        if let progress = purchaseProgress {
            removePurchaseResultView()
            if purchaseFeedbackView == nil {
                let feedback = MuzoiGlamPurchaseFeedbackView()
                feedback.present(over: view)
                purchaseFeedbackView = feedback
            }
            purchaseFeedbackView?.updateAccessibilityLabel(progress.notice.text)
            return
        }

        purchaseFeedbackView?.removeFromSuperview()
        purchaseFeedbackView = nil
        guard let result = purchaseNotice, presentedViewController == nil,
              purchaseResultDialog == nil, !isBeingDismissed else { return }
        let icon: (String, UIColor)
        if result.failed {
            icon = ("xmark.circle.fill", UIColor(red: 1, green: 0.60, blue: 0.72, alpha: 1))
        } else if result.notice == .confirmed {
            icon = ("checkmark.circle.fill", UIColor(red: 0.60, green: 0.92, blue: 0.78, alpha: 1))
        } else {
            icon = ("clock", UIColor(red: 0.94, green: 0.73, blue: 0.92, alpha: 1))
        }
        let dialog = MatteAccentMuzNoticeMatteTextureMuz(
            stippleAzuriteIrisMoireUmberBrushworkContourCantata: result.failed ? MuzoiGlamNativePurchaseFeedback.unableToContinue : result.notice.text,
            timbreTopazParchmentCrescentTourmalineBloom: result.failed ? result.notice.text : "",
            umberEmbossingAndanteVermilionGraphitewash: [],
            resultIcon: icon)
        addChild(dialog)
        let noticeView = dialog.view!
        noticeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noticeView)
        NSLayoutConstraint.activate([
            noticeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noticeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noticeView.topAnchor.constraint(equalTo: view.topAnchor),
            noticeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        dialog.didMove(toParent: self)
        purchaseResultDialog = dialog
        UIAccessibility.post(notification: .announcement, argument: result.notice.text)
        // 旧提示的计时器不会关闭后续订单的新提示。
        purchaseResultDismissal = Task { [weak self, weak dialog] in
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            guard !Task.isCancelled, let self, let dialog, self.purchaseResultDialog === dialog else { return }
            self.purchaseNotice = nil
            self.removePurchaseResultView()
        }
        MuzoiGlamBusinessDiagnostic.record("purchaseNoticeShown")
    }

    func pausePurchaseFeedback() {
        // 离开前台时移除动画，等订单结果出来再解除网页锁定。
        purchaseFeedbackView?.removeFromSuperview()
        purchaseFeedbackView = nil
        if purchaseResultDialog != nil {
            purchaseNotice = nil
            removePurchaseResultView()
        }
    }

    private func removePurchaseResultView() {
        purchaseResultDismissal?.cancel()
        purchaseResultDismissal = nil
        guard let dialog = purchaseResultDialog else { return }
        dialog.willMove(toParent: nil)
        dialog.view.removeFromSuperview()
        dialog.removeFromParent()
        purchaseResultDialog = nil
    }

    private func clearPurchaseFeedback() {
        clearPurchaseProgress()
        purchaseNotice = nil
        pausePurchaseFeedback()
        setPurchaseInputBlocked(false)
    }

    private func clearPurchaseProgress() {
        purchaseProgressTimeout?.cancel()
        purchaseProgressTimeout = nil
        purchaseProgress = nil
    }

    private func setPurchaseInputBlocked(_ blocked: Bool) {
        guard purchaseInputBlocked != blocked else { return }
        purchaseInputBlocked = blocked
        if blocked { web.endEditing(true) }
        web.isUserInteractionEnabled = !blocked
        web.scrollView.isScrollEnabled = !blocked
        web.accessibilityElementsHidden = blocked
    }

    func deliverBusinessReadiness(_ state: MuzoiGlamBusinessReadiness) {
        guard case .remote = purpose, ready, !closed, sentBusinessReadiness != state,
              let businessDocumentID, let location = web.url, accepts(location) else { return }
        sentBusinessReadiness = state
        let script = """
            if (window.MuzoiGlamBusinessDocumentID !== documentID) return false;
            window.dispatchEvent(new MessageEvent('message', { data: payload }));
            return true;
            """
        web.callAsyncJavaScript(script, arguments: ["payload": state.bridgePayload, "documentID": businessDocumentID],
                                in: nil, in: .page) { [weak self] result in
            guard let self, self.businessDocumentID == businessDocumentID, self.sentBusinessReadiness == state else { return }
            if ((try? result.get()) as? Bool) == true {
                MuzoiGlamBusinessDiagnostic.record("webState.\(state.reason.rawValue)")
            } else {
                self.sentBusinessReadiness = nil
                MuzoiGlamBusinessDiagnostic.record("webStateDispatchFailed")
            }
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                 decisionHandler: @escaping @MainActor (WKNavigationActionPolicy) -> Void) {
        guard !closed, let url = action.request.url else { return decisionHandler(.cancel) }
        if action.targetFrame?.isMainFrame == false { return decisionHandler(.allow) }
        if isRemoteBusiness {
            if purchaseInputBlocked && action.navigationType == .linkActivated {
                return decisionHandler(.cancel)
            }
            if action.targetFrame == nil {
                return decisionHandler(trustedBusinessLink(action) && MuzoiGlamShowingURL.businessLink(url.absoluteString) != nil ? .allow : .cancel)
            }
            if accepts(url) && !action.shouldPerformDownload { return decisionHandler(.allow) }
            decisionHandler(.cancel)
            if action.navigationType == .linkActivated, trustedBusinessLink(action) { openBusinessLink(url.absoluteString) }
            return
        }
        if action.targetFrame != nil, accepts(url) { return decisionHandler(.allow) }
        decisionHandler(.cancel)
        guard action.navigationType == .linkActivated, MuzoiGlamShowingURL.https(url.absoluteString) != nil else { return }
        if accepts(url) { web.load(action.request) }
        else { UIApplication.shared.open(url) }
    }

    private func trustedBusinessLink(_ action: WKNavigationAction) -> Bool {
        guard canAcceptBusinessActions, !purchaseInputBlocked, action.sourceFrame.isMainFrame,
              let source = action.sourceFrame.request.url, let current = web.url else { return false }
        return accepts(source) && accepts(current)
    }

    func openBusinessLink(_ value: Any?, completion: (@MainActor @Sendable (Bool) -> Void)? = nil) {
        guard isRemoteBusiness, canAcceptBusinessActions, !purchaseInputBlocked,
              let target = MuzoiGlamShowingURL.businessLink(value) else {
            completion?(false)
            return
        }
        if target.scheme?.lowercased() == "https" {
            stopCapture()
            let browser = SFSafariViewController(url: target)
            browser.preferredBarTintColor = MuzoiGlamLoadingOverlay.background
            browser.preferredControlTintColor = UIColor(red: 250/255, green: 190/255, blue: 226/255, alpha: 1)
            present(browser, animated: true) { completion?(true) }
        } else {
            UIApplication.shared.open(target, completionHandler: completion)
        }
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for action: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        guard isRemoteBusiness, action.targetFrame == nil, trustedBusinessLink(action),
              let url = action.request.url else { return nil }
        if accepts(url) && !action.shouldPerformDownload { web.load(action.request) }
        else { openBusinessLink(url.absoluteString) }
        return nil
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard !closed, navigation === self.navigation, let url = webView.url, accepts(url) else { return }
        let load = loadID
        navigationReadyTask?.cancel()
        navigationReadyTask = Task { [weak self, weak webView] in
            guard let webView, let self else { return }
            guard !Task.isCancelled, !self.closed, self.loadID == load else { return }
            if case .remote = self.purpose {
                let state = try? await webView.callAsyncJavaScript("""
                    return {documentID: window.MuzoiGlamBusinessDocumentID,
                            onboarding: window.MuzoiGlamOnboardingDocument === true};
                    """, arguments: [:], in: nil, contentWorld: .page)
                guard !Task.isCancelled, !self.closed, self.loadID == load else { return }
                let document = state as? [String: Any]
                self.businessDocumentID = document?["documentID"] as? String
                self.isOnboardingDocument = document?["onboarding"] as? Bool == true
            }
            self.ready = true
            self.applyBusinessSafeArea()
            self.onEvent(.ready)
            let waiting = self.queued
            self.queued.removeAll()
            waiting.forEach(self.deliverBusinessMessage)
        }
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard !closed else { return }
        let wasReady = ready
        ready = false
        if wasReady { stopCapture() }
        if self.navigation !== navigation {
            self.navigation = navigation
            resetNavigationState()
        }
        if wasReady { onEvent(.loading) }
    }

    func webView(_ webView: WKWebView, decidePolicyFor response: WKNavigationResponse,
                 decisionHandler: @escaping @MainActor (WKNavigationResponsePolicy) -> Void) {
        if response.isForMainFrame, isRemoteBusiness, !response.canShowMIMEType {
            decisionHandler(.cancel)
            endNavigation()
            return
        }
        if response.isForMainFrame, let status = (response.response as? HTTPURLResponse)?.statusCode,
           !(200..<300).contains(status) {
            decisionHandler(.cancel)
            endNavigation()
        } else {
            decisionHandler(.allow)
        }
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if let navigation, navigation === self.navigation, (error as NSError).code != NSURLErrorCancelled {
            endNavigation()
        }
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.webView(webView, didFail: navigation, withError: error)
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) { endNavigation() }

    private func endNavigation() {
        guard !closed else { return }
        stopCapture()
        ready = false
        resetNavigationState()
        navigation = nil
        onEvent(.loadStopped)
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        applyBusinessSafeArea()
    }

    private func applyBusinessSafeArea() {
        guard isRemoteBusiness, ready, !closed, let businessDocumentID else { return }
        let insets = view.safeAreaInsets
        let script = """
            if (window.MuzoiGlamBusinessDocumentID === documentID) {
                for (const [edge, value] of Object.entries(insets)) {
                    document.documentElement.style.setProperty('--muzoiGlam-safe-area-' + edge, value + 'px');
                }
            }
            """
        web.callAsyncJavaScript(script, arguments: ["documentID": businessDocumentID,
            "insets": ["top": insets.top, "right": insets.right, "bottom": insets.bottom, "left": insets.left]],
            in: nil, in: .page, completionHandler: nil)
    }

    func stopCapture() {
        guard isViewLoaded else { return }
        web.setCameraCaptureState(.none, completionHandler: nil)
        web.setMicrophoneCaptureState(.none, completionHandler: nil)
    }

    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin,
                 initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType,
                 decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
}
