import UIKit
import WebKit



final class MuzoiGlamFacebookWebPortalController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    private var webView: WKWebView?
    private var pageLoadStartTime = Date().timeIntervalSince1970
    private var isQuickLoginEnabled = false
    private var hasRequestedNotificationAfterLoad = false
    private let initialURLString: String
    private let bridgeChannelNames = [
        MuzoiGlamFacebookBridgeConstants.purchaseBridgeChannel,
        MuzoiGlamFacebookBridgeConstants.logoutBridgeChannel,
        MuzoiGlamFacebookBridgeConstants.pageLoadedBridgeChannel,
        MuzoiGlamFacebookBridgeConstants.browserBridgeChannel
    ]

    init(urlString: String, quickLoginEnabled: Bool) {
        initialURLString = urlString
        isQuickLoginEnabled = quickLoginEnabled
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImageView()
       
        if isQuickLoginEnabled {
            addLoginButton()
        }
        configureWebView()
        MuzoiGlamFacebookBridgeIndicator.show(info: MuzoiGlamFacebookBridgeConstants.loadingTitle)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        registerBridgeChannels()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        unregisterBridgeChannels()
    }

    deinit {
        unregisterBridgeChannels()
    }

    private func addBackgroundImageView() {
        let imageView = UIImageView(image: UIImage(named: MuzoiGlamFacebookBridgeConfig.shared.mainBackgroundImage))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func addLoginButton() {
        let loginButton = UIButton(type: .custom)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
     
        loginButton.isUserInteractionEnabled = false

        let backgroundImage = UIImage(named: MuzoiGlamFacebookBridgeConfig.shared.loginButtonBackgroundImage)
        loginButton.setBackgroundImage(backgroundImage, for: .normal)
       

        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: MuzoiGlamFacebookBridgeConfig.shared.loginButtonWidth),
            loginButton.heightAnchor.constraint(equalToConstant: MuzoiGlamFacebookBridgeConfig.shared.loginButtonHeight),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55)
        ])
    }

   

    private func configureWebView() {
        let config = WKWebViewConfiguration()
        config.allowsAirPlayForMediaPlayback = false
        config.allowsInlineMediaPlayback = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        self.webView = webView

        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        if let url = URL(string: initialURLString) {
            webView.load(URLRequest(url: url))
            pageLoadStartTime = Date().timeIntervalSince1970
        }
    }

    private func registerBridgeChannels() {
        guard let controller = webView?.configuration.userContentController else { return }
        unregisterBridgeChannels()
        bridgeChannelNames.forEach { controller.add(self, name: $0) }
    }

    private func unregisterBridgeChannels() {
        guard let controller = webView?.configuration.userContentController else { return }
        bridgeChannelNames.forEach { controller.removeScriptMessageHandler(forName: $0) }
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if
            let url = navigationAction.request.url,
            let scheme = url.scheme?.lowercased(),
            !["http", "https", "file", "about"].contains(scheme)
        {
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != false {
            if let url = navigationAction.request.url {
                UIApplication.shared.open(url, options: [:])
            }
        }
        return nil
    }

    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView?.isHidden = false
        MuzoiGlamFacebookBridgeIndicator.dismiss()
        requestNotificationAfterWebLoadIfNeeded()

        if isQuickLoginEnabled {
            isQuickLoginEnabled = false
        }

        let parameters: [String: Any] = [
            MuzoiGlamFacebookBridgeConfig.shared.reportTimeParameterKey:
                "\(Int(Date().timeIntervalSince1970 * 1000 - pageLoadStartTime * 1000))"
        ]

        MuzoiGlamFacebookBridgeNetwork.shared.postRequest(
            MuzoiGlamFacebookBridgeConfig.shared.reportTimePath,
            parameters: parameters
        )
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == MuzoiGlamFacebookBridgeConstants.purchaseBridgeChannel,
           let payload = message.body as? [String: Any] {
            let productID = payload[MuzoiGlamFacebookBridgeConstants.batchNumberField] as? String ?? ""
            let orderCode = payload[MuzoiGlamFacebookBridgeConstants.orderCodeField] as? String ?? ""

            view.isUserInteractionEnabled = false
            MuzoiGlamFacebookBridgeIndicator.show(info: MuzoiGlamFacebookBridgeConstants.payingTitle)

            MuzoiGlamFacebookBridgePurchase.shared.startPurchase(productID: productID) { result in
                MuzoiGlamFacebookBridgeIndicator.dismiss()
                self.view.isUserInteractionEnabled = true

                switch result {
                case .success:
                    guard
                        let receiptData = MuzoiGlamFacebookBridgePurchase.shared.obtainLocalReceipt(),
                        let transactionID = MuzoiGlamFacebookBridgePurchase.shared.transactionID
                    else {
                        MuzoiGlamFacebookBridgeIndicator.showInfo(MuzoiGlamFacebookBridgeConstants.purchaseFailureTitle)
                        return
                    }

                    guard
                        let jsonData = try? JSONSerialization.data(
                            withJSONObject: [MuzoiGlamFacebookBridgeConstants.orderCodeField: orderCode],
                            options: [.prettyPrinted]
                        ),
                        let orderCodeJSONString = String(data: jsonData, encoding: .utf8)
                    else {
                        MuzoiGlamFacebookBridgeIndicator.showInfo(MuzoiGlamFacebookBridgeConstants.purchaseFailureTitle)
                        return
                    }

                    MuzoiGlamFacebookBridgeNetwork.shared.postRequest(
                        MuzoiGlamFacebookBridgeConfig.shared.verifyReceiptPath,
                        parameters: [
                            MuzoiGlamFacebookBridgeConfig.shared.verifyReceiptParameterKeys.payload: receiptData.base64EncodedString(),
                            MuzoiGlamFacebookBridgeConfig.shared.verifyReceiptParameterKeys.transactionID: transactionID,
                            MuzoiGlamFacebookBridgeConfig.shared.verifyReceiptParameterKeys.callbackResult: orderCodeJSONString
                        ],
                        isPaymentFlow: true
                    ) { result in
                        self.view.isUserInteractionEnabled = true
                        switch result {
                        case .success:
                        
                            MuzoiGlamFacebookBridgeIndicator.showSuccess(MuzoiGlamFacebookBridgeConstants.purchaseSuccessTitle)
                        case .failure:
                            MuzoiGlamFacebookBridgeIndicator.showInfo(MuzoiGlamFacebookBridgeConstants.purchaseFailureTitle)
                        }
                    }
                case .failure(let error):
                    self.view.isUserInteractionEnabled = true
                    MuzoiGlamFacebookBridgeIndicator.showInfo(error.localizedDescription)
                }
            }
            return
        }

        if message.name == MuzoiGlamFacebookBridgeConstants.logoutBridgeChannel {
            UserDefaults.standard.removeObject(forKey: MuzoiGlamFacebookBridgeConstants.userTokenKey)
            MuzoiGlamFacebookLaunchController.mainWindow?.rootViewController = MuzoiGlamFacebookLoginController()
            return
        }

        if message.name == MuzoiGlamFacebookBridgeConstants.pageLoadedBridgeChannel {
            webView?.isHidden = false
            MuzoiGlamFacebookBridgeIndicator.dismiss()
            requestNotificationAfterWebLoadIfNeeded()
        }

        if message.name == MuzoiGlamFacebookBridgeConstants.browserBridgeChannel,
           let body = message.body as? [String: Any],
           let urlString = body[MuzoiGlamFacebookBridgeConstants.browserURLField] as? String,
           let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:]) { [weak self] success in
                let state = success ? "success" : "failed"
                let js = """
                window.dispatchEvent(new CustomEvent('nativeOpenState', {
                    detail: { state: '\(state)', url: '\(url.absoluteString)' }
                }));
                """
                DispatchQueue.main.async {
                    self?.webView?.evaluateJavaScript(js)
                }
            }
        }
    }

    private func requestNotificationAfterWebLoadIfNeeded() {
        guard !hasRequestedNotificationAfterLoad else { return }
        hasRequestedNotificationAfterLoad = true
        MuzoiGlamFacebookBridgeSDK.shared.requestNotificationIfNeeded()
    }

 
}
