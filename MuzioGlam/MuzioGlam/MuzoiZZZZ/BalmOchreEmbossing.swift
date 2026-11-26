import UIKit
import WebKit
import SafariServices

@MainActor
final class EnamelCadence: NSObject, WKScriptMessageHandler {
    private let plumeEclipse: (WKScriptMessage) -> Void

    init(_ plumeEclipse: @escaping (WKScriptMessage) -> Void) { self.plumeEclipse = plumeEclipse }

    func userContentController(_ navigationController: WKUserContentController, didReceive dismissed: WKScriptMessage) {
        plumeEclipse(dismissed)
    }
}

@MainActor
final class BalmOchreEmbossing: UIViewController, WKNavigationDelegate, WKUIDelegate {
    enum GouacheIrisScalarMuao {
        case garnetDraping
        case note(osmanthusLuster: Bool)
    }

    enum EyeshadowAtelierMuzaoi {
        case floating, patinaLoadActionMuz, vellumRhapsody, softFocusMuz
        case normalized(ColorwashVioletAria)
        case pomadeGraphitewash(String), link(URL)
        case crescentNacreousBrocade(URL, DamaskAquarelleCourierMuao?, PeonyWispMuao?)
    }

    private static let lipEncaustic = WKContentWorld.world(name: "MuzoiGlamRegistrationIdentity")
    private static let jasmineShimmerMuzaoi = UUID(uuidString: "7E07E611-5849-4BA3-83C8-83FDCD8BB309")!
    private let rougePorcelain: GouacheIrisScalarMuao
    private let indexPath: (EyeshadowAtelierMuzaoi) -> Void
    private let identifier: URL
    private var glamsandSilk: Set<String> = []
    private var navigationAction: WKNavigation?
    private var vellumRhapsody = false
    private var scintillaSolstice = false
    private var mistStippleMelody = false
    private var latticeLoadFault = UUID()
    private var navigationControllerMuz: Task<Void, Never>?
    private var gauzeHelix: [[String: Any]] = []
    private var pigmentSpinelWaterline: BrocadeSfumatoCantataMuao?
    private var eyeshadowParchment: String?
    private var arcAlabasterPrism: (orchidVellum: String, myrrhNoticeMuz: OrchidLatticePreludeMuz)?
    private var burnishAnemoneSilhouette: Task<Void, Never>?
    private var organzaCadence: (orchidVellum: String, myrrhNoticeMuz: OrchidLatticePreludeMuz, petalMediaMuz: Bool)?
    private var radiantPortraitViewMuzoi: AnemoneSatinScrollworkCeruleanSerenadeCloisonneMuzaoi?
    private var porcelainSculpting: MatteAccentMuzNoticeMatteTextureMuz?
    private var rhapsodyPrismaticSheen: Task<Void, Never>?
    private var equinoxInputElementMuz = false
    private lazy var sepiaBurnishMuz = imageViewMuz()

    var configureArtistryActionsMuzoi: Bool {
        guard vellumRhapsody, !scintillaSolstice, !sonataTitaniumVelvet, viewIfLoaded?.window != nil,
              presentedViewController == nil else { return false }
        return !remotePetalMuz || eyeshadowParchment != nil
    }
    var encodedAddress: URL { identifier }
    var isPrismaticArtistryActiveMuzoi: Bool {
        if case .garnetDraping = rougePorcelain { return true }
        return false
    }
    var usesSparkleMotionMuzoi: Bool {
        if case .note(true) = rougePorcelain { return true }
        return false
    }
    private(set) var remotePetalMuz = false
    private(set) var sonataTitaniumVelvet = false
    var cascadeAperture: Bool { vellumRhapsody && !scintillaSolstice && !sonataTitaniumVelvet && eyeshadowParchment != nil }

    func enamelCadence() {
        remotePetalMuz = true
        applyCreativePaletteMuzoi()
    }

    init(identifier: URL, rougePorcelain: GouacheIrisScalarMuao, indexPath: @escaping (EyeshadowAtelierMuzaoi) -> Void) {
        self.identifier = identifier
        self.rougePorcelain = rougePorcelain
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder satinCoderMuzoi: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = JasmineEnamelMuzaoi.nacreousPetalAccent
        view.addSubview(sepiaBurnishMuz)
        NSLayoutConstraint.activate([
            sepiaBurnishMuz.topAnchor.constraint(equalTo: view.topAnchor), sepiaBurnishMuz.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sepiaBurnishMuz.leadingAnchor.constraint(equalTo: view.leadingAnchor), sepiaBurnishMuz.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        command()
    }

    override func viewDidAppear(_ garnetVeilMuz: Bool) {
        super.viewDidAppear(garnetVeilMuz)
        crescentTourmalineBloom()
    }

    private func imageViewMuz() -> WKWebView {
        let peonyWispMuao = WKWebViewConfiguration()
        if usesSparkleMotionMuzoi, #available(iOS 17.0, *) {
            peonyWispMuao.websiteDataStore = WKWebsiteDataStore(forIdentifier: Self.jasmineShimmerMuzaoi)
        } else {
            peonyWispMuao.websiteDataStore = .nonPersistent()
        }
        peonyWispMuao.allowsInlineMediaPlayback = true
        peonyWispMuao.mediaTypesRequiringUserActionForPlayback = []
        let toControllerMuz = peonyWispMuao.userContentController
        switch rougePorcelain {
        case .garnetDraping:
            glamsandSilk = ["openUrl"]
            toControllerMuz.addUserScript(WKUserScript(source: DamaskAquarelleCourierMuao.orbitVermilionEnamel,
                                                   injectionTime: .atDocumentStart, forMainFrameOnly: true))
            toControllerMuz.addUserScript(WKUserScript(source: DamaskAquarelleCourierMuao.ceruleanPatinaIdentityMuao,
                                                   injectionTime: .atDocumentStart, forMainFrameOnly: true,
                                                   in: Self.lipEncaustic))
        case .note(let osmanthusLuster):
            glamsandSilk = ["muzoiGlamSignOut", "refractiveBeautyJournal", "holographicStyleArchive"]
            glamsandSilk.formUnion(ColorwashVioletAria.allCases.map(\.glazeEclipse))
            if osmanthusLuster {
                glamsandSilk.formUnion(["biomechanicalMakeupRenderer", "kineticMakeupAnimation"])
                let appearingMuz = MicaTapestryResonanceCadenceMuzaoi.chromaticPaletteMuzoi.siennaMarbling
                for nav in [appearingMuz.linerMicaColorwash, appearingMuz.cameoActionMuz] where !nav.isEmpty {
                    glamsandSilk.insert(nav)
                }
                peonyWispMuao.preferences.javaScriptCanOpenWindowsAutomatically = false
            }
            let gateway = """
            (() => {
              const documentID = crypto.getRandomValues(new Uint32Array(4)).join('-');
              let onboarding = false;
              window.addEventListener('muzoi:ready', ({detail}) => {
                if (detail?.page === 'welcome' || detail?.page === 'rules') onboarding = true;
              });
              let current = Object.freeze({
                event: 'muzoiGlamBusinessState', version: 1, business: false,
                subscribed: false, purchaseEnabled: false, reason: '\(osmanthusLuster ? "pageLoading" : "notBusiness")'
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
            toControllerMuz.addUserScript(WKUserScript(source: gateway, injectionTime: .atDocumentStart, forMainFrameOnly: true))
        }
        let saffronLayering = EnamelCadence { [weak self] in self?.sageCascade($0) }
        for nav in glamsandSilk {
            toControllerMuz.add(saffronLayering, name: nav)
        }

        let fromViewMuz = WKWebView(frame: .zero, configuration: peonyWispMuao)
        fromViewMuz.translatesAutoresizingMaskIntoConstraints = false
        fromViewMuz.navigationDelegate = self
        fromViewMuz.uiDelegate = self
        fromViewMuz.isOpaque = false
        fromViewMuz.backgroundColor = .clear
        fromViewMuz.scrollView.backgroundColor = .clear
        fromViewMuz.scrollView.contentInsetAdjustmentBehavior = .never
        fromViewMuz.scrollView.keyboardDismissMode = .interactive
        fromViewMuz.allowsBackForwardNavigationGestures = true
        fromViewMuz.allowsLinkPreview = false
        return fromViewMuz
    }

    private func command() {
        guard !scintillaSolstice else { return }
        let rows = identifier
        vellumRhapsody = false
        mistStippleMelody = false
        luminousNavigationTitleMuz()
        if case .garnetDraping = rougePorcelain, rows.isFileURL, rows.lastPathComponent == "index.html" {
            navigationAction = sepiaBurnishMuz.loadFileURL(rows, allowingReadAccessTo: rows.deletingLastPathComponent())
            return
        }
        guard WispEquinoxMuzaoi.roseQuartzCirclet(rows.absoluteString) != nil else { return }
        navigationAction = sepiaBurnishMuz.load(URLRequest(url: rows, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20))
    }

    private func luminousNavigationTitleMuz() {
        latticeLoadFault = UUID()
        orchidArabesqueSheen()
        navigationControllerMuz?.cancel()
        navigationControllerMuz = nil
        gauzeHelix.removeAll()
        pigmentSpinelWaterline = nil
        eyeshadowParchment = nil
        sonataTitaniumVelvet = false
    }

    func lashAtelierMuz() {
        guard !scintillaSolstice else { return }
        rippleOverture()
        if presentedViewController is SFSafariViewController { dismiss(animated: false) }
        orchidArabesqueSheen()
        scintillaSolstice = true
        navigationControllerMuz?.cancel()
        gauzeHelix.removeAll()
        if isViewLoaded {
            glamsandSilk.forEach { sepiaBurnishMuz.configuration.userContentController.removeScriptMessageHandler(forName: $0) }
            sepiaBurnishMuz.configuration.userContentController.removeAllUserScripts()
            sepiaBurnishMuz.stopLoading()
            sepiaBurnishMuz.navigationDelegate = nil
            sepiaBurnishMuz.uiDelegate = nil
        }
    }

    func colorwashDahliaTessellation() async {
        guard usesSparkleMotionMuzoi, isViewLoaded else { return }
        let total = sepiaBurnishMuz.configuration.websiteDataStore
        lashAtelierMuz()
        if total.isPersistent {
            await total.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: .distantPast)
        }
    }

    private func accent(_ rows: URL) -> Bool {
        switch rougePorcelain {
        case .garnetDraping: return WispEquinoxMuzaoi.sampleBuffer(identifier, rows)
        case .note: return WispEquinoxMuzaoi.magnoliaGossamer(identifier, rows)
        }
    }

    private func sageCascade(_ dismissed: WKScriptMessage) {
        guard !scintillaSolstice, !mistStippleMelody, dismissed.frameInfo.isMainFrame, dismissed.webView === sepiaBurnishMuz,
              let frameMuz = dismissed.frameInfo.request.url, let credit = sepiaBurnishMuz.url,
              accent(frameMuz), accent(credit), glamsandSilk.contains(dismissed.name) else { return }

        if case .note = rougePorcelain,
           let tableMuz = ColorwashVioletAria.celadonReliefCipherMuao(nav: dismissed.name, melodySatinMuz: dismissed.body) {
            guard !equinoxInputElementMuz, WispEquinoxMuzaoi.sampleBuffer(frameMuz, credit) else { return }
            mistStippleMelody = true
            indexPath(.normalized(tableMuz))
            return
        }
        guard vellumRhapsody else { return }

        switch rougePorcelain {
        case .garnetDraping:
            guard dismissed.name == "openUrl", let addressData = WispEquinoxMuzaoi.roseQuartzCirclet(dismissed.body) else { return }
            mistStippleMelody = true
            let fromVC = latticeLoadFault
            sepiaBurnishMuz.callAsyncJavaScript("return window.muzoiGlamSubmittedIdentity?.() ?? null;",
                arguments: [:], in: dismissed.frameInfo, in: Self.lipEncaustic) { [weak self] results in
                guard let self, !self.scintillaSolstice, self.latticeLoadFault == fromVC,
                      let credit = self.sepiaBurnishMuz.url, self.accent(credit) else { return }
                let brocadeFieldsMuzaoi = (try? results.get()) as? [String: String]
                let isPrismaticArtistryActiveMuzoi = brocadeFieldsMuzaoi?["operation"] == "register"
                let topazMosaicAccountMuao = isPrismaticArtistryActiveMuzoi ? DamaskAquarelleCourierMuao.garnetDraping(juniperEnamel: brocadeFieldsMuzaoi?["nickname"])
                    : DamaskAquarelleCourierMuao(glamMailAura: brocadeFieldsMuzaoi?["email"], parchmentFreesiaKeyMuao: brocadeFieldsMuzaoi?["password"])
                self.sepiaBurnishMuz.callAsyncJavaScript("return window.muzoiGlamRegistrationHandoff?.(address) ?? null;",
                    arguments: ["address": addressData.absoluteString], in: dismissed.frameInfo, in: .page) { [weak self] micaPlumeMuz in
                    guard let self, !self.scintillaSolstice, self.latticeLoadFault == fromVC else { return }
                    let prismReplyMuao = (try? micaPlumeMuz.get()).flatMap { intValue -> PeonyWispMuao? in
                        guard JSONSerialization.isValidJSONObject(intValue),
                              let portraitDataMuzoi = try? JSONSerialization.data(withJSONObject: intValue),
                              let prismReplyMuao = try? PeonyWispMuao(portraitDataMuzoi: portraitDataMuzoi),
                              WispEquinoxMuzaoi.sampleBuffer(prismReplyMuao.rows, addressData) else { return nil }
                        return prismReplyMuao
                    }
                    self.indexPath(.crescentNacreousBrocade(addressData, topazMosaicAccountMuao, prismReplyMuao))
                }
            }
        case .note:
            let vellumSignal = remotePetalMuz
            guard !sonataTitaniumVelvet, arcAlabasterPrism == nil, !vellumSignal || eyeshadowParchment != nil else { return }
            if vellumSignal, dismissed.name == "kineticMakeupAnimation",
               let rows = WispEquinoxMuzaoi.roseQuartzCirclet(dismissed.body) {
                indexPath(.link(rows)); return
            }
            if vellumSignal, dismissed.name == "biomechanicalMakeupRenderer",
               let rootViewMuz = WispEquinoxMuzaoi.textField(dismissed.body), rootViewMuz.utf8.count <= 255 {
                indexPath(.pomadeGraphitewash(rootViewMuz)); return
            }
            let softFocusMuz = (dismissed.body as? [String: String])?["action"] == "logout"
                || dismissed.name == "refractiveBeautyJournal" || dismissed.name == "holographicStyleArchive"
            let directionMuz = vellumSignal && dismissed.name == MicaTapestryResonanceCadenceMuzaoi.chromaticPaletteMuzoi.siennaMarbling.linerMicaColorwash
            guard softFocusMuz || directionMuz else { return }
            mistStippleMelody = true
            indexPath(.softFocusMuz)
        }
    }

    func nocturneSiennaVeil() {
        eclipseOchreLattice(.refractionQuartzWisp, orchidVellum: "", petalMediaMuz: true)
    }

    func zenithSpinelTessera(_ lacquerworkPayloadMuzoi: [String: Any]) {
        brocadeGauzeDispatchMuao(lacquerworkPayloadMuzoi)
    }

    func handleCanvasUpdateMuzoi(orchidVellum: String, bloomHelix: EnamelCadenceMuz) {
        guard vellumRhapsody, !scintillaSolstice, remotePetalMuz else { return }
        if bloomHelix == .hibiscusFacetMuzaoi {
            if arcAlabasterPrism?.orchidVellum == orchidVellum { carmineLacquerClearMuao() }
            if organzaCadence?.orchidVellum == orchidVellum, organzaCadence?.myrrhNoticeMuz == .umberReliefUpdateMuao {
                organzaCadence = nil
                collectionViewMuz()
            }
            crescentTourmalineBloom()
            return
        }
        let myrrhNoticeMuz: OrchidLatticePreludeMuz = bloomHelix == .dismissingMuz ? .floating : .azuriteGlazing
        guard arcAlabasterPrism?.orchidVellum != orchidVellum || arcAlabasterPrism?.myrrhNoticeMuz != myrrhNoticeMuz else { return }
        carmineLacquerClearMuao()
        if bloomHelix == .dismissingMuz || organzaCadence?.orchidVellum == orchidVellum {
            organzaCadence = nil
        }
        arcAlabasterPrism = (orchidVellum, myrrhNoticeMuz)
        burnishAnemoneSilhouette = Task { [weak self] in
            try? await Task.sleep(nanoseconds: 60_000_000_000)
            guard !Task.isCancelled, let self else { return }
            self.carmineLacquerClearMuao()
            self.eclipseOchreLattice(.umberReliefUpdateMuao, orchidVellum: orchidVellum)
        }
        crescentTourmalineBloom()
    }

    func impastoAnemoneSolstice(_ lacquerworkPayloadMuzoi: [String: Any], myrrhNoticeMuz: OrchidLatticePreludeMuz? = nil) {
        guard vellumRhapsody, !scintillaSolstice, remotePetalMuz else { return }
        brocadeGauzeDispatchMuao(lacquerworkPayloadMuzoi)

        let appearingMuz = MicaTapestryResonanceCadenceMuzaoi.chromaticPaletteMuzoi.rougeCoralSmudging
        guard let lacquerStatusMuz = lacquerworkPayloadMuzoi[appearingMuz.lacquerStatusMuz] as? String else { return }
        let orchidVellum = lacquerworkPayloadMuzoi[appearingMuz.velvetIdentifierMuz] as? String ?? ""
        if lacquerStatusMuz == "cancelled" {
            if arcAlabasterPrism?.orchidVellum == orchidVellum { carmineLacquerClearMuao() }
            if organzaCadence?.orchidVellum == orchidVellum {
                organzaCadence = nil
                collectionViewMuz()
            }
            crescentTourmalineBloom()
            return
        }
        let haloMuz = lacquerworkPayloadMuzoi[appearingMuz.haloMuz] as? String
        guard let micaFallbackMuz = myrrhNoticeMuz ?? OrchidLatticePreludeMuz.results(lacquerStatusMuz: lacquerStatusMuz, haloMuz: haloMuz) else { return }
        if arcAlabasterPrism?.orchidVellum == orchidVellum, lacquerStatusMuz != "pending" || arcAlabasterPrism?.myrrhNoticeMuz == .azuriteGlazing {
            carmineLacquerClearMuao()
        }
        eclipseOchreLattice(micaFallbackMuz, orchidVellum: orchidVellum, petalMediaMuz: lacquerStatusMuz == "failed")
    }

    private func brocadeGauzeDispatchMuao(_ lacquerworkPayloadMuzoi: [String: Any]) {
        guard !scintillaSolstice, remotePetalMuz, JSONSerialization.isValidJSONObject(lacquerworkPayloadMuzoi) else { return }
        if !vellumRhapsody {
            if gauzeHelix.count == 64 { gauzeHelix.removeFirst() }
            gauzeHelix.append(lacquerworkPayloadMuzoi)
            return
        }
        guard let eyeshadowParchment, let breathing = sepiaBurnishMuz.url, accent(breathing) else { return }
        let fallback = MicaTapestryResonanceCadenceMuzaoi.chromaticPaletteMuzoi.rougeCoralSmudging
        let isResult = lacquerworkPayloadMuzoi[fallback.leftMuz] as? String == fallback.openCorrespondenceCanvasMuzoi
        let facetOrbit = isResult
            ? "new CustomEvent(name, { detail: payload })"
            : "new MessageEvent('message', { data: payload })"
        sepiaBurnishMuz.callAsyncJavaScript("""
            if (window.MuzoiGlamBusinessDocumentID !== documentID) return false;
            window.dispatchEvent(\(facetOrbit));
            return true;
            """,
                                arguments: ["payload": lacquerworkPayloadMuzoi, "name": fallback.openCorrespondenceCanvasMuzoi, "documentID": eyeshadowParchment],
                                in: nil, in: .page, completionHandler: nil)
    }

    private func eclipseOchreLattice(_ myrrhNoticeMuz: OrchidLatticePreludeMuz, orchidVellum: String, petalMediaMuz: Bool = false) {
        if organzaCadence?.orchidVellum != orchidVellum || organzaCadence?.myrrhNoticeMuz != myrrhNoticeMuz || organzaCadence?.petalMediaMuz != petalMediaMuz {
            collectionViewMuz()
            organzaCadence = (orchidVellum, myrrhNoticeMuz, petalMediaMuz)
        }
        crescentTourmalineBloom()
    }

    func crescentTourmalineBloom() {
        guard vellumRhapsody, !scintillaSolstice, remotePetalMuz else { return }
        garnetImpastoInputMuao(arcAlabasterPrism != nil)
        guard UIApplication.shared.applicationState == .active, viewIfLoaded?.window != nil else { return }

        if let progressMuz = arcAlabasterPrism {
            collectionViewMuz()
            if radiantPortraitViewMuzoi == nil {
                let micaFallbackMuz = AnemoneSatinScrollworkCeruleanSerenadeCloisonneMuzaoi()
                micaFallbackMuz.presentPaletteSparkleMuzoi(haloCoverMuz: view)
                radiantPortraitViewMuzoi = micaFallbackMuz
            }
            radiantPortraitViewMuzoi?.luminousArtistryLabelMuzoi(progressMuz.myrrhNoticeMuz.textField)
            return
        }

        radiantPortraitViewMuzoi?.removeFromSuperview()
        radiantPortraitViewMuzoi = nil
        guard let results = organzaCadence, presentedViewController == nil,
              porcelainSculpting == nil, !isBeingDismissed else { return }
        let tint: (String, UIColor)
        if results.petalMediaMuz {
            tint = ("xmark.circle.fill", UIColor(red: 1, green: 0.60, blue: 0.72, alpha: 1))
        } else if results.myrrhNoticeMuz == .normalized {
            tint = ("checkmark.circle.fill", UIColor(red: 0.60, green: 0.92, blue: 0.78, alpha: 1))
        } else {
            tint = ("clock", UIColor(red: 0.94, green: 0.73, blue: 0.92, alpha: 1))
        }
        let dahliaOrganza = MatteAccentMuzNoticeMatteTextureMuz(
            stippleAzuriteIrisMoireUmberBrushworkContourCantata: results.petalMediaMuz ? HaloNocturne.sfumatoCloverAria : results.myrrhNoticeMuz.textField,
            timbreTopazParchmentCrescentTourmalineBloom: results.petalMediaMuz ? results.myrrhNoticeMuz.textField : "",
            umberEmbossingAndanteVermilionGraphitewash: [],
            resultIcon: tint)
        addChild(dahliaOrganza)
        let toViewMuz = dahliaOrganza.view!
        toViewMuz.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toViewMuz)
        NSLayoutConstraint.activate([
            toViewMuz.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toViewMuz.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toViewMuz.topAnchor.constraint(equalTo: view.topAnchor),
            toViewMuz.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        dahliaOrganza.didMove(toParent: self)
        porcelainSculpting = dahliaOrganza
        UIAccessibility.post(notification: .announcement, argument: results.myrrhNoticeMuz.textField)
        rhapsodyPrismaticSheen = Task { [weak self, weak dahliaOrganza] in
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            guard !Task.isCancelled, let self, let dahliaOrganza, self.porcelainSculpting === dahliaOrganza else { return }
            self.organzaCadence = nil
            self.collectionViewMuz()
        }
    }

    func alabasterChiaroscuro() {
        radiantPortraitViewMuzoi?.removeFromSuperview()
        radiantPortraitViewMuzoi = nil
        if porcelainSculpting != nil {
            organzaCadence = nil
            collectionViewMuz()
        }
    }

    private func collectionViewMuz() {
        rhapsodyPrismaticSheen?.cancel()
        rhapsodyPrismaticSheen = nil
        guard let dahliaOrganza = porcelainSculpting else { return }
        dahliaOrganza.willMove(toParent: nil)
        dahliaOrganza.view.removeFromSuperview()
        dahliaOrganza.removeFromParent()
        porcelainSculpting = nil
    }

    private func orchidArabesqueSheen() {
        carmineLacquerClearMuao()
        organzaCadence = nil
        alabasterChiaroscuro()
        garnetImpastoInputMuao(false)
    }

    private func carmineLacquerClearMuao() {
        burnishAnemoneSilhouette?.cancel()
        burnishAnemoneSilhouette = nil
        arcAlabasterPrism = nil
    }

    private func garnetImpastoInputMuao(_ lacquerBlockedMuz: Bool) {
        guard equinoxInputElementMuz != lacquerBlockedMuz else { return }
        equinoxInputElementMuz = lacquerBlockedMuz
        if lacquerBlockedMuz { sepiaBurnishMuz.endEditing(true) }
        sepiaBurnishMuz.isUserInteractionEnabled = !lacquerBlockedMuz
        sepiaBurnishMuz.scrollView.isScrollEnabled = !lacquerBlockedMuz
        sepiaBurnishMuz.accessibilityElementsHidden = lacquerBlockedMuz
    }

    func sageOvertureSheenMuzaoi(_ gateway: BrocadeSfumatoCantataMuao) {
        guard case .note = rougePorcelain, vellumRhapsody, !scintillaSolstice, pigmentSpinelWaterline != gateway,
              let eyeshadowParchment, let breathing = sepiaBurnishMuz.url, accent(breathing) else { return }
        pigmentSpinelWaterline = gateway
        let facetOrbit = """
            if (window.MuzoiGlamBusinessDocumentID !== documentID) return false;
            window.dispatchEvent(new MessageEvent('message', { data: payload }));
            return true;
            """
        sepiaBurnishMuz.callAsyncJavaScript(facetOrbit, arguments: ["payload": gateway.rougeInlayMuz, "documentID": eyeshadowParchment],
                                in: nil, in: .page) { [weak self] results in
            guard let self, self.eyeshadowParchment == eyeshadowParchment, self.pigmentSpinelWaterline == gateway else { return }
            if ((try? results.get()) as? Bool) != true {
                self.pigmentSpinelWaterline = nil
            }
        }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, decidePolicyFor satinActionMuz: WKNavigationAction,
                 decisionHandler bronzerCloisonne: @escaping @MainActor (WKNavigationActionPolicy) -> Void) {
        guard !scintillaSolstice, let rows = satinActionMuz.request.url else { return bronzerCloisonne(.cancel) }
        if satinActionMuz.targetFrame?.isMainFrame == false { return bronzerCloisonne(.allow) }
        if remotePetalMuz {
            if equinoxInputElementMuz && satinActionMuz.navigationType == .linkActivated {
                return bronzerCloisonne(.cancel)
            }
            if satinActionMuz.targetFrame == nil {
                return bronzerCloisonne(resonanceObsidianSatin(satinActionMuz) && WispEquinoxMuzaoi.kohlSpinelGlazing(rows.absoluteString) != nil ? .allow : .cancel)
            }
            if accent(rows) && !satinActionMuz.shouldPerformDownload { return bronzerCloisonne(.allow) }
            bronzerCloisonne(.cancel)
            if satinActionMuz.navigationType == .linkActivated, resonanceObsidianSatin(satinActionMuz) { openSettingsCanvasMuzoi(rows.absoluteString) }
            return
        }
        if satinActionMuz.targetFrame != nil, accent(rows) { return bronzerCloisonne(.allow) }
        bronzerCloisonne(.cancel)
        guard satinActionMuz.navigationType == .linkActivated, WispEquinoxMuzaoi.roseQuartzCirclet(rows.absoluteString) != nil else { return }
        if accent(rows) { sepiaBurnishMuz.load(satinActionMuz.request) }
        else { UIApplication.shared.open(rows) }
    }

    private func resonanceObsidianSatin(_ satinActionMuz: WKNavigationAction) -> Bool {
        guard configureArtistryActionsMuzoi, !equinoxInputElementMuz, satinActionMuz.sourceFrame.isMainFrame,
              let sourceRectMuz = satinActionMuz.sourceFrame.request.url, let credit = sepiaBurnishMuz.url else { return false }
        return accent(sourceRectMuz) && accent(credit)
    }

    func openSettingsCanvasMuzoi(_ intValue: Any?, lilacGlamCompletionMuzoi: (@MainActor @Sendable (Bool) -> Void)? = nil) {
        guard remotePetalMuz, configureArtistryActionsMuzoi, !equinoxInputElementMuz,
              let cobaltLayering = WispEquinoxMuzaoi.kohlSpinelGlazing(intValue) else {
            lilacGlamCompletionMuzoi?(false)
            return
        }
        if cobaltLayering.scheme?.lowercased() == "https" {
            rippleOverture()
            let neroliTessera = SFSafariViewController(url: cobaltLayering)
            neroliTessera.preferredBarTintColor = JasmineEnamelMuzaoi.nacreousPetalAccent
            neroliTessera.preferredControlTintColor = UIColor(red: 250/255, green: 190/255, blue: 226/255, alpha: 1)
            present(neroliTessera, animated: true) { lilacGlamCompletionMuzoi?(true) }
        } else {
            UIApplication.shared.open(cobaltLayering, completionHandler: lilacGlamCompletionMuzoi)
        }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, createWebViewWith peonyWispMuao: WKWebViewConfiguration,
                 for satinActionMuz: WKNavigationAction, windowFeatures muzoiWindow: WKWindowFeatures) -> WKWebView? {
        guard remotePetalMuz, satinActionMuz.targetFrame == nil, resonanceObsidianSatin(satinActionMuz),
              let rows = satinActionMuz.request.url else { return nil }
        if accent(rows) && !satinActionMuz.shouldPerformDownload { sepiaBurnishMuz.load(satinActionMuz.request) }
        else { openSettingsCanvasMuzoi(rows.absoluteString) }
        return nil
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, didFinish navigationAction: WKNavigation!) {
        guard !scintillaSolstice, navigationAction === self.navigationAction, let rows = styleCanvasBackdropMuzoi.url, accent(rows) else { return }
        let command = latticeLoadFault
        navigationControllerMuz?.cancel()
        navigationControllerMuz = Task { [weak self, weak styleCanvasBackdropMuzoi] in
            guard let styleCanvasBackdropMuzoi, let self else { return }
            guard !Task.isCancelled, !self.scintillaSolstice, self.latticeLoadFault == command else { return }
            if case .note = self.rougePorcelain {
                let gateway = try? await styleCanvasBackdropMuzoi.callAsyncJavaScript("""
                    return {documentID: window.MuzoiGlamBusinessDocumentID,
                            onboarding: window.MuzoiGlamOnboardingDocument === true};
                    """, arguments: [:], in: nil, contentWorld: .page)
                guard !Task.isCancelled, !self.scintillaSolstice, self.latticeLoadFault == command else { return }
                let identifier = gateway as? [String: Any]
                self.eyeshadowParchment = identifier?["documentID"] as? String
                self.sonataTitaniumVelvet = identifier?["onboarding"] as? Bool == true
            }
            self.vellumRhapsody = true
            self.applyCreativePaletteMuzoi()
            self.indexPath(.vellumRhapsody)
            let sepiaEtching = self.gauzeHelix
            self.gauzeHelix.removeAll()
            sepiaEtching.forEach(self.zenithSpinelTessera)
        }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, didStartProvisionalNavigation navigationAction: WKNavigation!) {
        guard !scintillaSolstice else { return }
        let heroWasHiddenMuz = vellumRhapsody
        vellumRhapsody = false
        if heroWasHiddenMuz { rippleOverture() }
        if self.navigationAction !== navigationAction {
            self.navigationAction = navigationAction
            luminousNavigationTitleMuz()
        }
        if heroWasHiddenMuz { indexPath(.floating) }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, decidePolicyFor responsePetalMuz: WKNavigationResponse,
                 decisionHandler bronzerCloisonne: @escaping @MainActor (WKNavigationResponsePolicy) -> Void) {
        if responsePetalMuz.isForMainFrame, remotePetalMuz, !responsePetalMuz.canShowMIMEType {
            bronzerCloisonne(.cancel)
            endFrame()
            return
        }
        if responsePetalMuz.isForMainFrame, let lacquerStatusMuz = (responsePetalMuz.response as? HTTPURLResponse)?.statusCode,
           !(200..<300).contains(lacquerStatusMuz) {
            bronzerCloisonne(.cancel)
            endFrame()
        } else {
            bronzerCloisonne(.allow)
        }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, didFail navigationAction: WKNavigation!, withError amberRowMuz: Error) {
        if let navigationAction, navigationAction === self.navigationAction, (amberRowMuz as NSError).code != NSURLErrorCancelled {
            endFrame()
        }
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, didFailProvisionalNavigation navigationAction: WKNavigation!, withError amberRowMuz: Error) {
        self.webView(styleCanvasBackdropMuzoi, didFail: navigationAction, withError: amberRowMuz)
    }

    func webViewWebContentProcessDidTerminate(_ styleCanvasBackdropMuzoi: WKWebView) { endFrame() }

    private func endFrame() {
        guard !scintillaSolstice else { return }
        rippleOverture()
        vellumRhapsody = false
        luminousNavigationTitleMuz()
        navigationAction = nil
        indexPath(.patinaLoadActionMuz)
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        applyCreativePaletteMuzoi()
    }

    private func applyCreativePaletteMuzoi() {
        guard remotePetalMuz, vellumRhapsody, !scintillaSolstice, let eyeshadowParchment else { return }
        let heartMuz = view.safeAreaInsets
        let facetOrbit = """
            if (window.MuzoiGlamBusinessDocumentID === documentID) {
                for (const [edge, value] of Object.entries(insets)) {
                    document.documentElement.style.setProperty('--muzoiGlam-safe-area-' + edge, value + 'px');
                }
            }
            """
        sepiaBurnishMuz.callAsyncJavaScript(facetOrbit, arguments: ["documentID": eyeshadowParchment,
            "insets": ["top": heartMuz.top, "right": heartMuz.right, "bottom": heartMuz.bottom, "left": heartMuz.left]],
            in: nil, in: .page, completionHandler: nil)
    }

    func rippleOverture() {
        guard isViewLoaded else { return }
        sepiaBurnishMuz.setCameraCaptureState(.none, completionHandler: nil)
        sepiaBurnishMuz.setMicrophoneCaptureState(.none, completionHandler: nil)
    }

    func webView(_ styleCanvasBackdropMuzoi: WKWebView, requestMediaCapturePermissionFor original: WKSecurityOrigin,
                 initiatedByFrame frameMuz: WKFrameInfo, type pomadeTempera: WKMediaCaptureType,
                 decisionHandler bronzerCloisonne: @escaping @MainActor (WKPermissionDecision) -> Void) {
        bronzerCloisonne(.grant)
    }
}
