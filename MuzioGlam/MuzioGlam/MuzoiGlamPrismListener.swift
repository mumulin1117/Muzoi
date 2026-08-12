import UIKit
import WebKit
import StoreKit

private enum MuzoiGlamPrismChannel {
    static let glamCatalogRelay = MuzoiGlamVeil("bJisokmfeZc3hEa8nkimc8aglCMSa3kDebuPpFRZe5nfdie5rdeBrl")
    static let glamRouteRelay = MuzoiGlamVeil("kiibnte1tEidcpMZakkVeJuHp5AQnWiZm4aMt3iVoJnb")
    static let glambrowHighlightelay = MuzoiGlamVeil("hXoalBoSgDrDaEprhJimcTSutqyXloekAzrhcNhWiTvhej")
    static let glamSessionRelay = MuzoiGlamVeil("rdekf5rEa3cMtRiMvqeCBceUasumt4y5JZoSuWrenyaKlX")
    static let glamAll = [glamCatalogRelay, glamRouteRelay, glambrowHighlightelay, glamSessionRelay]
}

private enum MuzoiGlamPrismGlowKit {
    static let glamBackdrop = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
    static let glamIllumination = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
    static let glamUnlockScript = MuzoiGlamVeil("p5oAlgy2m0oGrDpPhBincQSYp2e9cXieaxlAELfNfbeScCthsiKTimt8(w)O")
    static let glamUnableTitle = MuzoiGlamVeil("U5nJakbgl9eS 2t6oS iCDoPnOt9idnVuPeL")
    static let glamActionOK = MuzoiGlamVeil("OzKV")
    static let glamInvalidRadiance = MuzoiGlamVeil("Tvh4ek As1e5lheYcJtNeIdz 8i0tSekmX 5ilsM duLncayvHabidlKaQbzlBe2.M")
    static let glamPaymentsRestricted = MuzoiGlamVeil("TsrQafnAsYaAc6tXiEovnhsx haMrjey trAeLsItZrhiacOtceldO todnI StwhviSsO hd3ervVizcleN.5")
    static let glambrowCarveg = MuzoiGlamVeil("TQhreW Us2eglveTcqt0eMdV CirtieZmv mcQoGualNdi NnEoptR Qboe9 xfaocuanHdx.E")
    static let glamfloralLook = MuzoiGlamVeil("TOh1ey PtMrSaJnxsPaOcEtmiKovnk rcKoQuElzdt 8nWoFtk NbSeg pcNoomqpUlCe0tme5dc.r")
    static let glamUnknownbrowHighlight = MuzoiGlamVeil("T2hVed dtTrnaDnOsZaCcutLiIo2n4 1r7eAthumrAnGeCd5 6aBne guNnQkHnioZwKnT 4sbtbaIt0e7.t")
    static let glambrowTail = [MuzoiGlamVeil("hJt4tSpR"), MuzoiGlamVeil("hatwtqp5st")]
    static let glamcolorDiffusion = MuzoiGlamVeil("xn7OkN9kmJ2sqg8jvS4UnK6ErC1htF51zW32pR02.YsdhLo0pb")
}

private struct MuzoiGlamRadianceTicket {
    let glamKey: String

    init?(glamParcel: Any) {
        guard let glamKey = glamParcel as? String else { return nil }
        guard !glamKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        self.glamKey = glamKey
    }
}

private final class MuzoiGlamPrismListener: NSObject, WKScriptMessageHandler {
    weak var glamCanvasKeeper: MuzoiGlamPrismPortalController?
    private lazy var glamSignalPipeline: (WKScriptMessage) -> Void = { [weak self] glamSignal in
        guard let glamCanvasKeeper = self?.glamCanvasKeeper else { return }
        glamCanvasKeeper.glamInterpretPrism(
            glamChannel: glamSignal.name,
            glamParcel: glamSignal.body
        )
    }

    init(glamCanvasKeeper: MuzoiGlamPrismPortalController) {
        self.glamCanvasKeeper = glamCanvasKeeper
    }

    func userContentController(
        _ glamChannelCenter: WKUserContentController,
        didReceive glamSignal: WKScriptMessage
    ) {
        glamSignalPipeline(glamSignal)
    }
}

final class MuzoiGlamPrismPortalController: UIViewController,
    WKNavigationDelegate,
    WKUIDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver {

    private let glamInitialTrail: String
    private let glamIlluminationBar = UIProgressView(progressViewStyle: .bar)
    private let glamOrbitSpinner = UIActivityIndicatorView(style: .large)
    private var glamIlluminationLink: NSKeyValueObservation?
    private var glamRadianceRequest: SKProductsRequest?
    private var glamRadianceKey: String?
    private var glamHasStoreObserver = false
    private lazy var glamPrismListener = MuzoiGlamPrismListener(glamCanvasKeeper: self)

    private lazy var glamPrismSurface: WKWebView = {
        let glamPrismRecipe = glamMixPrismRecipe()
        glamPrismRecipe.allowsInlineMediaPlayback = true
        glamPrismRecipe.mediaTypesRequiringUserActionForPlayback = []
        glamPrismRecipe.preferences.javaScriptCanOpenWindowsAutomatically = true

        let glamPrismSurface = WKWebView(frame: .zero, configuration: glamPrismRecipe)
        glamPrismSurface.translatesAutoresizingMaskIntoConstraints = false
        glamPrismSurface.backgroundColor = .clear
        glamPrismSurface.isOpaque = false
        glamPrismSurface.scrollView.showsVerticalScrollIndicator = false
        glamPrismSurface.navigationDelegate = self
        glamPrismSurface.uiDelegate = self
        return glamPrismSurface
    }()

    init(glamInitialTrail: String) {
        self.glamInitialTrail = glamInitialTrail
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }

    required init?(coder glamCoder: NSCoder) {
        fatalError(MuzoiGlamVeil("ipnsi1t0(gcroxdSejrc:R)v KhaaJsF inSoftZ hbbe1eknK ciDm1pulXe2mkeTnLt2ekd7"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        glamStagePrismTheater()
        glamTracePrismGlow()
        glamUnveilFirstPrismTrail()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    deinit {
        glamIlluminationLink?.invalidate()
        glamRadianceRequest?.cancel()
        glamDetachStoreObserver()
        glamUnhookPrismChannels()
    }

    private func glamMixPrismRecipe() -> WKWebViewConfiguration {
        let glamPrismRecipe = WKWebViewConfiguration()
        glamPrismRecipe.userContentController.glamAttachMuzoiChannels(glamPrismListener)
        return glamPrismRecipe
    }

    private func glamStagePrismTheater() {
        view.backgroundColor = MuzoiGlamPrismGlowKit.glamBackdrop
        glamTintPrismChrome()
        glamNestPrismChrome()
    }

    private func glamTintPrismChrome() {
        glamIlluminationBar.translatesAutoresizingMaskIntoConstraints = false
        glamIlluminationBar.progressTintColor = MuzoiGlamPrismGlowKit.glamIllumination
        glamIlluminationBar.trackTintColor = .clear
        glamOrbitSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamOrbitSpinner.color = .white
    }

    private func glamNestPrismChrome() {
        view.addSubview(glamPrismSurface)
        view.addSubview(glamIlluminationBar)
        view.addSubview(glamOrbitSpinner)
        glamPinPrismChrome()
    }

    private func glamPinPrismChrome() {
        NSLayoutConstraint.activate([
            glamPrismSurface.topAnchor.constraint(equalTo: view.topAnchor),
            glamPrismSurface.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamPrismSurface.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamPrismSurface.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            glamIlluminationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            glamIlluminationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glamIlluminationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glamIlluminationBar.heightAnchor.constraint(equalToConstant: 2),
            glamOrbitSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            glamOrbitSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func glamTracePrismGlow() {
        glamIlluminationLink = glamPrismSurface.observe(
            \.estimatedProgress,
            options: [.new]
        ) { [weak self] glamPrismSurface, _ in
            DispatchQueue.main.async {
                guard let self else { return }
                let glamGlowFraction = Float(glamPrismSurface.estimatedProgress)
                self.glamIlluminationBar.setProgress(glamGlowFraction, animated: true)
                self.glamDimPrismOrbit(when: glamGlowFraction >= 1)
            }
        }
    }

    private func glamUnveilFirstPrismTrail() {
        guard let glamTrail = URL(string: glamInitialTrail) else { return }
        glamSetPrismLoading(true)
        glamPrismSurface.load(URLRequest(url: glamTrail))
    }

    fileprivate func glamInterpretPrism(glamChannel: String, glamParcel: Any) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch glamChannel {
            case MuzoiGlamPrismChannel.glamCatalogRelay:
                self.glamBeginRadianceUnlock(glamParcel)
            case MuzoiGlamPrismChannel.glamRouteRelay:
                self.glamOpenNestedCanvas(glamParcel)
            case MuzoiGlamPrismChannel.glambrowHighlightelay:
                self.glamDismissCanvas()
            case MuzoiGlamPrismChannel.glamSessionRelay:

                (UIApplication.shared.delegate as? AppDelegate)?.glamShowGatewayCanvas()

            default:
                break
            }
        }
    }

    private func glamBeginRadianceUnlock(_ glamParcel: Any) {
        guard glamRadianceKey == nil else { return }
        guard let glamTicket = MuzoiGlamRadianceTicket(glamParcel: glamParcel) else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamPrismGlowKit.glamInvalidRadiance
            )
            return
        }

        guard SKPaymentQueue.canMakePayments() else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamPrismGlowKit.glamPaymentsRestricted
            )
            return
        }

        glamSearchRadianceShelf(glamTicket.glamKey)
    }

    private func glamSearchRadianceShelf(_ glamChosenRadianceKey: String) {
        glamRadianceRequest?.cancel()
        glamRadianceKey = glamChosenRadianceKey
        view.isUserInteractionEnabled = false
        glamOrbitSpinner.startAnimating()
        glamAttachStoreObserver()

        let glamStoreInquiry = SKProductsRequest(productIdentifiers: Set([glamChosenRadianceKey]))
        glamStoreInquiry.delegate = self
        glamRadianceRequest = glamStoreInquiry
        glamStoreInquiry.start()
    }

    private func glamAttachStoreObserver() {
        guard !glamHasStoreObserver else { return }
        SKPaymentQueue.default().add(self)
        glamHasStoreObserver = true
    }

    private func glamDetachStoreObserver() {
        guard glamHasStoreObserver else { return }
        SKPaymentQueue.default().remove(self)
        glamHasStoreObserver = false
    }

    private func glamFinishRadianceUnlock(
        glamDidUnlock: Bool,
        glamDetourCaption: String? = nil
    ) {
        glamRadianceRequest = nil
        glamRadianceKey = nil
        glamDetachStoreObserver()
        view.isUserInteractionEnabled = true
        glamOrbitSpinner.stopAnimating()

        if glamDidUnlock {
            glamPrismSurface.evaluateJavaScript(MuzoiGlamPrismGlowKit.glamUnlockScript, completionHandler: nil)
            return
        }

        guard let glamDetourCaption else { return }

        let glamAlert = UIAlertController(
            title: MuzoiGlamPrismGlowKit.glamUnableTitle,
            message: glamDetourCaption,
            preferredStyle: .alert
        )
        glamAlert.addAction(UIAlertAction(title: MuzoiGlamPrismGlowKit.glamActionOK, style: .default))
        present(glamAlert, animated: true)
    }

    func productsRequest(_ glamStoreInquiry: SKProductsRequest, didReceive glamStoreReply: SKProductsResponse) {
        guard
            let glamChosenRadianceKey = glamRadianceKey,
            let glamRadianceItem = glamStoreReply.glamMuzoiRadianceItem(matching: glamChosenRadianceKey)
        else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamPrismGlowKit.glambrowCarveg
            )
            return
        }

        let glamStoreOrder = SKPayment(product: glamRadianceItem)
        SKPaymentQueue.default().add(glamStoreOrder)
    }

    func request(_ glamStoreInquiry: SKRequest, didFailWithError glamDetour: Error) {
        glamFinishRadianceUnlock(
            glamDidUnlock: false,
            glamDetourCaption: glamDetour.localizedDescription
        )
    }

    func paymentQueue(
        _ glamStoreQueue: SKPaymentQueue,
        updatedTransactions glamStoreEntries: [SKPaymentTransaction]
    ) {
        for glamStoreEntry in glamStoreEntries {
            glamReadRadianceLedger(glamStoreEntry, from: glamStoreQueue)
        }
    }

    private func glamReadRadianceLedger(
        _ glamStoreEntry: SKPaymentTransaction,
        from glamStoreQueue: SKPaymentQueue
    ) {
        guard glamStoreEntry.glamMatchesMuzoiRadiance(glamRadianceKey) else { return }

        switch glamStoreEntry.transactionState {
        case .purchased, .restored:
            glamStoreQueue.finishTransaction(glamStoreEntry)
            glamFinishRadianceUnlock(glamDidUnlock: true)
        case .failed:
            glamStoreQueue.finishTransaction(glamStoreEntry)
            glamResolveFailedRadiance(glamStoreEntry)
        case .deferred:
            view.isUserInteractionEnabled = true
            glamOrbitSpinner.stopAnimating()
        case .purchasing:
            break
        @unknown default:
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamPrismGlowKit.glamUnknownbrowHighlight
            )
        }
    }

    private func glamResolveFailedRadiance(_ glamStoreEntry: SKPaymentTransaction) {
        if let glamDetour = glamStoreEntry.error as? SKError, glamDetour.code == .paymentCancelled {
            glamFinishRadianceUnlock(glamDidUnlock: false)
            return
        }

        glamFinishRadianceUnlock(
            glamDidUnlock: false,
            glamDetourCaption: glamStoreEntry.error?.localizedDescription ?? MuzoiGlamPrismGlowKit.glamfloralLook
        )
    }

    private func glamOpenNestedCanvas(_ glamParcel: Any) {
        guard
            let glamTrail = glamParcel as? String,
            let glamCanvasHarbor = URL(string: glamTrail),
            glamCanvasHarbor.glamBelongsToMuzoiPrism
        else { return }

        navigationController?.pushViewController(
            MuzoiGlamPrismPortalController(glamInitialTrail: glamTrail),
            animated: true
        )
    }

    private func glamDismissCanvas() {
        if let glamPassage = navigationController, glamPassage.viewControllers.first !== self {
            glamPassage.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    func webView(_ glamPrismSurface: WKWebView, didFinish glamPassage: WKNavigation?) {
        glamSetPrismLoading(false)
    }

    func webView(
        _ glamPrismSurface: WKWebView,
        didFail glamPassage: WKNavigation?,
        withError glamDetour: Error
    ) {
        glamSetPrismLoading(false)
    }

    func webView(
        _ glamPrismSurface: WKWebView,
        didFailProvisionalNavigation glamPassage: WKNavigation?,
        withError glamDetour: Error
    ) {
        glamSetPrismLoading(false)
    }

    func webView(
        _ glamPrismSurface: WKWebView,
        createWebViewWith glamPrismRecipe: WKWebViewConfiguration,
        for glamPassageAction: WKNavigationAction,
        windowFeatures glamWindowTraits: WKWindowFeatures
    ) -> WKWebView? {
        if glamPassageAction.targetFrame == nil {
            glamPrismSurface.load(glamPassageAction.request)
        }
        return nil
    }

    private func glamSetPrismLoading(_ glamIsLoading: Bool) {
        glamIlluminationBar.isHidden = !glamIsLoading
        if glamIsLoading {
            glamOrbitSpinner.startAnimating()
        } else {
            glamOrbitSpinner.stopAnimating()
        }
    }

    private func glamDimPrismOrbit(when glamShouldDim: Bool) {
        glamIlluminationBar.isHidden = glamShouldDim
        if glamShouldDim {
            glamOrbitSpinner.stopAnimating()
        }
    }

    private func glamUnhookPrismChannels() {
        MuzoiGlamPrismChannel.glamAll.forEach {
            glamPrismSurface.configuration.userContentController.removeScriptMessageHandler(forName: $0)
        }
    }
}

private extension WKUserContentController {
    func glamAttachMuzoiChannels(_ glamListener: WKScriptMessageHandler) {
        MuzoiGlamPrismChannel.glamAll.forEach {
            add(glamListener, name: $0)
        }
    }
}

private extension SKProductsResponse {
    func glamMuzoiRadianceItem(matching glamChosenRadianceKey: String) -> SKProduct? {
        products.first { $0.productIdentifier == glamChosenRadianceKey }
    }
}

private extension SKPaymentTransaction {
    func glamMatchesMuzoiRadiance(_ glamRadianceKey: String?) -> Bool {
        guard let glamRadianceKey else { return false }
        return payment.productIdentifier == glamRadianceKey
    }
}

private extension URL {
    var glamBelongsToMuzoiPrism: Bool {
        let glamScheme = scheme?.lowercased() ?? ""
        return MuzoiGlamPrismGlowKit.glambrowTail.contains(glamScheme)
            && host == MuzoiGlamPrismGlowKit.glamcolorDiffusion
    }
}
