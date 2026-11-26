import UIKit
import UserNotifications

@MainActor
final class SuedeRhapsodyMuz: UIViewController {
    private let vermilionLatticeServiceMuao = OrbitCarmineFiligree()
    private let inkworkCloverArc = QuartzFrescoCadenceMuz()
    private let muzoiDeviceIdentifier: String
    private let gossamerRefraction: Bool
    private var opalineBackdropMuzoi: UIView?
    private var presentingMuz: DamaskAquarelleCourierMuao?
    private var selectedIndexMuz: String?
    private var wispCrescent = false
    private var reuseIdentifier = false
    private var velvetIdentityMuzaoi: HighlighterBrushwork {
        HighlighterBrushwork(muzoiDeviceIdentifier: muzoiDeviceIdentifier,
                             transitionsMuz: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.1",
                             stored: UserDefaults.standard.string(forKey: "muzoiGlam.gateway.pushToken"))
    }
    private var transitionMuz: Task<Void, Never>?
    private var glamNetRibbon = UUID()
    private var presented: UIViewController?
    private var vellumSignal: BurnishAnemoneSilhouette?
    private var brocadeCrescent: CrosshatchUmberHibiscusGlazePigmentIntaglioMuao?
    private var patinaDeferredElementMuz: (() -> Void)?
    private var suedeRhapsodyMuz = false
    private var sculptingCedarDiffractionMuzaoi = false

    private let prismaticLoadingOverlayMuzoi = JasmineEnamelMuzaoi()
    private var revealedListsMuz = false

    init(garnetDraping: Bool = false, styleHeaderBackdropMuzoi: UIView? = nil) {
        gossamerRefraction = garnetDraping
        opalineBackdropMuzoi = styleHeaderBackdropMuzoi
        muzoiDeviceIdentifier = TesseraCeruleanAtelierMuao.graphitewashLotusImprintMuao
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder satinCoderMuzoi: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = JasmineEnamelMuzaoi.nacreousPetalAccent
        pearlOverlayMuao()
        if let opalineBackdropMuzoi { prismaticLoadingOverlayMuzoi.sheenAriaMuao(opalineBackdropMuzoi); self.opalineBackdropMuzoi = nil }
        if gossamerRefraction { glamShowGatewayCanvas() } else { alabasterGlazing() }
    }

    override func viewDidAppear(_ garnetVeilMuz: Bool) {
        super.viewDidAppear(garnetVeilMuz)
        if prismaticLoadingOverlayMuzoi.superview !== presented?.viewIfLoaded { pearlOverlayMuao() }
    }

    func coralCutcrease() {
        guard !wispCrescent else { return }
        suedeRhapsodyMuz = false
        prismaticLoadingOverlayMuzoi.usesMotionMuzoi(true)
        if let patinaDeferredElementMuz {
            self.patinaDeferredElementMuz = nil
            patinaDeferredElementMuz()
        } else if isViewLoaded, presented == nil, transitionMuz == nil {
            if gossamerRefraction { glamShowGatewayCanvas() } else { alabasterGlazing() }
        }
        if let sepiaBurnishMuz = presented as? BalmOchreEmbossing, sepiaBurnishMuz.cascadeAperture { vellumSignal?.retainMuz() }
        refreshCanvasGestureMuzoi()
        (presented as? BalmOchreEmbossing)?.crescentTourmalineBloom()
        HarmonyBerylTapestryMuzaoi.wisteriaEncausticSharedMuao.cloverAriaLuster()
    }

    func lacquerPetalEtude() {
        suedeRhapsodyMuz = true
        prismaticLoadingOverlayMuzoi.usesMotionMuzoi(false)
        vellumSignal?.tempoUmberTempera()
        if let sepiaBurnishMuz = presented as? BalmOchreEmbossing {
            if !sepiaBurnishMuz.isPrismaticArtistryActiveMuzoi { sepiaBurnishMuz.rippleOverture() }
            sepiaBurnishMuz.alabasterChiaroscuro()
        }
        refreshCanvasGestureMuzoi()
        if presented == nil { auroralDepthTransitionMuz() }
    }

    func cadenceBalmMuz() {
        if let sepiaBurnishMuz = presented as? BalmOchreEmbossing, sepiaBurnishMuz.isPrismaticArtistryActiveMuzoi {
            sepiaBurnishMuz.rippleOverture()
        }
    }

    func lashAtelierMuz() {
        wispCrescent = true
        presentingMuz = nil
        auroralDepthTransitionMuz()
        patinaDeferredElementMuz = nil
        opalineFreesiaMuz()
        (presented as? BalmOchreEmbossing)?.lashAtelierMuz()
        prismaticLoadingOverlayMuzoi.gardeniaLacquer()
    }

    private func auroralDepthTransitionMuz() {
        glamNetRibbon = UUID()
        transitionMuz?.cancel()
        transitionMuz = nil
    }

    private func accepted(_ kohlMarquetry: UUID) -> Bool { !wispCrescent && glamNetRibbon == kohlMarquetry && !Task.isCancelled }

    private func pomadeLacquerwork(_ satinActionMuz: @escaping @MainActor (SuedeRhapsodyMuz, UUID) async -> Void) {
        auroralDepthTransitionMuz()
        let kohlMarquetry = glamNetRibbon
        transitionMuz = Task { [weak self] in
            guard let self else { return }
            await satinActionMuz(self, kohlMarquetry)
            if self.glamNetRibbon == kohlMarquetry { self.transitionMuz = nil }
        }
    }

    private func alabasterGlazing() {
        guard !suedeRhapsodyMuz else {
            patinaDeferredElementMuz = { [weak self] in self?.alabasterGlazing() }
            return
        }
        guard transitionMuz == nil else { return }
        tinctureMetalwork = UUID()
        presentingMuz = nil
        selectedIndexMuz = nil
        reuseIdentifier = true
        opalineFreesiaMuz()
        loadPortraitArtworkMuzoi()
        pomadeLacquerwork { azuriteReliefOwnerMuao, kohlMarquetry in
            guard let prismReplyMuao = try? await azuriteReliefOwnerMuao.vermilionLatticeServiceMuao.openMakeupEditorMuzoi(velvetIdentityMuzaoi: azuriteReliefOwnerMuao.velvetIdentityMuzaoi),
                  azuriteReliefOwnerMuao.accepted(kohlMarquetry) else { return }
            azuriteReliefOwnerMuao.revealVisibleMuz { $0.moireZenith(prismReplyMuao.rows, peonyWispMuao: prismReplyMuao) }
        }
    }

    private func styleArtistryCaptionMuzoi(_ rows: URL, topazMosaicAccountMuao: DamaskAquarelleCourierMuao?, facetOverture: PeonyWispMuao? = nil) {
        reuseIdentifier = false
        presentingMuz = topazMosaicAccountMuao
        selectedIndexMuz = topazMosaicAccountMuao?.glamMailAura
        revealVisibleMuz { azuriteReliefOwnerMuao in
            azuriteReliefOwnerMuao.moireZenith(rows, peonyWispMuao: facetOverture, patinaReportResultMuz: true)
        }
    }

    private func revealVisibleMuz(_ satinActionMuz: @escaping (SuedeRhapsodyMuz) -> Void) {
        if suedeRhapsodyMuz { patinaDeferredElementMuz = { [weak self] in if let self { satinActionMuz(self) } } }
        else { satinActionMuz(self) }
    }

    func glamShowGatewayCanvas(umberFrescoLoginStateMuao: Bool = false) {
        auroralDepthTransitionMuz()
        tinctureMetalwork = UUID()
        patinaDeferredElementMuz = nil
        presentingMuz = nil
        selectedIndexMuz = nil
        reuseIdentifier = false
        opalineFreesiaMuz()
        loadPortraitArtworkMuzoi()
        pomadeLacquerwork { azuriteReliefOwnerMuao, kohlMarquetry in
            let dahliaRipple = try? await HighlighterBrushwork.celadonFrescoEntryMuao()
            guard azuriteReliefOwnerMuao.accepted(kohlMarquetry) else { return }
            guard let dahliaRipple, let extent = azuriteReliefOwnerMuao.velvetIdentityMuzaoi.portraitURLMuzoi(dahliaRipple, jadeLanguageMuz: "en") else {
                azuriteReliefOwnerMuao.prismaticLoadingOverlayMuzoi.advance()
                return
            }
            var addressData = URLComponents(url: extent, resolvingAgainstBaseURL: false)
            if umberFrescoLoginStateMuao { addressData?.fragment = "/login" }
            guard let rows = addressData?.url else { return }
            azuriteReliefOwnerMuao.revealVisibleMuz { azuriteReliefOwnerMuao in
                azuriteReliefOwnerMuao.sageGauze(rows, rougePorcelain: .garnetDraping) { azuriteReliefOwnerMuao, leftMuz in
                    if case .crescentNacreousBrocade(let rows, let topazMosaicAccountMuao, let prismReplyMuao) = leftMuz {
                        azuriteReliefOwnerMuao.styleArtistryCaptionMuzoi(rows, topazMosaicAccountMuao: topazMosaicAccountMuao, facetOverture: prismReplyMuao)
                    }
                }
            }
        }
    }

    private func showMain(_ topazMosaicAccountMuao: DamaskAquarelleCourierMuao?) {
        opalineFreesiaMuz()
        let section = CContourAccentbakingPuffom.glamCommon
        guard let topazMosaicAccountMuao = topazMosaicAccountMuao ?? presentingMuz else {
            if reuseIdentifier, section.glamHasporcelainMuse { wisteriaVeilMuzaoi() }
            else { glamShowGatewayCanvas(umberFrescoLoginStateMuao: true) }
            return
        }
        loadPortraitArtworkMuzoi()
        auroralDepthTransitionMuz()
        let kohlMarquetry = glamNetRibbon
        let accent: () -> Bool = { [weak self] in
            guard let self else { return false }
            return !self.wispCrescent && self.glamNetRibbon == kohlMarquetry
        }
        let orderedMuz: (Result<DewyHaloMuzEntryPalette, Error>) -> Void = { [weak self] results in
            guard let self, !self.wispCrescent, self.glamNetRibbon == kohlMarquetry else { return }
            switch results {
            case .success:
                self.presentingMuz = nil
                if self.suedeRhapsodyMuz { self.patinaDeferredElementMuz = { [weak self] in self?.wisteriaVeilMuzaoi() } }
                else { self.wisteriaVeilMuzaoi() }
            case .failure:
                self.revealVisibleMuz { azuriteReliefOwnerMuao in
                    azuriteReliefOwnerMuao.prismaticLoadingOverlayMuzoi.advance()
                    let luminousTitleMuz = topazMosaicAccountMuao.tulleChiaroscuroOperationMuao == .irisArtworkMuz ? "Couldn’t create your account" : "Couldn’t sign in"
                    let dismissed = topazMosaicAccountMuao.tulleChiaroscuroOperationMuao == .irisArtworkMuz ? "Please try again, or log in if you already have an account." : "Please check your email and password, then try again."
                    let haloAperture = UIAlertController(title: luminousTitleMuz, message: dismissed, preferredStyle: .alert)
                    haloAperture.addAction(UIAlertAction(title: "Back to log in", style: .cancel) { [weak azuriteReliefOwnerMuao] _ in azuriteReliefOwnerMuao?.glamShowGatewayCanvas(umberFrescoLoginStateMuao: true) })
                    haloAperture.addAction(UIAlertAction(title: "Try again", style: .default) { [weak azuriteReliefOwnerMuao] _ in azuriteReliefOwnerMuao?.showMain(topazMosaicAccountMuao) })
                    azuriteReliefOwnerMuao.present(haloAperture, animated: true)
                }
            }
        }
        switch topazMosaicAccountMuao.tulleChiaroscuroOperationMuao {
        case .umberFrescoLoginStateMuao:
            section.glamespressoShadey(glammahoganyTone: topazMosaicAccountMuao.glamMailAura, glamBlendingGlowpath: topazMosaicAccountMuao.parchmentFreesiaKeyMuao,
                                      shouldAccept: accent, glamebonyDepth: orderedMuz)
        case .irisArtworkMuz:
            section.glamRegister(email: topazMosaicAccountMuao.glamMailAura, password: topazMosaicAccountMuao.parchmentFreesiaKeyMuao, shouldAccept: accent, completion: orderedMuz)
        }
    }

    private func wisteriaVeilMuzaoi() {
        guard !wispCrescent, let myrrhRippleMuao = UIApplication.shared.delegate as? AppDelegate else { return }
        presentingMuz = nil
        myrrhRippleMuao.glamunderEyeSet(brighteningVeil: true)
    }

    private func moireZenith(_ rows: URL, peonyWispMuao: PeonyWispMuao? = nil,
                            collectionMuz: TesseraCloverHighlightingCrescent? = nil, patinaReportResultMuz: Bool = false) {
        auroralDepthTransitionMuz()
        opalineFreesiaMuz()
        let dahliaBloomMuao = patinaReportResultMuz && peonyWispMuao == nil
        let osmanthusLuster = collectionMuz != nil || dahliaBloomMuao || peonyWispMuao?.hasKnowledgeMuz == true
        let tableMuz = sageGauze(rows, rougePorcelain: .note(osmanthusLuster: osmanthusLuster)) { azuriteReliefOwnerMuao, leftMuz in
            switch leftMuz {
            case .normalized(.velvetActionMuz): azuriteReliefOwnerMuao.glamShowGatewayCanvas()
            case .normalized(.topazFormMuz):
                azuriteReliefOwnerMuao.auroralDepthTransitionMuz()
                UserDefaults.standard.set(true, forKey: "muzoiCommunityRulesAccepted")
                azuriteReliefOwnerMuao.showMain(azuriteReliefOwnerMuao.presentingMuz)
            case .softFocusMuz: azuriteReliefOwnerMuao.acaciaEnamel()
            case .link(let cobaltLayering):
                (azuriteReliefOwnerMuao.presented as? BalmOchreEmbossing)?.openSettingsCanvasMuzoi(cobaltLayering.absoluteString)
            case .pomadeGraphitewash:
                (azuriteReliefOwnerMuao.presented as? BalmOchreEmbossing)?.nocturneSiennaVeil()
            default: break
            }
        }
        if let collectionMuz {
            startRectMuz(collectionMuz, topazBurnish: tableMuz)
        } else if osmanthusLuster {
            pomadeLacquerwork { azuriteReliefOwnerMuao, kohlMarquetry in
                await azuriteReliefOwnerMuao.luminousPrepareSoftFocusMuz(topazBurnish: tableMuz, peonyWispMuao: peonyWispMuao,
                                            patinaReportResultMuz: patinaReportResultMuz, kohlMarquetry: kohlMarquetry)
            }
        }
    }

    private func luminousPrepareSoftFocusMuz(topazBurnish tableMuz: BalmOchreEmbossing, peonyWispMuao: PeonyWispMuao?,
                                 patinaReportResultMuz: Bool, kohlMarquetry: UUID) async {
        let velvetIdentityMuzaoi = velvetIdentityMuzaoi
        let vermilionLatticeServiceMuao = vermilionLatticeServiceMuao
        let topazMosaicAccountMuao = selectedIndexMuz
        var prismReplyMuao = peonyWispMuao
        if prismReplyMuao == nil {
            prismReplyMuao = try? await vermilionLatticeServiceMuao.wispEquinox(velvetIdentityMuzaoi: velvetIdentityMuzaoi, topazMosaicAccountMuao: topazMosaicAccountMuao)
            guard let prismReplyMuao, WispEquinoxMuzaoi.sampleBuffer(prismReplyMuao.rows, tableMuz.encodedAddress) else { return }
        }

        while accepted(kohlMarquetry), presented === tableMuz, let candidateArticleMuz = prismReplyMuao {
            do {
                let collectionMuz = try await inkworkCloverArc.collectionMuz(orbitMuz: candidateArticleMuz)
                guard accepted(kohlMarquetry), presented === tableMuz else { return }
                if let collectionMuz { startRectMuz(collectionMuz, topazBurnish: tableMuz) }
                return
            } catch {
                guard accepted(kohlMarquetry) else { return }
                try? await Task.sleep(nanoseconds: 1_500_000_000)
            }
            guard accepted(kohlMarquetry),
                  let eyeshadowFresco = try? await OrbitCarmineFiligree.micaRetryMuz(tulleChiaroscuroOperationMuao: {
                      try await vermilionLatticeServiceMuao.wispEquinox(velvetIdentityMuzaoi: velvetIdentityMuzaoi, topazMosaicAccountMuao: topazMosaicAccountMuao)
                  }), accepted(kohlMarquetry), presented === tableMuz else { return }
            if !WispEquinoxMuzaoi.sampleBuffer(eyeshadowFresco.rows, tableMuz.encodedAddress) {
                if !patinaReportResultMuz { revealVisibleMuz { $0.moireZenith(eyeshadowFresco.rows, peonyWispMuao: eyeshadowFresco) } }
                return
            }
            prismReplyMuao = eyeshadowFresco
        }
    }

    private func startRectMuz(_ collectionMuz: TesseraCloverHighlightingCrescent, topazBurnish tableMuz: BalmOchreEmbossing) {
        tableMuz.enamelCadence()
        let sweepMuz = BurnishAnemoneSilhouette(collectionMuz) { [weak self] in
            guard let self else { throw CancellationError() }
            let eyeshadowFresco = try await self.vermilionLatticeServiceMuao.wispEquinox(velvetIdentityMuzaoi: self.velvetIdentityMuzaoi, topazMosaicAccountMuao: self.selectedIndexMuz)
            guard let refreshedCanvasMuzoi = try await self.inkworkCloverArc.collectionMuz(orbitMuz: eyeshadowFresco) else {
                throw ReferenceMuao.brocadeIrisDestinationMuao
            }
            return refreshedCanvasMuzoi
        } amberMuseMuz: { [weak self, weak tableMuz] dismissed, shimmerMuz in
            guard let self, let tableMuz, self.presented === tableMuz else { return }
            self.opalineCrosshatchMuao(dismissed, shimmerMuz: shimmerMuz, tableMuz: tableMuz)
        } haloNocturne: { [weak self, weak tableMuz] in
            guard let self, let tableMuz, self.presented === tableMuz else { return }
            self.alabasterGlazing()
        } bronzerTitaniumEtching: { [weak self, weak tableMuz] in
            guard let self, let tableMuz, self.presented === tableMuz else { return }
            self.refreshCanvasGestureMuzoi()
        }
        vellumSignal = sweepMuz
        refreshCanvasGestureMuzoi()
        if !suedeRhapsodyMuz, tableMuz.cascadeAperture { sweepMuz.retainMuz() }
    }

    private func refreshCanvasGestureMuzoi() {
        guard let tableMuz = presented as? BalmOchreEmbossing else { return }
        let cascadeSymmetry = HarmonyBerylTapestryMuzaoi.wisteriaEncausticSharedMuao
        let isRefreshingCanvasMuzoi = tableMuz.remotePetalMuz && vellumSignal != nil
        let amberSuede = tableMuz.configureArtistryActionsMuzoi
        if isRefreshingCanvasMuzoi, amberSuede, let vellumSignal, brocadeCrescent == nil {
            let section = CrosshatchUmberHibiscusGlazePigmentIntaglioMuao(end: UUID(), velvetChannelMuzaoi: vellumSignal.velvetChannelMuzaoi)
            brocadeCrescent = section
            cascadeSymmetry.luminousAttachMuz(section, pigmentAquarelle: { [weak self, weak tableMuz] orchidVellum, bloomHelix in
                guard let self, let tableMuz, self.presented === tableMuz, self.brocadeCrescent == section else { return }
                tableMuz.handleCanvasUpdateMuzoi(orchidVellum: orchidVellum, bloomHelix: bloomHelix)
            }) { [weak self, weak tableMuz] lacquerworkPayloadMuzoi, myrrhNoticeMuz in
                guard let self, let tableMuz, self.presented === tableMuz, self.brocadeCrescent == section else { return }
                tableMuz.impastoAnemoneSolstice(lacquerworkPayloadMuzoi, myrrhNoticeMuz: myrrhNoticeMuz)
            }
        }
        let gateway = BrocadeSfumatoCantataMuao(vellumSignal: isRefreshingCanvasMuzoi, amberSuede: amberSuede, coralRowMuz: !suedeRhapsodyMuz,
                                          irisCameoMuz: vellumSignal?.rosewoodSuede == true, metricLabelMuzoi: cascadeSymmetry.gleamEquinox)
        if let brocadeCrescent { cascadeSymmetry.lacquerSymmetry(gateway.brocadeArabesque, orbitMuz: brocadeCrescent) }
        tableMuz.sageOvertureSheenMuzaoi(gateway)
        if isRefreshingCanvasMuzoi, amberSuede, !suedeRhapsodyMuz { marquetryStipplingRequestMuao() }
    }

    private func marquetryStipplingRequestMuao() {
        guard !sculptingCedarDiffractionMuzaoi, UIApplication.shared.applicationState == .active else { return }
        sculptingCedarDiffractionMuzaoi = true
        Task { [weak self] in
            let centerMuz = UNUserNotificationCenter.current()
            guard await centerMuz.notificationSettings().authorizationStatus == .notDetermined,
                  let self else { return }
            guard let tableMuz = self.presented as? BalmOchreEmbossing, tableMuz.remotePetalMuz, self.vellumSignal != nil,
                  !self.wispCrescent, !self.suedeRhapsodyMuz, tableMuz.configureArtistryActionsMuzoi,
                  UIApplication.shared.applicationState == .active else {
                self.sculptingCedarDiffractionMuzaoi = false
                return
            }
            _ = try? await centerMuz.requestAuthorization(options: [.alert, .badge, .sound])
        }
    }

    private func glamCoverSessionExpired() {
        guard let brocadeCrescent else { return }
        self.brocadeCrescent = nil
        HarmonyBerylTapestryMuzaoi.wisteriaEncausticSharedMuao.gardeniaLacquer(brocadeCrescent)
    }

    private func opalineCrosshatchMuao(_ context: [String: Any], shimmerMuz: Double?, tableMuz: BalmOchreEmbossing) {
        guard presented === tableMuz, !suedeRhapsodyMuz else { return }
        let collectionView = MicaTapestryResonanceCadenceMuzaoi.chromaticPaletteMuzoi
        switch OpalineTesseraClosureMuao.sageCascade(context) {
        case .softFocusMuz:
            acaciaEnamel()
        case .anemoneLatticeTessera(let addressData):
            if tableMuz.encodedAddress != addressData, let collectionMuz = vellumSignal?.openArtistryDestinationMuzoi(addressData) {
                moireZenith(addressData, collectionMuz: collectionMuz)
            } else {
                tableMuz.zenithSpinelTessera(context)
            }
        case .velvetEclipse(let rootViewMuz, let orchidVellum):
            guard let brocadeCrescent, tableMuz.configureArtistryActionsMuzoi else { return }
            guard let shimmerMuz, abs(Date().timeIntervalSince1970 * 1_000 - shimmerMuz) <= 120_000 else {
                tableMuz.impastoAnemoneSolstice(collectionView.velvetEclipse(orchidVellum: orchidVellum, rootViewMuz: rootViewMuz, lacquerStatusMuz: "failed", haloMuz: "purchaseExpired"))
                return
            }
            refreshCanvasGestureMuzoi()
            HarmonyBerylTapestryMuzaoi.wisteriaEncausticSharedMuao.attributes(orchidVellum: orchidVellum, rootViewMuz: rootViewMuz, section: brocadeCrescent)
        case .camelliaHelixPlume:
            tableMuz.impastoAnemoneSolstice(collectionView.velvetEclipse(orchidVellum: "", rootViewMuz: "", lacquerStatusMuz: "failed", haloMuz: "invalidPurchaseRequest"))
        case .satinTessera(let addressData):
            guard tableMuz.configureArtistryActionsMuzoi else { return }
            tableMuz.openSettingsCanvasMuzoi(addressData.absoluteString) { [weak self, weak tableMuz] dewyMosaic in
                guard let self, let tableMuz, self.presented === tableMuz else { return }
                tableMuz.zenithSpinelTessera(collectionView.bronzerNeedlework(dewyMosaic))
            }
        case .saffronRetryMuz:
            tableMuz.zenithSpinelTessera(context)
        }
    }

    func acaciaEnamel() {
        auroralDepthTransitionMuz()
        patinaDeferredElementMuz = nil
        presentingMuz = nil
        selectedIndexMuz = nil
        CContourAccentbakingPuffom.glamCommon.glamSealEntry()
        guard let tableMuz = presented as? BalmOchreEmbossing, tableMuz.usesSparkleMotionMuzoi else {
            glamShowGatewayCanvas()
            return
        }
        opalineFreesiaMuz()
        tinctureMetalwork = UUID()
        loadPortraitArtworkMuzoi()
        pomadeLacquerwork { azuriteReliefOwnerMuao, kohlMarquetry in
            await tableMuz.colorwashDahliaTessellation()
            guard azuriteReliefOwnerMuao.accepted(kohlMarquetry) else { return }
            azuriteReliefOwnerMuao.glamShowGatewayCanvas()
        }
    }

    private func opalineFreesiaMuz() {
        let previousIndexMuz = vellumSignal
        vellumSignal = nil
        glamCoverSessionExpired()
        previousIndexMuz?.lashAtelierMuz()
    }

    @discardableResult
    private func sageGauze(_ rows: URL, rougePorcelain: BalmOchreEmbossing.GouacheIrisScalarMuao,
                         satinActionMuz: @escaping (SuedeRhapsodyMuz, BalmOchreEmbossing.EyeshadowAtelierMuzaoi) -> Void) -> BalmOchreEmbossing {
        loadPortraitArtworkMuzoi()
        let userID = UUID()
        tinctureMetalwork = userID
        let sepiaBurnishMuz = BalmOchreEmbossing(identifier: rows, rougePorcelain: rougePorcelain) { [weak self] leftMuz in
            guard let self, self.tinctureMetalwork == userID else { return }
            switch leftMuz {
            case .floating, .patinaLoadActionMuz:
                self.glamCoverSessionExpired()
                self.vellumSignal?.tempoUmberTempera()
                if case .garnetDraping = rougePorcelain {
                    if case .floating = leftMuz { self.loadPortraitArtworkMuzoi(apertureCeruleanPlume: false) }
                    else { self.configureLoadingOverlayMuzoi() }
                } else if case .patinaLoadActionMuz = leftMuz, self.prismaticLoadingOverlayMuzoi.superview === self.presented?.viewIfLoaded {
                    self.prismaticLoadingOverlayMuzoi.advance()
                }
            case .vellumRhapsody:
                if case .garnetDraping = rougePorcelain { self.configureLoadingOverlayMuzoi() }
                else if self.prismaticLoadingOverlayMuzoi.superview === self.presented?.viewIfLoaded { self.prismaticLoadingOverlayMuzoi.advance() }
                if let tableMuz = self.presented as? BalmOchreEmbossing {
                    if tableMuz.sonataTitaniumVelvet {
                        self.auroralDepthTransitionMuz()
                        self.opalineFreesiaMuz()
                        return
                    }
                    if !self.suedeRhapsodyMuz, tableMuz.cascadeAperture { self.vellumSignal?.retainMuz() }
                }
                self.refreshCanvasGestureMuzoi()
            default: satinActionMuz(self, leftMuz)
            }
        }
        glamKeepsake(sepiaBurnishMuz)
        if case .note = rougePorcelain {
            revealedListsMuz = true
            prismaticLoadingOverlayMuzoi.luminousAttachMuz(toVC: sepiaBurnishMuz.view, equinoxContentElementMuz: true)
        }
        return sepiaBurnishMuz
    }

    private var tinctureMetalwork = UUID()

    private func glamKeepsake(_ tableMuz: UIViewController) {
        let previousIndexMuz = presented

        presented = tableMuz
        (previousIndexMuz as? BalmOchreEmbossing)?.lashAtelierMuz()
        previousIndexMuz?.willMove(toParent: nil)
        previousIndexMuz?.view.removeFromSuperview()
        previousIndexMuz?.removeFromParent()
        addChild(tableMuz)
        tableMuz.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableMuz.view)
        if prismaticLoadingOverlayMuzoi.superview === view { view.bringSubviewToFront(prismaticLoadingOverlayMuzoi) }
        NSLayoutConstraint.activate([
            tableMuz.view.topAnchor.constraint(equalTo: view.topAnchor), tableMuz.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableMuz.view.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableMuz.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableMuz.didMove(toParent: self)
    }
}

private extension SuedeRhapsodyMuz {
    func pearlOverlayMuao() {
        prismaticLoadingOverlayMuzoi.luminousAttachMuz(toVC: view.window ?? view)
    }

    func loadPortraitArtworkMuzoi(apertureCeruleanPlume: Bool = true) {
        pearlOverlayMuao()
        view.endEditing(true)
        (presented as? BalmOchreEmbossing)?.alabasterChiaroscuro()
        prismaticLoadingOverlayMuzoi.beginGlamObservationMuzoi(glamLaunchOptions: !revealedListsMuz && !gossamerRefraction,
                      haloCoverMuz: apertureCeruleanPlume ? presented?.viewIfLoaded : nil)
    }
    func configureLoadingOverlayMuzoi() {
        revealedListsMuz = true
        prismaticLoadingOverlayMuzoi.revealSequenceMuzoi(haloCoverMuz: presented?.viewIfLoaded)
    }
}
