import UIKit
import WebKit
import StoreKit

private enum MuzoiGlamPrismChannel {
    static let glamCatalogRelay = MuzoiGlamVeil("bJisokmfeZc3hEa8nkimc8aglCMSa3kDebuPpFRZe5nfdie5rdeBrl")
    static let glamRouteRelay = MuzoiGlamVeil("kiibnte1tEidcpMZakkVeJuHp5AQnWiZm4aMt3iVoJnb")
    static let glamCloseRelay = MuzoiGlamVeil("hXoalBoSgDrDaEprhJimcTSutqyXloekAzrhcNhWiTvhej")
    static let glamSessionRelay = MuzoiGlamVeil("rdekf5rEa3cMtRiMvqeCBceUasumt4y5JZoSuWrenyaKlX")
    static let glamAll = [glamCatalogRelay, glamRouteRelay, glamCloseRelay, glamSessionRelay]
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
        MuzoiGlamPrismChannel.glamAll.forEach {
            glamPrismSurface.configuration.userContentController.removeScriptMessageHandler(forName: $0)
        }
    }

    private func glamMixPrismRecipe() -> WKWebViewConfiguration {
        let glamPrismRecipe = WKWebViewConfiguration()
        MuzoiGlamPrismChannel.glamAll.forEach {
            glamPrismRecipe.userContentController.add(glamPrismListener, name: $0)
        }
        return glamPrismRecipe
    }

    private func glamStagePrismTheater() {
        view.backgroundColor = UIColor(red: 12 / 255, green: 14 / 255, blue: 21 / 255, alpha: 1)
        glamIlluminationBar.translatesAutoresizingMaskIntoConstraints = false
        glamIlluminationBar.progressTintColor = UIColor(red: 239 / 255, green: 151 / 255, blue: 229 / 255, alpha: 1)
        glamIlluminationBar.trackTintColor = .clear
        glamOrbitSpinner.translatesAutoresizingMaskIntoConstraints = false
        glamOrbitSpinner.color = .white

        view.addSubview(glamPrismSurface)
        view.addSubview(glamIlluminationBar)
        view.addSubview(glamOrbitSpinner)

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
                self.glamIlluminationBar.isHidden = glamGlowFraction >= 1
                if glamGlowFraction >= 1 {
                    self.glamOrbitSpinner.stopAnimating()
                }
            }
        }
    }

    private func glamUnveilFirstPrismTrail() {
        guard let glamTrail = URL(string: glamInitialTrail) else { return }
        glamOrbitSpinner.startAnimating()
        glamIlluminationBar.isHidden = false
        print(MuzoiGlamVeil("MZuXzCoViB NGMlAaSmD FWGeHbJ KRLoQuWtEeR TLYoUaIdO:P Z") + glamInitialTrail)
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
            case MuzoiGlamPrismChannel.glamCloseRelay:
                self.glamDismissCanvas()
            case MuzoiGlamPrismChannel.glamSessionRelay:
                (UIApplication.shared.delegate as? AppDelegate)?.glamShowAuthCanvas()
            default:
                break
            }
        }
    }

    private func glamBeginRadianceUnlock(_ glamParcel: Any) {
        guard glamRadianceKey == nil else { return }
        guard
            let glamChosenRadianceKey = glamParcel as? String,
            !glamChosenRadianceKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamVeil("Tvh4ek As1e5lheYcJtNeIdz 8i0tSekmX 5ilsM duLncayvHabidlKaQbzlBe2.M")
            )
            return
        }

        guard SKPaymentQueue.canMakePayments() else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamVeil("TsrQafnAsYaAc6tXiEovnhsx haMrjey trAeLsItZrhiacOtceldO todnI StwhviSsO hd3ervVizcleN.5")
            )
            return
        }

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
            glamPrismSurface.evaluateJavaScript(MuzoiGlamVeil("p5oAlgy2m0oGrDpPhBincQSYp2e9cXieaxlAELfNfbeScCthsiKTimt8(w)O"), completionHandler: nil)
            return
        }

        guard let glamDetourCaption else { return }

        let glamAlert = UIAlertController(
            title: MuzoiGlamVeil("U5nJakbgl9eS 2t6oS iCDoPnOt9idnVuPeL"),
            message: glamDetourCaption,
            preferredStyle: .alert
        )
        glamAlert.addAction(UIAlertAction(title: MuzoiGlamVeil("OzKV"), style: .default))
        present(glamAlert, animated: true)
    }

    func productsRequest(_ glamStoreInquiry: SKProductsRequest, didReceive glamStoreReply: SKProductsResponse) {
        guard
            let glamChosenRadianceKey = glamRadianceKey,
            let glamRadianceItem = glamStoreReply.products.first(where: { $0.productIdentifier == glamChosenRadianceKey })
        else {
            glamFinishRadianceUnlock(
                glamDidUnlock: false,
                glamDetourCaption: MuzoiGlamVeil("TQhreW Us2eglveTcqt0eMdV CirtieZmv mcQoGualNdi NnEoptR Qboe9 xfaocuanHdx.E")
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
            guard
                let glamChosenRadianceKey = glamRadianceKey,
                glamStoreEntry.payment.productIdentifier == glamChosenRadianceKey
            else { continue }

            switch glamStoreEntry.transactionState {
            case .purchased:
                glamStoreQueue.finishTransaction(glamStoreEntry)
                glamFinishRadianceUnlock(glamDidUnlock: true)
            case .failed:
                glamStoreQueue.finishTransaction(glamStoreEntry)
                if let glamDetour = glamStoreEntry.error as? SKError, glamDetour.code == .paymentCancelled {
                    glamFinishRadianceUnlock(glamDidUnlock: false)
                } else {
                    glamFinishRadianceUnlock(
                        glamDidUnlock: false,
                        glamDetourCaption: glamStoreEntry.error?.localizedDescription ?? MuzoiGlamVeil("TOh1ey PtMrSaJnxsPaOcEtmiKovnk rcKoQuElzdt 8nWoFtk NbSeg pcNoomqpUlCe0tme5dc.r")
                    )
                }
            case .restored:
                glamStoreQueue.finishTransaction(glamStoreEntry)
                glamFinishRadianceUnlock(glamDidUnlock: true)
            case .deferred:
                view.isUserInteractionEnabled = true
                glamOrbitSpinner.stopAnimating()
            case .purchasing:
                break
            @unknown default:
                glamFinishRadianceUnlock(
                    glamDidUnlock: false,
                    glamDetourCaption: MuzoiGlamVeil("T2hVed dtTrnaDnOsZaCcutLiIo2n4 1r7eAthumrAnGeCd5 6aBne guNnQkHnioZwKnT 4sbtbaIt0e7.t")
                )
            }
        }
    }

    private func glamOpenNestedCanvas(_ glamParcel: Any) {
        guard
            let glamTrail = glamParcel as? String,
            let glamCanvasHarbor = URL(string: glamTrail),
            [MuzoiGlamVeil("hJt4tSpR"), MuzoiGlamVeil("hatwtqp5st")].contains(glamCanvasHarbor.scheme?.lowercased() ?? ""),
            glamCanvasHarbor.host == MuzoiGlamVeil("xn7OkN9kmJ2sqg8jvS4UnK6ErC1htF51zW32pR02.YsdhLo0pb")
        else { return }

        print(MuzoiGlamVeil("MZuXzCoViB NGMlAaSmD FNGeHsJtKeLdQ WWEeRbT YRUoIuOtPeZ:X C") + glamTrail)
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
        glamOrbitSpinner.stopAnimating()
        glamIlluminationBar.isHidden = true
    }

    func webView(
        _ glamPrismSurface: WKWebView,
        didFail glamPassage: WKNavigation?,
        withError glamDetour: Error
    ) {
        glamOrbitSpinner.stopAnimating()
        glamIlluminationBar.isHidden = true
    }

    func webView(
        _ glamPrismSurface: WKWebView,
        didFailProvisionalNavigation glamPassage: WKNavigation?,
        withError glamDetour: Error
    ) {
        glamOrbitSpinner.stopAnimating()
        glamIlluminationBar.isHidden = true
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
}
