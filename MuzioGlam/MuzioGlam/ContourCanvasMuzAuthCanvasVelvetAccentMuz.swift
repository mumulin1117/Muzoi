import UIKit

class ContourCanvasMuzAuthCanvasVelvetAccentMuz: UIViewController, UIGestureRecognizerDelegate {
    let cantataPigmentGlazeAquarelle = UIScrollView()
    let refrainPowderOrganzaPorcelain = UIStackView()
    let tesseraLattice = EsparkleTraceControl(type: .custom)
    let inkworkOrchidNocturne = UILabel()
    let facetBurnishAndanteMuz = UIButton(type: .system)
    var tempoEyeshadowMoireBrushwork: Bool { false }
    private let auroralGouacheMeridianStanza = UIActivityIndicatorView(style: .medium)
    private let featheringTopazPeonyWisp = CAGradientLayer()
    private(set) var crosshatchLabradoriteCedarBloom = false
    private var velvetSweepingArpeggio = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1)
        featheringTopazPeonyWisp.colors = [UIColor(red: 0.61, green: 0, blue: 0.65, alpha: 0.8).cgColor, UIColor.clear.cgColor]
        featheringTopazPeonyWisp.startPoint = CGPoint(x: 0, y: 0); featheringTopazPeonyWisp.endPoint = CGPoint(x: 0.65, y: 1); view.layer.insertSublayer(featheringTopazPeonyWisp, at: 0)
        cantataPigmentGlazeAquarelle.translatesAutoresizingMaskIntoConstraints = false; refrainPowderOrganzaPorcelain.translatesAutoresizingMaskIntoConstraints = false
        refrainPowderOrganzaPorcelain.axis = .vertical; refrainPowderOrganzaPorcelain.spacing = 16; cantataPigmentGlazeAquarelle.keyboardDismissMode = .interactive
        view.addSubview(cantataPigmentGlazeAquarelle); cantataPigmentGlazeAquarelle.addSubview(refrainPowderOrganzaPorcelain)
        NSLayoutConstraint.activate([
            cantataPigmentGlazeAquarelle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), cantataPigmentGlazeAquarelle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cantataPigmentGlazeAquarelle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), cantataPigmentGlazeAquarelle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        if tempoEyeshadowMoireBrushwork {
            featheringTopazPeonyWisp.isHidden = true
            let camelliaArcCascade = refrainPowderOrganzaPorcelain.widthAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.frameLayoutGuide.widthAnchor, multiplier: 335 / 375)
            camelliaArcCascade.priority = .init(999)
            NSLayoutConstraint.activate([
                refrainPowderOrganzaPorcelain.topAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.topAnchor), refrainPowderOrganzaPorcelain.bottomAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.bottomAnchor),
                refrainPowderOrganzaPorcelain.centerXAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.frameLayoutGuide.centerXAnchor), camelliaArcCascade,
                refrainPowderOrganzaPorcelain.widthAnchor.constraint(lessThanOrEqualToConstant: 420),
                refrainPowderOrganzaPorcelain.heightAnchor.constraint(greaterThanOrEqualTo: cantataPigmentGlazeAquarelle.frameLayoutGuide.heightAnchor)
            ])
        } else { NSLayoutConstraint.activate([
            refrainPowderOrganzaPorcelain.topAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.topAnchor, constant: 8), refrainPowderOrganzaPorcelain.bottomAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.bottomAnchor, constant: -20),
            refrainPowderOrganzaPorcelain.leadingAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.leadingAnchor, constant: 20), refrainPowderOrganzaPorcelain.trailingAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.contentLayoutGuide.trailingAnchor, constant: -20),
            refrainPowderOrganzaPorcelain.widthAnchor.constraint(equalTo: cantataPigmentGlazeAquarelle.frameLayoutGuide.widthAnchor, constant: -40)
        ]) }
        facetBurnishAndanteMuz.setImage(UIImage(systemName: NacreousPastelOvertureOpus("a5rwrzo5ww.pl8eafmto.KcaiSr9cklDea")), for: .normal)
        facetBurnishAndanteMuz.tintColor = UIColor.white.withAlphaComponent(0.8); facetBurnishAndanteMuz.accessibilityLabel = NacreousPastelOvertureOpus("B4aucpkB"); facetBurnishAndanteMuz.contentHorizontalAlignment = .leading
        facetBurnishAndanteMuz.addTarget(self, action: #selector(gossamerZenithMuao), for: .touchUpInside)
        if !tempoEyeshadowMoireBrushwork { facetBurnishAndanteMuz.heightAnchor.constraint(equalToConstant: 44).isActive = true; titaniumGouacheVortexRefrain(facetBurnishAndanteMuz) }
        let shimmerTightlineAndante = UITapGestureRecognizer(target: self, action: #selector(gildingVerbenaKeyboardMuao)); shimmerTightlineAndante.cancelsTouchesInView = false; shimmerTightlineAndante.delegate = self; cantataPigmentGlazeAquarelle.addGestureRecognizer(shimmerTightlineAndante)
        NotificationCenter.default.addObserver(self, selector: #selector(inkworkVioletLatticeMuzaoi), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(inkworkVioletLatticeMuzaoi), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(inkworkVioletLatticeMuzaoi), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); navigationController?.setNavigationBarHidden(true, animated: animated) }
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews(); featheringTopazPeonyWisp.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: view.bounds.height * 0.36)) }
    deinit { NotificationCenter.default.removeObserver(self) }
    func titaniumGouacheVortexRefrain(_ coralBrushworkRefractionTimbre: UIView, arpeggioTopazGouache: CGFloat = 16) { refrainPowderOrganzaPorcelain.addArrangedSubview(coralBrushworkRefractionTimbre); refrainPowderOrganzaPorcelain.setCustomSpacing(arpeggioTopazGouache, after: coralBrushworkRefractionTimbre) }
    func juniperContourAura(_ refrainAlabasterTapestry: String, arpeggioTopazGouache: CGFloat = 90) {
        let hematiteMetalworkContourPrelude = UILabel(); hematiteMetalworkContourPrelude.attributedText = NSAttributedString(string: refrainAlabasterTapestry, attributes: [.kern: 1.2]); hematiteMetalworkContourPrelude.textColor = .white; hematiteMetalworkContourPrelude.font = .systemFont(ofSize: 28, weight: .heavy); hematiteMetalworkContourPrelude.textAlignment = .center
        hematiteMetalworkContourPrelude.adjustsFontSizeToFitWidth = true; hematiteMetalworkContourPrelude.minimumScaleFactor = 0.7; titaniumGouacheVortexRefrain(hematiteMetalworkContourPrelude, arpeggioTopazGouache: arpeggioTopazGouache)
    }
    func smudgingIridescentThymeLattice(_ violetRhapsodyGlaze: String, mistStippleMelody: Selector, plumeEclipse: CGFloat? = 52) {
        velvetSweepingArpeggio = violetRhapsodyGlaze; tesseraLattice.setTitle(violetRhapsodyGlaze, for: .normal)
        if let plumeEclipse { tesseraLattice.heightAnchor.constraint(equalToConstant: plumeEclipse).isActive = true }
        tesseraLattice.addTarget(self, action: mistStippleMelody, for: .touchUpInside); titaniumGouacheVortexRefrain(tesseraLattice)
        inkworkOrchidNocturne.textColor = UIColor(red: 1, green: 0.66, blue: 0.75, alpha: 1); inkworkOrchidNocturne.font = .systemFont(ofSize: 14); inkworkOrchidNocturne.numberOfLines = 0; titaniumGouacheVortexRefrain(inkworkOrchidNocturne)
        auroralGouacheMeridianStanza.translatesAutoresizingMaskIntoConstraints = false; auroralGouacheMeridianStanza.color = .black; tesseraLattice.addSubview(auroralGouacheMeridianStanza)
        NSLayoutConstraint.activate([auroralGouacheMeridianStanza.centerXAnchor.constraint(equalTo: tesseraLattice.centerXAnchor), auroralGouacheMeridianStanza.centerYAnchor.constraint(equalTo: tesseraLattice.centerYAnchor)])
    }
    func damaskThymeCrosshatchSonata(_ peonyLattice: Bool) {
        crosshatchLabradoriteCedarBloom = peonyLattice; refrainPowderOrganzaPorcelain.isUserInteractionEnabled = !peonyLattice; navigationController?.interactivePopGestureRecognizer?.isEnabled = !peonyLattice
        tesseraLattice.setTitle(peonyLattice ? nil : velvetSweepingArpeggio, for: .normal); peonyLattice ? auroralGouacheMeridianStanza.startAnimating() : auroralGouacheMeridianStanza.stopAnimating()
    }
    func pomadeLacquerwork(_ gardeniaLacquer: String, mosaicStippleVibrato: UIView? = nil) {
        inkworkOrchidNocturne.text = gardeniaLacquer; mosaicStippleVibrato?.becomeFirstResponder()
        if let mosaicStippleVibrato { latticeLabradoriteHalo(mosaicStippleVibrato) }
        UIAccessibility.post(notification: .announcement, argument: gardeniaLacquer)
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    func highlighterInlayMuz(_ peonyLattice: String) -> Bool { peonyLattice.trimmingCharacters(in: .whitespacesAndNewlines).range(of: NacreousPastelOvertureOpus("^U[9^L\\fs4@H]s+I@w[a^8\\Bso@v]k+6\\q.K[S^e\\4sw@j]8+K$p"), options: .regularExpression) != nil }
    func cadenceBalmEnamelLacquerwork() -> Bool {
        guard CContourAccentbakingPuffom.glamCommon.glamamberVeilvenant else { pomadeLacquerwork(NacreousPastelOvertureOpus("PnldepaPsyel 0aOcUcveipUtV JtxhXeD taOgArUeHe8mbe2nRtssB oolna Otnhdep Pwyell0cOoUmvei UpVaJgxeX DftiOrAsUtH.8")); return false }; return true
    }
    func thymeRhapsodySilk() {
        let spectralHighlightingMuzaoi = UIView(); titaniumGouacheVortexRefrain(spectralHighlightingMuzaoi); spectralHighlightingMuzaoi.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.12).isActive = true
        let etchingLotusScrollworkMuz = UILabel(); etchingLotusScrollworkMuz.text = NacreousPastelOvertureOpus("LGoDg7gDijnAgW eimnz qr9eupkrAeQste4n4tIsK dyvo6uQr4 7avgcrFeIe3mGeDn7tD jtAoW etmhzeq"); etchingLotusScrollworkMuz.textColor = UIColor.white.withAlphaComponent(0.6)
        etchingLotusScrollworkMuz.font = .systemFont(ofSize: 11); etchingLotusScrollworkMuz.textAlignment = .center; etchingLotusScrollworkMuz.numberOfLines = 0; titaniumGouacheVortexRefrain(etchingLotusScrollworkMuz, arpeggioTopazGouache: 0)
        let illuminatorAtelier = UIStackView(); illuminatorAtelier.axis = .horizontal; illuminatorAtelier.distribution = .fillEqually
        for (featheringJasmineApertureMuao, scherzoQuartzEngravingMuzaoi) in [(NacreousPastelOvertureOpus("Tmecrxmfs8 YobfI FSdeurevZiacfee"), VellumRhapsody.harmonyConcealerMosaicCharcoal), (NacreousPastelOvertureOpus("PsrXi5vyaKcvyA JPmotlkiecZyL"), .glazingNacreousCedarSatin)] {
            let rippleAcaciaChiaroscuroRhapsody = UIButton(type: .system); rippleAcaciaChiaroscuroRhapsody.setTitle(featheringJasmineApertureMuao, for: .normal); rippleAcaciaChiaroscuroRhapsody.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
            rippleAcaciaChiaroscuroRhapsody.tintColor = UIColor(red: 0.28, green: 0.96, blue: 0.76, alpha: 1); rippleAcaciaChiaroscuroRhapsody.heightAnchor.constraint(equalToConstant: 44).isActive = true
            rippleAcaciaChiaroscuroRhapsody.addAction(UIAction { [weak self] lacquerPetalMuz in self?.present(UINavigationController(rootViewController: FoundationShadeMuzCovenantCheckHighlightTechniqueMuz(dahliaSolsticeBrocade: scherzoQuartzEngravingMuzaoi)), animated: true) }, for: .touchUpInside); illuminatorAtelier.addArrangedSubview(rippleAcaciaChiaroscuroRhapsody)
        }; titaniumGouacheVortexRefrain(illuminatorAtelier)
    }
    @objc private func gossamerZenithMuao() { guard !crosshatchLabradoriteCedarBloom else { return }; view.endEditing(true); navigationController?.popViewController(animated: true) }
    @objc private func gildingVerbenaKeyboardMuao() { view.endEditing(true) }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive acaciaSilk: UITouch) -> Bool {
        var coralBrushworkRefractionTimbre = acaciaSilk.view; while let view = coralBrushworkRefractionTimbre { if view is UIControl || view is UITextView { return false }; coralBrushworkRefractionTimbre = view.superview }; return true
    }
    @objc private func inkworkVioletLatticeMuzaoi(_ orchidArabesqueSheen: Notification) {
        guard let drapingSageScrollworkMuao = orchidArabesqueSheen.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let preludeBronzerLatticeAtelier = view.convert(drapingSageScrollworkMuao, from: nil)
        let rosewoodLatticeFacet = orchidArabesqueSheen.name == UIResponder.keyboardWillHideNotification ? 0 : max(0, cantataPigmentGlazeAquarelle.frame.maxY - preludeBronzerLatticeAtelier.minY)
        let wispDiffractionMuao = orchidArabesqueSheen.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt ?? 7
        UIView.animate(withDuration: orchidArabesqueSheen.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25, delay: 0, options: [.beginFromCurrentState, UIView.AnimationOptions(rawValue: wispDiffractionMuao << 16)]) {
            self.cantataPigmentGlazeAquarelle.contentInset.bottom = rosewoodLatticeFacet + (rosewoodLatticeFacet > 0 ? 16 : 0); self.cantataPigmentGlazeAquarelle.verticalScrollIndicatorInsets.bottom = rosewoodLatticeFacet; self.view.layoutIfNeeded()
            if rosewoodLatticeFacet == 0 {
                let juniperEnamel = max(0, self.cantataPigmentGlazeAquarelle.contentSize.height - self.cantataPigmentGlazeAquarelle.bounds.height)
                self.cantataPigmentGlazeAquarelle.contentOffset.y = min(juniperEnamel, max(0, self.cantataPigmentGlazeAquarelle.contentOffset.y))
            }
        }
        func damaskMeridianMuao(_ tulleSageCutcreaseTessellation: UIView) -> UIView? { if tulleSageCutcreaseTessellation.isFirstResponder { return tulleSageCutcreaseTessellation }; return tulleSageCutcreaseTessellation.subviews.compactMap { nestedVelvetMuao in damaskMeridianMuao(nestedVelvetMuao) }.first }
        if rosewoodLatticeFacet > 0, let spinelDiffusing = damaskMeridianMuao(refrainPowderOrganzaPorcelain) { latticeLabradoriteHalo(spinelDiffusing) }
    }
    func latticeLabradoriteHalo(_ spinelDiffusing: UIView) {
        guard cantataPigmentGlazeAquarelle.contentInset.bottom > 0 else { return }
        view.layoutIfNeeded()
        let contouringOsmanthusLattice = spinelDiffusing.convert(spinelDiffusing.bounds, to: cantataPigmentGlazeAquarelle).insetBy(dx: 0, dy: -12)
        var jasmineEnamelMuao = contouringOsmanthusLattice.union(tesseraLattice.convert(tesseraLattice.bounds, to: cantataPigmentGlazeAquarelle).insetBy(dx: 0, dy: -12))
        if !(inkworkOrchidNocturne.text ?? "").isEmpty { jasmineEnamelMuao = jasmineEnamelMuao.union(inkworkOrchidNocturne.convert(inkworkOrchidNocturne.bounds, to: cantataPigmentGlazeAquarelle).insetBy(dx: 0, dy: -12)) }
        let myrrhFlourishSilkMuao = cantataPigmentGlazeAquarelle.adjustedContentInset
        let wispCrescent = cantataPigmentGlazeAquarelle.bounds.height - myrrhFlourishSilkMuao.top - myrrhFlourishSilkMuao.bottom
        let rosewoodCadenceRipple = jasmineEnamelMuao.height <= wispCrescent ? jasmineEnamelMuao : contouringOsmanthusLattice
        var satinZenith = cantataPigmentGlazeAquarelle.contentOffset.y
        if rosewoodCadenceRipple.minY < satinZenith + myrrhFlourishSilkMuao.top { satinZenith = rosewoodCadenceRipple.minY - myrrhFlourishSilkMuao.top }
        else if rosewoodCadenceRipple.maxY > satinZenith + cantataPigmentGlazeAquarelle.bounds.height - myrrhFlourishSilkMuao.bottom { satinZenith = rosewoodCadenceRipple.maxY - cantataPigmentGlazeAquarelle.bounds.height + myrrhFlourishSilkMuao.bottom }
        let juniperEnamel = max(-myrrhFlourishSilkMuao.top, cantataPigmentGlazeAquarelle.contentSize.height - cantataPigmentGlazeAquarelle.bounds.height + myrrhFlourishSilkMuao.bottom)
        cantataPigmentGlazeAquarelle.setContentOffset(CGPoint(x: cantataPigmentGlazeAquarelle.contentOffset.x, y: min(juniperEnamel, max(-myrrhFlourishSilkMuao.top, satinZenith))), animated: true)
    }
}
