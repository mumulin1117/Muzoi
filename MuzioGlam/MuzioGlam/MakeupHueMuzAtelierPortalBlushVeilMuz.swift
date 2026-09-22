import UIKit
import WebKit

private final class NacreousPetalHaloMuz: UIView {
    private let opalineAura = CAShapeLayer()
    private let roseQuartzCirclet = CAGradientLayer()
    private let roseQuartzContour = CAShapeLayer()
    private let camelliaCompact = CALayer()
    private let velvetCasing = CAShapeLayer()
    private let nacreMirror = CAShapeLayer()
    private let petalTray = CAShapeLayer()
    private let freesiaPowders = [CAShapeLayer(), CAShapeLayer(), CAShapeLayer()]
    private let saffronHandle = CAShapeLayer()
    private let sableBristles = CAShapeLayer()
    private let scintillaAccents = [CAShapeLayer(), CAShapeLayer(), CAShapeLayer()]

    override init(frame: CGRect) {
        super.init(frame: frame)
        enamelPetalComposition()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        enamelPetalComposition()
    }

    private func enamelPetalComposition() {
        isHidden = true
        isUserInteractionEnabled = false
        accessibilityElementsHidden = true

        opalineAura.fillColor = UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 0.14).cgColor
        opalineAura.shadowColor = UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 1).cgColor
        opalineAura.shadowOpacity = 0.34
        opalineAura.shadowRadius = 14
        layer.addSublayer(opalineAura)

        roseQuartzCirclet.type = .conic
        roseQuartzCirclet.colors = [
            UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.84, blue: 0.58, alpha: 1).cgColor,
            UIColor(red: 0.99, green: 0.94, blue: 0.91, alpha: 1).cgColor,
            UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 1).cgColor
        ]
        roseQuartzCirclet.startPoint = CGPoint(x: 0.5, y: 0)
        roseQuartzCirclet.endPoint = CGPoint(x: 0.5, y: 1)
        roseQuartzContour.fillColor = UIColor.clear.cgColor
        roseQuartzContour.strokeColor = UIColor.white.cgColor
        roseQuartzContour.lineWidth = 3
        roseQuartzContour.lineCap = .round
        roseQuartzContour.lineDashPattern = [11, 7]
        roseQuartzCirclet.mask = roseQuartzContour
        layer.addSublayer(roseQuartzCirclet)

        layer.addSublayer(camelliaCompact)
        [velvetCasing, nacreMirror, petalTray].forEach(camelliaCompact.addSublayer)
        freesiaPowders.forEach(camelliaCompact.addSublayer)
        camelliaCompact.addSublayer(saffronHandle)
        camelliaCompact.addSublayer(sableBristles)

        velvetCasing.fillColor = UIColor(red: 0.18, green: 0.10, blue: 0.22, alpha: 1).cgColor
        velvetCasing.strokeColor = UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 0.92).cgColor
        velvetCasing.lineWidth = 1.5
        nacreMirror.fillColor = UIColor(red: 0.99, green: 0.90, blue: 0.94, alpha: 1).cgColor
        nacreMirror.strokeColor = UIColor.white.withAlphaComponent(0.72).cgColor
        nacreMirror.lineWidth = 1
        petalTray.fillColor = UIColor(red: 0.23, green: 0.13, blue: 0.28, alpha: 1).cgColor
        petalTray.strokeColor = UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 0.76).cgColor
        petalTray.lineWidth = 1

        let powderTints = [
            UIColor(red: 0.95, green: 0.48, blue: 0.70, alpha: 1),
            UIColor(red: 0.97, green: 0.70, blue: 0.58, alpha: 1),
            UIColor(red: 0.97, green: 0.82, blue: 0.50, alpha: 1)
        ]
        for (powder, tint) in zip(freesiaPowders, powderTints) {
            powder.fillColor = tint.cgColor
            powder.strokeColor = UIColor.white.withAlphaComponent(0.45).cgColor
            powder.lineWidth = 0.7
        }

        saffronHandle.fillColor = UIColor.clear.cgColor
        saffronHandle.strokeColor = UIColor(red: 1, green: 0.85, blue: 0.61, alpha: 1).cgColor
        saffronHandle.lineWidth = 4
        saffronHandle.lineCap = .round
        sableBristles.fillColor = UIColor(red: 0.96, green: 0.51, blue: 0.74, alpha: 1).cgColor

        scintillaAccents.forEach {
            $0.fillColor = UIColor(red: 1, green: 0.90, blue: 0.67, alpha: 1).cgColor
            $0.shadowColor = UIColor(red: 1, green: 0.78, blue: 0.48, alpha: 1).cgColor
            $0.shadowOpacity = 0.72
            $0.shadowRadius = 5
            layer.addSublayer($0)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let extent = min(bounds.width, bounds.height)
        guard extent > 0 else { return }
        let inset = (max(bounds.width, bounds.height) - extent) / 2
        let canvas = bounds.width >= bounds.height
            ? CGRect(x: inset, y: 0, width: extent, height: extent)
            : CGRect(x: 0, y: inset, width: extent, height: extent)
        let scale = extent / 96
        let point: (CGFloat, CGFloat) -> CGPoint = { x, y in CGPoint(x: canvas.minX + x * scale, y: canvas.minY + y * scale) }
        let rect: (CGFloat, CGFloat, CGFloat, CGFloat) -> CGRect = { x, y, width, height in
            CGRect(x: canvas.minX + x * scale, y: canvas.minY + y * scale, width: width * scale, height: height * scale)
        }

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        opalineAura.path = UIBezierPath(ovalIn: rect(14, 14, 68, 68)).cgPath
        opalineAura.shadowPath = opalineAura.path
        roseQuartzCirclet.frame = bounds
        roseQuartzContour.frame = bounds
        roseQuartzContour.path = UIBezierPath(ovalIn: rect(8, 8, 80, 80)).cgPath
        roseQuartzContour.lineWidth = 3 * scale
        camelliaCompact.frame = bounds
        velvetCasing.path = UIBezierPath(ovalIn: rect(29, 21, 38, 38)).cgPath
        velvetCasing.lineWidth = 1.5 * scale
        nacreMirror.path = UIBezierPath(ovalIn: rect(34, 26, 28, 28)).cgPath
        nacreMirror.lineWidth = scale
        petalTray.path = UIBezierPath(roundedRect: rect(25, 53, 46, 23), cornerRadius: 11 * scale).cgPath
        petalTray.lineWidth = scale
        for (index, powder) in freesiaPowders.enumerated() {
            powder.path = UIBezierPath(ovalIn: rect(32 + CGFloat(index) * 12, 60, 8, 8)).cgPath
            powder.lineWidth = 0.7 * scale
        }
        let handlePath = UIBezierPath()
        handlePath.move(to: point(65, 31))
        handlePath.addLine(to: point(39, 62))
        saffronHandle.path = handlePath.cgPath
        saffronHandle.lineWidth = 4 * scale
        let bristlePath = UIBezierPath()
        bristlePath.move(to: point(67, 28))
        bristlePath.addCurve(to: point(70, 38), controlPoint1: point(74, 29), controlPoint2: point(75, 34))
        bristlePath.addLine(to: point(63, 36))
        bristlePath.close()
        sableBristles.path = bristlePath.cgPath
        let accentPoints = [(72.0, 19.0, 6.0), (18.0, 50.0, 4.0), (73.0, 71.0, 3.5)]
        for (accent, values) in zip(scintillaAccents, accentPoints) {
            accent.path = opalineScintillaPath(center: point(values.0, values.1), radius: values.2 * scale)
        }
        CATransaction.commit()
    }

    private func opalineScintillaPath(center: CGPoint, radius: CGFloat) -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: center.x, y: center.y - radius))
        path.addLine(to: CGPoint(x: center.x + radius * 0.34, y: center.y - radius * 0.34))
        path.addLine(to: CGPoint(x: center.x + radius, y: center.y))
        path.addLine(to: CGPoint(x: center.x + radius * 0.34, y: center.y + radius * 0.34))
        path.addLine(to: CGPoint(x: center.x, y: center.y + radius))
        path.addLine(to: CGPoint(x: center.x - radius * 0.34, y: center.y + radius * 0.34))
        path.addLine(to: CGPoint(x: center.x - radius, y: center.y))
        path.addLine(to: CGPoint(x: center.x - radius * 0.34, y: center.y - radius * 0.34))
        path.close()
        return path.cgPath
    }

    func nacreousStipplingMuz() {
        isHidden = false
        layoutIfNeeded()
        roseQuartzCirclet.removeAllAnimations()
        opalineAura.removeAllAnimations()
        camelliaCompact.removeAllAnimations()
        scintillaAccents.forEach { $0.removeAllAnimations() }
        guard !UIAccessibility.isReduceMotionEnabled else { return }

        let orbit = CABasicAnimation(keyPath: NacreousPastelOvertureOpus("txrxaxnxsxfxoxrxmx.xrxoxtxaxtxixoxnx.xzx"))
        orbit.fromValue = 0
        orbit.toValue = CGFloat.pi * 2
        orbit.duration = 2.4
        orbit.repeatCount = .infinity
        roseQuartzCirclet.add(orbit, forKey: nil)

        let breathing = CABasicAnimation(keyPath: NacreousPastelOvertureOpus("oxpxaxcxixtxyx"))
        breathing.fromValue = 0.36
        breathing.toValue = 0.88
        breathing.duration = 1.2
        breathing.autoreverses = true
        breathing.repeatCount = .infinity
        opalineAura.add(breathing, forKey: nil)

        let floating = CAKeyframeAnimation(keyPath: NacreousPastelOvertureOpus("txrxaxnxsxfxoxrxmx.xtxrxaxnxsxlxaxtxixoxnx.xyx"))
        floating.values = [0, -3, 0]
        floating.keyTimes = [0, 0.5, 1]
        floating.duration = 1.8
        floating.repeatCount = .infinity
        camelliaCompact.add(floating, forKey: nil)

        for (index, accent) in scintillaAccents.enumerated() {
            let twinkle = CAKeyframeAnimation(keyPath: NacreousPastelOvertureOpus("oxpxaxcxixtxyx"))
            twinkle.values = [0.24, 1, 0.24]
            twinkle.keyTimes = [0, 0.5, 1]
            twinkle.duration = 1.1 + Double(index) * 0.24
            twinkle.beginTime = CACurrentMediaTime() + Double(index) * 0.16
            twinkle.repeatCount = .infinity
            accent.add(twinkle, forKey: nil)
        }
    }

    func opalineFreesiaMuz() {
        roseQuartzCirclet.removeAllAnimations()
        opalineAura.removeAllAnimations()
        camelliaCompact.removeAllAnimations()
        scintillaAccents.forEach { $0.removeAllAnimations() }
        isHidden = true
    }
}

private final class PowderHaloMuzAtelierNoteProxy: NSObject, WKScriptMessageHandler {
    weak var lacquerHibiscusLayeringResonance: MakeupHueMuzAtelierPortalBlushVeilMuz?
    func userContentController(_ userContentController: WKUserContentController, didReceive vellumSignal: WKScriptMessage) {
        lacquerHibiscusLayeringResonance?.tracerySiennaGauze(vellumSignal)
    }
}

final class MakeupHueMuzAtelierPortalBlushVeilMuz: UIViewController, WKNavigationDelegate, WKUIDelegate {
    private var iridescentParchmentArcAllegro: CloverCadenceGlazeMuzaoi
    private let plumeOsmanthusWaterlineSilhouette = PowderHaloMuzAtelierNoteProxy()
    private var portalSurface: WKWebView!
    private let velvetPetalLoadingVeil = UIView()
    private let lotusZenithEnamel = UILabel()
    private let facetNeroliCutcreaseRefraction = NacreousPetalHaloMuz()
    private let malachiteLacquerworkTraceryArpeggio = UIButton(type: .system)
    private let lyricMoonstoneTapestry = UIButton(type: .system)
    private var magnoliaFiligreeMuzaoi = false
    private var preludeLipChiffonParchment = false
    private var gossamerStippleSonority = false
    private var scrollworkCoralCascade = false
    private var carmineLacquerworkTessellationLegato = false
    private var pigmentInlay: String?
    private var glazingTitaniumWisteriaPrism = Set<String>()
    private var rhapsodyPrismaticSheen: [LipParchmentMuzaoi] = []
    private var haloArabesque = false
    private var ceruleanLayering: [NSObjectProtocol] = []
    private var stipplingPoppyAria: DispatchWorkItem?
    private var scherzoBerylPorcelain: DispatchWorkItem?
    private var mistSageSfumatoScrollwork: URL?
    private var tempoTourmalineRelief: Bool?

    init(filigreeEmbossingEtude: FiligreeEmbossingEtudeMuzaoi, cascadeSfumatoSerenadeMuao: String, brocadeCrescent: String) {
        iridescentParchmentArcAllegro = CloverCadenceGlazeMuzaoi(sepiaEtchingMuzaoi: filigreeEmbossingEtude, pigmentNacreousUnderpaintingMuzaoi: cascadeSfumatoSerenadeMuao, impastoWisteriaLatticeMuzaoi: brocadeCrescent)
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
    private var allegroSaffronCharcoal: Bool {
        UserDefaults.standard.bool(forKey: NacreousPastelOvertureOpus("mRuxzroTilLgocgjgAeJdEInnU")) && UserDefaults.standard.string(forKey: NacreousPastelOvertureOpus("meuXz2oqivC7uLr6rAecndt8UIsae2r3IxDQ")) == iridescentParchmentArcAllegro.impastoWisteriaLatticeMuzaoi
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.12, alpha: 1)
        let brocadePeonyUnderpaintingCrescent = WKWebViewConfiguration()
        brocadePeonyUnderpaintingCrescent.websiteDataStore = .nonPersistent()
        brocadePeonyUnderpaintingCrescent.allowsInlineMediaPlayback = true
        brocadePeonyUnderpaintingCrescent.mediaTypesRequiringUserActionForPlayback = []
        plumeOsmanthusWaterlineSilhouette.lacquerHibiscusLayeringResonance = self
        brocadePeonyUnderpaintingCrescent.userContentController.add(plumeOsmanthusWaterlineSilhouette, name: NacreousPastelOvertureOpus("rAoqonm4BVrfiLdJgmeB"))
        portalSurface = WKWebView(frame: .zero, configuration: brocadePeonyUnderpaintingCrescent)
        portalSurface.translatesAutoresizingMaskIntoConstraints = false
        portalSurface.isOpaque = false; portalSurface.backgroundColor = view.backgroundColor
        portalSurface.scrollView.backgroundColor = view.backgroundColor
        portalSurface.scrollView.contentInsetAdjustmentBehavior = .never
        portalSurface.scrollView.keyboardDismissMode = .interactive
        portalSurface.navigationDelegate = self; portalSurface.uiDelegate = self
        portalSurface.allowsBackForwardNavigationGestures = false
        view.addSubview(portalSurface)
        velvetPetalLoadingVeil.translatesAutoresizingMaskIntoConstraints = false
        velvetPetalLoadingVeil.backgroundColor = view.backgroundColor
        view.addSubview(velvetPetalLoadingVeil)
        lotusZenithEnamel.textColor = .white; lotusZenithEnamel.numberOfLines = 0; lotusZenithEnamel.textAlignment = .center
        lotusZenithEnamel.font = .systemFont(ofSize: 15)
        malachiteLacquerworkTraceryArpeggio.setTitle(NacreousPastelOvertureOpus("RyeGtlrsyT"), for: .normal); malachiteLacquerworkTraceryArpeggio.tintColor = UIColor(red: 0.9, green: 0.49, blue: 1, alpha: 1)
        malachiteLacquerworkTraceryArpeggio.addTarget(self, action: #selector(chromaticSweeping), for: .touchUpInside)
        lyricMoonstoneTapestry.setImage(UIImage(systemName: NacreousPastelOvertureOpus("czhCeivnr7ognO.glbeDf9t1")), for: .normal); lyricMoonstoneTapestry.tintColor = .white
        lyricMoonstoneTapestry.accessibilityLabel = NacreousPastelOvertureOpus("L6e9aKvFem srFoLoNmt")
        lyricMoonstoneTapestry.addTarget(self, action: #selector(arabesqueOpalineMoire), for: .touchUpInside)
        for item in [lotusZenithEnamel, facetNeroliCutcreaseRefraction, malachiteLacquerworkTraceryArpeggio, lyricMoonstoneTapestry] { item.translatesAutoresizingMaskIntoConstraints = false; velvetPetalLoadingVeil.addSubview(item) }
        NSLayoutConstraint.activate([
            portalSurface.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            portalSurface.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            portalSurface.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            portalSurface.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            velvetPetalLoadingVeil.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            velvetPetalLoadingVeil.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            velvetPetalLoadingVeil.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            velvetPetalLoadingVeil.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            lotusZenithEnamel.centerXAnchor.constraint(equalTo: velvetPetalLoadingVeil.centerXAnchor),
            lotusZenithEnamel.centerYAnchor.constraint(equalTo: velvetPetalLoadingVeil.centerYAnchor),
            lotusZenithEnamel.leadingAnchor.constraint(greaterThanOrEqualTo: velvetPetalLoadingVeil.leadingAnchor, constant: 24),
            lotusZenithEnamel.trailingAnchor.constraint(lessThanOrEqualTo: velvetPetalLoadingVeil.trailingAnchor, constant: -24),
            facetNeroliCutcreaseRefraction.centerXAnchor.constraint(equalTo: lotusZenithEnamel.centerXAnchor), facetNeroliCutcreaseRefraction.bottomAnchor.constraint(equalTo: lotusZenithEnamel.topAnchor, constant: -18),
            facetNeroliCutcreaseRefraction.widthAnchor.constraint(equalToConstant: 96), facetNeroliCutcreaseRefraction.heightAnchor.constraint(equalToConstant: 96),
            malachiteLacquerworkTraceryArpeggio.topAnchor.constraint(equalTo: lotusZenithEnamel.bottomAnchor, constant: 16), malachiteLacquerworkTraceryArpeggio.centerXAnchor.constraint(equalTo: lotusZenithEnamel.centerXAnchor),
            malachiteLacquerworkTraceryArpeggio.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            lyricMoonstoneTapestry.topAnchor.constraint(equalTo: velvetPetalLoadingVeil.topAnchor, constant: 2),
            lyricMoonstoneTapestry.leadingAnchor.constraint(equalTo: velvetPetalLoadingVeil.leadingAnchor, constant: 8),
            lyricMoonstoneTapestry.widthAnchor.constraint(equalToConstant: 44), lyricMoonstoneTapestry.heightAnchor.constraint(equalToConstant: 44)
        ])
        ceruleanLayering.append(NotificationCenter.default.addObserver(forName: .preludeQuartzMarquetryMuzaoi, object: nil, queue: .main) { [weak self] tempoUmberTempera in
            guard let self, let credit = tempoUmberTempera.object as? LipParchmentMuzaoi,
                  self.allegroSaffronCharcoal, credit.impastoWisteriaLatticeMuzaoi == self.iridescentParchmentArcAllegro.impastoWisteriaLatticeMuzaoi, !self.preludeLipChiffonParchment else { return }
            if !self.rhapsodyPrismaticSheen.contains(where: { tessellationCeladonPatinaMuzaoi in tessellationCeladonPatinaMuzaoi.contouringUltramarineAcaciaVeilMuzaoi == credit.contouringUltramarineAcaciaVeilMuzaoi }) { self.rhapsodyPrismaticSheen.append(credit) }
            self.alabasterChiaroscuro()
        })
        ceruleanLayering.append(NotificationCenter.default.addObserver(forName: TesseraCeruleanAtelierMuao.camelliaPatinaSignalMuao, object: nil, queue: .main) { [weak self] camelliaArcCascade in
            guard let self, !self.allegroSaffronCharcoal else { return }
            self.cascadeAperture()
        })
        for name in [UIResponder.keyboardWillShowNotification, UIResponder.keyboardWillHideNotification] {
            ceruleanLayering.append(NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { [weak self] flourishBerylSilk in
                self?.intervalOchrePorcelain(flourishBerylSilk)
            })
        }
        jasmineOvertureWisp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if tempoTourmalineRelief == nil { tempoTourmalineRelief = navigationController?.interactivePopGestureRecognizer?.isEnabled }
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carmineLacquerworkTessellationLegato = false
        if !allegroSaffronCharcoal { cascadeAperture(); return }
        alabasterChiaroscuro()
        if let brocadeCrescent = pigmentInlay, magnoliaFiligreeMuzaoi {
            pigmentInlay = nil
            let topazAquarelleOvertureLyric: [String: Any] = [NacreousPastelOvertureOpus("pirKoKtBoWcUo4lsVjenrSsaiCoJnj"): 1, NacreousPastelOvertureOpus("kliNnhdA"): NacreousPastelOvertureOpus("e8vNeanltD"), NacreousPastelOvertureOpus("ngaNmved"): NacreousPastelOvertureOpus("porJocfYiUlvet.LcxlcoxsZecdZ"), NacreousPastelOvertureOpus("pJaJyBlZoxaTd3"): [NacreousPastelOvertureOpus("uUsreHrHIrdf"): brocadeCrescent]]
            portalSurface.callAsyncJavaScript(NacreousPastelOvertureOpus("wdiznhd8olwe.Q_H_YRdOZOHMj_gHC5L_jBORAINDoGXE0_gRWEtC1EaIQVYEW_T_d?z.h(8mleesQsHaYgdeZ)H"), arguments: [NacreousPastelOvertureOpus("mVevskstaQgBeu"): topazAquarelleOvertureLyric], in: nil, in: .page, completionHandler: nil)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let enabled = tempoTourmalineRelief { navigationController?.interactivePopGestureRecognizer?.isEnabled = enabled }
        tempoTourmalineRelief = nil
        if isMovingFromParent || isBeingDismissed { pigmentNacreousUnderpainting() }
    }
    deinit {
        stipplingPoppyAria?.cancel(); scherzoBerylPorcelain?.cancel()
        ceruleanLayering.forEach(NotificationCenter.default.removeObserver)
        portalSurface?.configuration.userContentController.removeScriptMessageHandler(forName: NacreousPastelOvertureOpus("rAoqonm4BVrfiLdJgmeB"))
    }
    @objc private func chromaticSweeping() {
        guard !preludeLipChiffonParchment, !gossamerStippleSonority else { return }
        // A reload must receive a fresh URL: H5 deliberately removes its token from the address.
        portalSurface.callAsyncJavaScript(NacreousPastelOvertureOpus("a6wjaiibtO swKign1daoNwc.y_8_8MqUyZaO0Iq_QRoOEOvMp_sD4IDSuPcOVS6E6_j_i?b.O(s)K"), arguments: [:], in: nil, in: .page) { [weak self] peonyArabesqueShimmer in self?.jasmineOvertureWisp() }
    }
    private func jasmineOvertureWisp() {
        guard allegroSaffronCharcoal, let token = PigmentAtelierMuzCoverSession.wisteriaEncausticSharedMuao.ceruleanPatinaAccessMuao else {
            tesseraHighlightingHarmony(NacreousPastelOvertureOpus("Y5oPuerO fsYe4sdsLiNoFnz ch4aWs9 1enx2p5iMrreKdG.i nPPl3eGaRs1eV 5sPiegOnf Yi4nd LaNgFazicn4.W")); return
        }
        guard let directory = Bundle.main.resourceURL?.appendingPathComponent(NacreousPastelOvertureOpus("MnuazcorieToiupspplaesctrealfotvVeerrtmoin"), isDirectory: true),
              FileManager.default.fileExists(atPath: directory.appendingPathComponent(NacreousPastelOvertureOpus("ion5djeWxi.AhetCmXl6")).path) else {
            tesseraHighlightingHarmony(NacreousPastelOvertureOpus("Rbofopm9 MrUeesCodunrrcGeIsr Sa0rcer CuDncarv7adiJl9aybOlee2.Z")); return
        }
        let cadenceMicaScintilla = directory.appendingPathComponent(NacreousPastelOvertureOpus("ion5djeWxi.AhetCmXl6"))
        guard let lotusAuraMuz = iridescentParchmentArcAllegro.crosshatchSpectralJuniperAuraMuzaoi(embossingUltramarineMyrrhScintillaMuzaoi: cadenceMicaScintilla, featheringTopazPeonyWispMuzaoi: token, chromaticGraphitewashOvertureIntervalMuzaoi: Bundle.main.infoDictionary?[NacreousPastelOvertureOpus("C8FmB0uCnddNldecSehVoarot3VOehrgs3i2oSn2SBtXr5iknjgs")] as? String ?? NacreousPastelOvertureOpus("1d.d1H.o0e"),
                                  adagioPrimerLusterParchmentMuzaoi: TesseraCeruleanAtelierMuao.graphitewashLotusImprintMuao, enamelGardeniaEmbossingSilhouetteMuzaoi: NacreousPastelOvertureOpus("eHnz")) else {
            tesseraHighlightingHarmony(NacreousPastelOvertureOpus("Tbh1izsm jreoOowmd 0lgiQnHku riAsk Xi4nXvRaglziudf.0")); return
        }
        magnoliaFiligreeMuzaoi = false; glazingTitaniumWisteriaPrism.removeAll(); mistSageSfumatoScrollwork = cadenceMicaScintilla
        velvetPetalLoadingVeil.isHidden = false; lotusZenithEnamel.text = NacreousPastelOvertureOpus("AM ulziotitGllea msNpaacrrkeloeu siPse tlaolaCdaidnegn.c.e.M"); lotusZenithEnamel.isHidden = false; malachiteLacquerworkTraceryArpeggio.isHidden = true; lyricMoonstoneTapestry.isHidden = false; facetNeroliCutcreaseRefraction.nacreousStipplingMuz()
        portalSurface.isHidden = false
        stipplingPoppyAria?.cancel()
        let gildingSaffronVerbenaRipple = DispatchWorkItem { [weak self] in self?.tesseraHighlightingHarmony(NacreousPastelOvertureOpus("TbhceV DrNoSoPmb ciTsl itxahkri7nkgG elcoAnXgvebrE 1tXoc Yo3p8eGnb.c VCDhNeScPkb cyToluirx hcro7nknGeecctAiXovnb Ea1nXdc Yr3e8tGrbyc.V")) }
        stipplingPoppyAria = gildingSaffronVerbenaRipple; DispatchQueue.main.asyncAfter(deadline: .now() + 40, execute: gildingSaffronVerbenaRipple)
        portalSurface.loadFileURL(lotusAuraMuz, allowingReadAccessTo: directory)
    }
    private func tinctureQuartzWaterline(_ lotusAuraMuz: URL?) -> Bool {
        guard let lotusAuraMuz, let mistSageSfumatoScrollwork, lotusAuraMuz.isFileURL else { return false }
        return lotusAuraMuz.standardizedFileURL.path == mistSageSfumatoScrollwork.standardizedFileURL.path
    }
    private func intervalOchrePorcelain(_ flourishBerylSilk: Notification) {
        guard let endFrame = flourishBerylSilk.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let frame = view.convert(endFrame.cgRectValue, from: nil)
        let impastoAnemoneSolstice = flourishBerylSilk.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
        // keyboardLayoutGuide resizes the WebView. Measure only the remaining overlap,
        // rather than adding the keyboard's full height a second time to WebKit.
        UIView.animate(withDuration: impastoAnemoneSolstice, animations: { self.view.layoutIfNeeded() }) { [weak self] iridescentWaterlineMuzaoi in
            guard let self else { return }
            let sepiaDraping = self.portalSurface.convert(self.portalSurface.bounds, to: self.view)
            let chiaroscuroNeroliHelixMuzaoi = sepiaDraping.intersection(frame)
            let marblingIrisContour = chiaroscuroNeroliHelixMuzaoi.isNull ? 0 : max(0, chiaroscuroNeroliHelixMuzaoi.height)
            self.portalSurface.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: marblingIrisContour, right: 0)
            self.portalSurface.scrollView.scrollIndicatorInsets = self.portalSurface.scrollView.contentInset
        }
    }
    fileprivate func tracerySiennaGauze(_ vellumSignal: WKScriptMessage) {
        guard vellumSignal.name == NacreousPastelOvertureOpus("rAoqonm4BVrfiLdJgmeB"), vellumSignal.frameInfo.isMainFrame, tinctureQuartzWaterline(vellumSignal.frameInfo.request.url),
              allegroSaffronCharcoal, let command = CarmineAtelierCadencePreludeMuzaoi(vellumSignal.body), !preludeLipChiffonParchment else { return }
        guard glazingTitaniumWisteriaPrism.insert(command.ceruleanVeiningMuzaoi).inserted else { return }
        if glazingTitaniumWisteriaPrism.count > 256 { glazingTitaniumWisteriaPrism = [command.ceruleanVeiningMuzaoi] }
        // The H5 shell can switch rooms internally; commands refer to its active context.
        iridescentParchmentArcAllegro = CloverCadenceGlazeMuzaoi(sepiaEtchingMuzaoi: command.sepiaEtchingMuzaoi, pigmentNacreousUnderpaintingMuzaoi: command.pigmentNacreousUnderpaintingMuzaoi, impastoWisteriaLatticeMuzaoi: iridescentParchmentArcAllegro.impastoWisteriaLatticeMuzaoi)
        switch command.carmineReliefTessellationTimbreMuzaoi {
        case .spinelImpastoMuzaoi:
            magnoliaFiligreeMuzaoi = true; stipplingPoppyAria?.cancel(); velvetPetalLoadingVeil.isHidden = true; lotusZenithEnamel.isHidden = true; malachiteLacquerworkTraceryArpeggio.isHidden = true; lyricMoonstoneTapestry.isHidden = true; facetNeroliCutcreaseRefraction.opalineFreesiaMuz()
            alabasterChiaroscuro()
        case .gossamerStippleSonorityMuzaoi(let tracingJasmineApertureMuzaoi):
            if tracingJasmineApertureMuzaoi == NacreousPastelOvertureOpus("ajuotWhy-CiCnwvSadlpijdy"), !scrollworkCoralCascade { contouringMagnoliaCrescentMuz() }
            else { cascadeAperture() }
        case .suedeAmberImpastoContourMuzaoi:
            guard !carmineLacquerworkTessellationLegato, !gossamerStippleSonority, navigationController?.topViewController === self else { return }
            carmineLacquerworkTessellationLegato = true
            navigationController?.pushViewController(GlshimmerAtelierWhile(), animated: true)
        case .labradoriteBlendingMuzaoi(let brocadeCrescent):
            guard magnoliaFiligreeMuzaoi, !gossamerStippleSonority, navigationController?.topViewController === self else { return }
            pigmentInlay = brocadeCrescent
            navigationController?.pushViewController(MascaraTintMuzProfileCosmeticShadeMuz(thymeRhapsodySilkHighlighterMicaTracing: brocadeCrescent), animated: true)
        }
    }
    private func contouringMagnoliaCrescentMuz() {
        guard !gossamerStippleSonority, allegroSaffronCharcoal else { return }
        gossamerStippleSonority = true; scrollworkCoralCascade = true; magnoliaFiligreeMuzaoi = false
        RadiantPaletteMuzCoverAPI.wisteriaEncausticSharedMuao.cobaltGouacheRenewMuao { [weak self] balmIntaglio in
            guard let self else { return }
            self.gossamerStippleSonority = false
            guard self.allegroSaffronCharcoal, !self.preludeLipChiffonParchment else { self.cascadeAperture(); return }
            switch balmIntaglio {
            case .success:
                self.portalSurface.callAsyncJavaScript(NacreousPastelOvertureOpus("a6wjaiibtO swKign1daoNwc.y_8_8MqUyZaO0Iq_QRoOEOvMp_sD4IDSuPcOVS6E6_j_i?b.O(s)K"), arguments: [:], in: nil, in: .page) { [weak self] brocadeAcaciaDrapingVortex in self?.jasmineOvertureWisp() }
            case .failure: self.tesseraHighlightingHarmony(NacreousPastelOvertureOpus("YGopuirI lsVeYsLsAiuo1no qccoIuMlpdv enOoFtt 4bOep krzeWf5rseEsWhGepdi.I lPVlYeLaAsue1 orqectIuMrpnv eaOnFdt 4sOipgknz Wi5ns EaWgGapiinI.l"))
            }
        }
    }
    private func alabasterChiaroscuro() {
        guard magnoliaFiligreeMuzaoi, allegroSaffronCharcoal, !carmineLacquerworkTessellationLegato, !preludeLipChiffonParchment, !haloArabesque, navigationController?.topViewController === self, let credit = rhapsodyPrismaticSheen.first else { return }
        haloArabesque = true
        portalSurface.callAsyncJavaScript(NacreousPastelOvertureOpus("cNoknisZtx GrPevcOebiovXeF v=R 7wviXnIdtoWwo.e_E_RR4OzOoMP_8H552_NBkRiIZDxGGEP_vROEbCoEXIFVvER_7_v;X IitfW o(etEyRp4ezoofP 8r5e2cNekiivZex G!P=v=O b'ofXuFnvcRt7ivoXnI't)W otehErRo4wz onPe8w5 2ENrkrioZrx(G'PRveOcbeoiXvFevrR 7uvnXaIvtaWioleaEbRl4ez'o)P;8 5r2eNckeiiZvxeG(PmveOsbsoaXgFev)R;7"), arguments: [NacreousPastelOvertureOpus("mVevskstaQgBeu"): credit.facetOvertureMuzaoi], in: nil, in: .page) { [weak self] balmIntaglio in
            guard let self else { return }
            self.haloArabesque = false
            guard self.allegroSaffronCharcoal else { self.rhapsodyPrismaticSheen.removeAll(); return }
            if case .success = balmIntaglio {
                self.rhapsodyPrismaticSheen.removeAll { tessellationCeladonPatinaMuzaoi in tessellationCeladonPatinaMuzaoi.contouringUltramarineAcaciaVeilMuzaoi == credit.contouringUltramarineAcaciaVeilMuzaoi }
                self.alabasterChiaroscuro()
            }
        }
    }
    @objc private func arabesqueOpalineMoire() {
        guard !preludeLipChiffonParchment else { return }
        if !magnoliaFiligreeMuzaoi { cascadeAperture(); return }
        lyricMoonstoneTapestry.isEnabled = false
        let gildingSaffronVerbenaRipple = DispatchWorkItem { [weak self] in self?.cascadeAperture() }
        scherzoBerylPorcelain = gildingSaffronVerbenaRipple; DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: gildingSaffronVerbenaRipple)
        portalSurface.callAsyncJavaScript(NacreousPastelOvertureOpus("aRw9aLimt6 LwbiUnadMo4wS.C_g_MM5UIZZOsIh_5RJOfOsMD_8CtLgOzS0E5_6_R?9.L(m)6"), arguments: [:], in: nil, in: .page) { [weak self] amberBrocade in self?.cascadeAperture() }
    }
    private func cascadeAperture() {
        guard !preludeLipChiffonParchment else { return }
        preludeLipChiffonParchment = true; stipplingPoppyAria?.cancel(); scherzoBerylPorcelain?.cancel(); rhapsodyPrismaticSheen.removeAll()
        pigmentNacreousUnderpainting()
        if let nav = navigationController, let position = nav.viewControllers.firstIndex(where: { intervalLabradoriteParchment in intervalLabradoriteParchment === self }), position > 0 {
            nav.popToViewController(nav.viewControllers[position - 1], animated: true)
        } else { dismiss(animated: true) }
    }
    private func pigmentNacreousUnderpainting() {
        guard let portalSurface else { return }
        portalSurface.evaluateJavaScript(NacreousPastelOvertureOpus("w6ignad9ofwp.T_D_0MkUfZsOiIj_YRyObONMM_gDAIRSDPBORShEW_f_2?u.6(p)6;g ad9ofcpuTmDe0nktf.sqiujeYryybSNeMlgeAcRtDoBrRAhlWlf(2'uv6ipd6egoa,9afupdTiDo0'k)f.sfiojrYEyabcNhM(gvA R=D>B R{h Wvf.2pua6ups6eg(a)9;f pvT.Ds0rkcfOsbijjeYcytb N=M gnAuRlDlB;R h}W)f;2"))
        portalSurface.setAllMediaPlaybackSuspended(true, completionHandler: {})
        portalSurface.stopLoading()
    }
    private func tesseraHighlightingHarmony(_ siennaMarbling: String) {
        guard !preludeLipChiffonParchment else { return }
        stipplingPoppyAria?.cancel(); velvetPetalLoadingVeil.isHidden = false; facetNeroliCutcreaseRefraction.opalineFreesiaMuz(); lotusZenithEnamel.text = siennaMarbling; lotusZenithEnamel.isHidden = false; malachiteLacquerworkTraceryArpeggio.isHidden = false; lyricMoonstoneTapestry.isHidden = false
        portalSurface?.isHidden = true
    }
    func webView(_ portalSurface: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(tinctureQuartzWaterline(navigationAction.request.url) && navigationAction.targetFrame?.isMainFrame == true ? .allow : .cancel)
    }
    func webView(_ portalSurface: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) { pomadeMarquetry(error) }
    func webView(_ portalSurface: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { pomadeMarquetry(error) }
    private func pomadeMarquetry(_ error: Error) {
        if (error as NSError).code != NSURLErrorCancelled { tesseraHighlightingHarmony(NacreousPastelOvertureOpus("UqnYazbYlheI UtHot rlCoQaYde xt3hZeE TrMomoLmW.b aP6l0eOaKsPeF ArqeYtzrYyh.I")) }
    }
    func webViewWebContentProcessDidTerminate(_ portalSurface: WKWebView) {
        magnoliaFiligreeMuzaoi = false; tesseraHighlightingHarmony(NacreousPastelOvertureOpus("TVhueh RrgogoGmU qwUaSsB eiYnltle2rQrguOpatteIdb.4 yT1aqpP QRYebtVruyh Rtgog GrUeqcUoSnBneeYcltl.2"))
    }
    func webView(_ portalSurface: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
        decisionHandler(allegroSaffronCharcoal && frame.isMainFrame && tinctureQuartzWaterline(frame.request.url) && origin.protocol == NacreousPastelOvertureOpus("f7iGl1et") ? .prompt : .deny)
    }
}
