import UIKit
import WebKit
import StoreKit

private enum MuzoiGlamBridgeNode {
    static let glamCatalogRelay = "biomechanicalMakeupRenderer"
    static let glamRouteRelay = "kineticMakeupAnimation"
    static let glamCloseRelay = "holographicStyleArchive"
    static let glamSessionRelay = "refractiveBeautyJournal"
    static let glamAll = [glamCatalogRelay, glamRouteRelay, glamCloseRelay, glamSessionRelay]
}

private final class MuzoiGlamScriptRelay: NSObject, WKScriptMessageHandler {
    weak var glamRecipient: MuzoiGlamPortalController?

    init(glamRecipient: MuzoiGlamPortalController) {
        self.glamRecipient = glamRecipient
    }

    func userContentController(
        _ glamScriptCenter: WKUserContentController,
        didReceive glamEvent: WKScriptMessage
    ) {
        glamRecipient?.glamReceiveBridge(
            glamNode: glamEvent.name,
            glamPayload: glamEvent.body
        )
    }
}

final class MuzoiGlamPortalController: UIViewController,
    WKNavigationDelegate,
    WKUIDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver {

    private let glamEntryAddress: String
    private let glamProgress = UIProgressView(progressViewStyle: .bar)
    private let glamSpinner = UIActivityIndicatorView(style: .large)
    private var glamProgressObservation: NSKeyValueObservation?
    private var glamCatalogRequest: SKProductsRequest?
    private var glamActiveCatalogKey: String?
    private var glamIsObservingQueue = false
    private lazy var glamScriptRelay = MuzoiGlamScriptRelay(glamRecipient: self)

    private lazy var glamPortalStage: WKWebView = {
        let glamConfiguration = glamForgeConfiguration()
        glamConfiguration.allowsInlineMediaPlayback = true
        glamConfiguration.mediaTypesRequiringUserActionForPlayback = []
        glamConfiguration.preferences.javaScriptCanOpenWindowsAutomatically = true

        let glamStage = WKWebView(frame: .zero, configuration: glamConfiguration)
        glamStage.translatesAutoresizingMaskIntoConstraints = false
        glamStage.backgroundColor = .clear
        glamStage.isOpaque = false
        glamStage.scrollView.showsVerticalScrollIndicator = false
        glamStage.navigationDelegate = self
        glamStage.uiDelegate = self
        return glamStage
    }()

    init(glamEntryAddress: String) {
        self.glamEntryAddress = glamEntryAddress
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        glamBuildPortal()
        glamObserveProgress()
        glamLoadEntry()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    deinit {
        glamProgressObservation?.invalidate()
        glamCatalogRequest?.cancel()
        glamStopQueueObservation()
        MuzoiGlamBridgeNode.glamAll.forEach {
            glamPortalStage.configuration.userContentController.removeScriptMessageHandler(forName: $0)
        }
    }

    private func glamForgeConfiguration() -> WKWebViewConfiguration {
        let glamConfiguration = WKWebViewConfiguration()
        MuzoiGlamBridgeNode.glamAll.forEach {
            glamConfiguration.userContentController.add(glamScriptRelay, name: $0)
        }
        return glamConfiguration
    }

    private func glamBuildPortal() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamProgress.translatesAutoresizingMaskIntoConstraints = false
        glamProgress.progressTintColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
        glamProgress.trackTintColor = .clear
        glamSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamSpinner.color = .white

        view.addSubview(glamPortalStage)
        view.addSubview(glamProgress)
        view.addSubview(glamSpinner)

        NSLayoutConstraint.activate([
            glamPortalStage.topAnchor.constraint(equalTo: view.topAnchor),
            glamPortalStage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamPortalStage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamPortalStage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            glamProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamProgress.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamProgress.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamProgress.heightAnchor.constraint(equalToConstant: 2),
            glamSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            glamSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func glamObserveProgress() {
        glamProgressObservation = glamPortalStage.observe(
            \.estimatedProgress,
            options: [.new]
        ) { [weak self] glamStage, _ in
            DispatchQueue.main.async {
                guard let self else { return }
                let glamValue = Float(glamStage.estimatedProgress)
                self.glamProgress.setProgress(glamValue, animated: true)
                self.glamProgress.isHidden = glamValue >= 1
                if glamValue >= 1 {
                    self.glamSpinner.stopAnimating()
                }
            }
        }
    }

    private func glamLoadEntry() {
        guard let glamAddress = URL(string: glamEntryAddress) else { return }
        glamSpinner.startAnimating()
        glamProgress.isHidden = false
        glamPortalStage.load(URLRequest(url: glamAddress))
    }

    fileprivate func glamReceiveBridge(glamNode: String, glamPayload: Any) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch glamNode {
            case MuzoiGlamBridgeNode.glamCatalogRelay:
                self.glamBeginCatalogFlow(glamPayload)
            case MuzoiGlamBridgeNode.glamRouteRelay:
                self.glamOpenNestedPortal(glamPayload)
            case MuzoiGlamBridgeNode.glamCloseRelay:
                self.glamClosePortal()
            case MuzoiGlamBridgeNode.glamSessionRelay:
                (UIApplication.shared.delegate as? AppDelegate)?.glamShowAuthCanvas()
            default:
                break
            }
        }
    }

    private func glamBeginCatalogFlow(_ glamPayload: Any) {
        guard glamActiveCatalogKey == nil else { return }
        guard
            let glamCatalogKey = glamPayload as? String,
            !glamCatalogKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            glamCompleteCatalogFlow(
                glamShouldSignalSuccess: false,
                glamFaultText: "The selected item is unavailable."
            )
            return
        }

        guard SKPaymentQueue.canMakePayments() else {
            glamCompleteCatalogFlow(
                glamShouldSignalSuccess: false,
                glamFaultText: "Transactions are restricted on this device."
            )
            return
        }

        glamCatalogRequest?.cancel()
        glamActiveCatalogKey = glamCatalogKey
        view.isUserInteractionEnabled = false
        glamSpinner.startAnimating()
        glamStartQueueObservation()

        let glamRequest = SKProductsRequest(productIdentifiers: Set([glamCatalogKey]))
        glamRequest.delegate = self
        glamCatalogRequest = glamRequest
        glamRequest.start()
    }

    private func glamStartQueueObservation() {
        guard !glamIsObservingQueue else { return }
        SKPaymentQueue.default().add(self)
        glamIsObservingQueue = true
    }

    private func glamStopQueueObservation() {
        guard glamIsObservingQueue else { return }
        SKPaymentQueue.default().remove(self)
        glamIsObservingQueue = false
    }

    private func glamCompleteCatalogFlow(
        glamShouldSignalSuccess: Bool,
        glamFaultText: String? = nil
    ) {
        glamCatalogRequest = nil
        glamActiveCatalogKey = nil
        glamStopQueueObservation()
        view.isUserInteractionEnabled = true
        glamSpinner.stopAnimating()

        if glamShouldSignalSuccess {
            glamPortalStage.evaluateJavaScript("polymorphicSpecialEffectsKit()", completionHandler: nil)
            return
        }

        guard let glamFaultText else { return }

        let glamAlert = UIAlertController(
            title: "Unable to Continue",
            message: glamFaultText,
            preferredStyle: .alert
        )
        glamAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(glamAlert, animated: true)
    }

    func productsRequest(_ glamRequest: SKProductsRequest, didReceive glamResponse: SKProductsResponse) {
        guard
            let glamCatalogKey = glamActiveCatalogKey,
            let glamItem = glamResponse.products.first(where: { $0.productIdentifier == glamCatalogKey })
        else {
            glamCompleteCatalogFlow(
                glamShouldSignalSuccess: false,
                glamFaultText: "The selected item could not be found."
            )
            return
        }

        let glamOrder = SKPayment(product: glamItem)
        SKPaymentQueue.default().add(glamOrder)
    }

    func request(_ glamRequest: SKRequest, didFailWithError glamFault: Error) {
        glamCompleteCatalogFlow(
            glamShouldSignalSuccess: false,
            glamFaultText: glamFault.localizedDescription
        )
    }

    func paymentQueue(
        _ glamQueue: SKPaymentQueue,
        updatedTransactions glamTransactions: [SKPaymentTransaction]
    ) {
        for glamTransaction in glamTransactions {
            guard
                let glamCatalogKey = glamActiveCatalogKey,
                glamTransaction.payment.productIdentifier == glamCatalogKey
            else { continue }

            switch glamTransaction.transactionState {
            case .purchased:
                glamQueue.finishTransaction(glamTransaction)
                glamCompleteCatalogFlow(glamShouldSignalSuccess: true)
            case .failed:
                glamQueue.finishTransaction(glamTransaction)
                if let glamFault = glamTransaction.error as? SKError, glamFault.code == .paymentCancelled {
                    glamCompleteCatalogFlow(glamShouldSignalSuccess: false)
                } else {
                    glamCompleteCatalogFlow(
                        glamShouldSignalSuccess: false,
                        glamFaultText: glamTransaction.error?.localizedDescription ?? "The transaction could not be completed."
                    )
                }
            case .restored:
                glamQueue.finishTransaction(glamTransaction)
                glamCompleteCatalogFlow(glamShouldSignalSuccess: true)
            case .deferred:
                view.isUserInteractionEnabled = true
                glamSpinner.stopAnimating()
            case .purchasing:
                break
            @unknown default:
                glamCompleteCatalogFlow(
                    glamShouldSignalSuccess: false,
                    glamFaultText: "The transaction returned an unknown state."
                )
            }
        }
    }

    private func glamOpenNestedPortal(_ glamPayload: Any) {
        guard
            let glamAddress = glamPayload as? String,
            let glamDestination = URL(string: glamAddress),
            ["http", "https"].contains(glamDestination.scheme?.lowercased() ?? ""),
            glamDestination.host == "x7k9m2q8v4n6r1t5z3p0.shop"
        else { return }

        navigationController?.pushViewController(
            MuzoiGlamPortalController(glamEntryAddress: glamAddress),
            animated: true
        )
    }

    private func glamClosePortal() {
        if let glamNavigation = navigationController, glamNavigation.viewControllers.first !== self {
            glamNavigation.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    func webView(_ glamStage: WKWebView, didFinish glamNavigation: WKNavigation?) {
        glamSpinner.stopAnimating()
        glamProgress.isHidden = true
    }

    func webView(
        _ glamStage: WKWebView,
        didFail glamNavigation: WKNavigation?,
        withError glamFault: Error
    ) {
        glamSpinner.stopAnimating()
        glamProgress.isHidden = true
    }

    func webView(
        _ glamStage: WKWebView,
        didFailProvisionalNavigation glamNavigation: WKNavigation?,
        withError glamFault: Error
    ) {
        glamSpinner.stopAnimating()
        glamProgress.isHidden = true
    }

    func webView(
        _ glamStage: WKWebView,
        createWebViewWith glamConfiguration: WKWebViewConfiguration,
        for glamAction: WKNavigationAction,
        windowFeatures glamWindowFeatures: WKWindowFeatures
    ) -> WKWebView? {
        if glamAction.targetFrame == nil {
            glamStage.load(glamAction.request)
        }
        return nil
    }
}
