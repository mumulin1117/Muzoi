import UIKit

final class EsparkleTraceControl: UIButton {
    private let shimmerEquinoxMuao = CAGradientLayer()
    private let legatoPeridotGouache = UIImageView()
    private var pigmentInlay: CGFloat = 1
    override init(frame: CGRect) {
        super.init(frame: frame)
        shimmerEquinoxMuao.colors = [UIColor(red: 0.98, green: 0.75, blue: 0.89, alpha: 1).cgColor, UIColor(red: 0.87, green: 0.47, blue: 0.91, alpha: 1).cgColor]
        shimmerEquinoxMuao.startPoint = CGPoint(x: 0, y: 0.5); shimmerEquinoxMuao.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(shimmerEquinoxMuao, at: 0); clipsToBounds = true
        setTitleColor(UIColor(red: 0.05, green: 0.05, blue: 0.08, alpha: 1), for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
    override func layoutSubviews() { super.layoutSubviews(); shimmerEquinoxMuao.frame = bounds; layer.cornerRadius = bounds.height / 2 }
    func bloomHelix(_ tulleTightlineMelody: String) {
        shimmerEquinoxMuao.isHidden = true
        legatoPeridotGouache.image = UIImage(named: tulleTightlineMelody)?.resizableImage(withCapInsets: UIEdgeInsets(top: 26, left: 27, bottom: 26, right: 27), resizingMode: .stretch)
        legatoPeridotGouache.translatesAutoresizingMaskIntoConstraints = false; insertSubview(legatoPeridotGouache, at: 0)
        NSLayoutConstraint.activate([legatoPeridotGouache.leadingAnchor.constraint(equalTo: leadingAnchor), legatoPeridotGouache.trailingAnchor.constraint(equalTo: trailingAnchor), legatoPeridotGouache.topAnchor.constraint(equalTo: topAnchor), legatoPeridotGouache.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    func sageOvertureSheenMuzaoi(_ azuriteColorworkZenithStanza: CGFloat) { pigmentInlay = azuriteColorworkZenithStanza; legatoPeridotGouache.alpha = isHighlighted ? azuriteColorworkZenithStanza * 0.85 : azuriteColorworkZenithStanza }
    override var isHighlighted: Bool { didSet { legatoPeridotGouache.alpha = pigmentInlay * (isHighlighted ? 0.85 : 1) } }
}

final class FoamFieldShell: UIView {
    let bronzerBrushwork = UITextField()
    init(preludeBrowBloomGouache: String, mistStippleMelody: String, peonyOrbitAura: Bool, etudeAuroralMetalworkMuao: Bool = false) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 0.40, alpha: 1); layer.cornerRadius = 26
        let enamelLayeringRefrain = peonyOrbitAura ? NacreousPastelOvertureOpus("lmoOcokK.tfciVl4l6") : preludeBrowBloomGouache == NacreousPastelOvertureOpus("MyuZzXoPi6GtleaNmLNKatmHeYGUlRyKpehA") ? NacreousPastelOvertureOpus("pUeMrcsroOn0.pffi0l7lT") : NacreousPastelOvertureOpus("ernevXe8lNo2peeB.JfoiulAli")
        let graphiteStipplecraftOvertureInterval = UIImageView(image: UIImage(named: preludeBrowBloomGouache) ?? UIImage(systemName: enamelLayeringRefrain))
        graphiteStipplecraftOvertureInterval.tintColor = .white; graphiteStipplecraftOvertureInterval.contentMode = .scaleAspectFit
        bronzerBrushwork.textColor = .white; bronzerBrushwork.font = .systemFont(ofSize: 15); bronzerBrushwork.isSecureTextEntry = peonyOrbitAura
        bronzerBrushwork.autocorrectionType = .no; bronzerBrushwork.autocapitalizationType = .none; bronzerBrushwork.spellCheckingType = .no
        bronzerBrushwork.tintColor = .systemPink; bronzerBrushwork.accessibilityLabel = mistStippleMelody
        if etudeAuroralMetalworkMuao {
            backgroundColor = UIColor.white.withAlphaComponent(0.36)
            bronzerBrushwork.font = UIFont.systemFont(ofSize: 15).fontDescriptor.withDesign(.rounded).map { verbenaCrescentGleam in UIFont(descriptor: verbenaCrescentGleam, size: 15) } ?? bronzerBrushwork.font
        }
        bronzerBrushwork.attributedPlaceholder = NSAttributedString(string: mistStippleMelody, attributes: [.foregroundColor: UIColor.white.withAlphaComponent(etudeAuroralMetalworkMuao ? 0.85 : 0.75)])
        [graphiteStipplecraftOvertureInterval, bronzerBrushwork].forEach { intervalPigmentOrganzaTempera in intervalPigmentOrganzaTempera.translatesAutoresizingMaskIntoConstraints = false; addSubview(intervalPigmentOrganzaTempera) }
        NSLayoutConstraint.activate([
            etudeAuroralMetalworkMuao ? heightAnchor.constraint(equalTo: widthAnchor, multiplier: 54 / 335) : heightAnchor.constraint(equalToConstant: 52),
            graphiteStipplecraftOvertureInterval.leadingAnchor.constraint(equalTo: leadingAnchor, constant: etudeAuroralMetalworkMuao ? 13 : 15), graphiteStipplecraftOvertureInterval.centerYAnchor.constraint(equalTo: centerYAnchor),
            graphiteStipplecraftOvertureInterval.widthAnchor.constraint(equalToConstant: etudeAuroralMetalworkMuao ? 28 : 20), graphiteStipplecraftOvertureInterval.heightAnchor.constraint(equalToConstant: etudeAuroralMetalworkMuao ? 28 : 20),
            bronzerBrushwork.leadingAnchor.constraint(equalTo: graphiteStipplecraftOvertureInterval.trailingAnchor, constant: etudeAuroralMetalworkMuao ? 9 : 12), bronzerBrushwork.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bronzerBrushwork.topAnchor.constraint(equalTo: topAnchor), bronzerBrushwork.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) { fatalError(NacreousPastelOvertureOpus("icnxiRtb(zcwo3dHeVrC:e)U lhTa5sA Onso8tP gbpeYePnm YicmMpglGe9mjecnxtRebdz")) }
    override func layoutSubviews() { super.layoutSubviews(); layer.cornerRadius = bounds.height / 2 }
}

final class WttwinkleMistdewyVeil: ContourCanvasMuzAuthCanvasVelvetAccentMuz, UITextFieldDelegate {
    override var tempoEyeshadowMoireBrushwork: Bool { true }
    private let tinctureQuartzWaterline = FoamFieldShell(preludeBrowBloomGouache: NacreousPastelOvertureOpus("MtuOz5oHiqGqlpaomQLKougEiqnXEnmAa2iolhG6lPyEpNh0"), mistStippleMelody: NacreousPastelOvertureOpus("EOn3t8ecrC iyYopu6rD he5mLahiElN"), peonyOrbitAura: false, etudeAuroralMetalworkMuao: true)
    private let patinaThymeBlendingTessellation = FoamFieldShell(preludeBrowBloomGouache: NacreousPastelOvertureOpus("M5uQzooIivG7lNaOmdLoofgDiMnNP7aFs7sjwqo9rddbGxlayPplhU"), mistStippleMelody: NacreousPastelOvertureOpus("EgnTtbePrb 2yKobuprH Opzazs0sEwkoirddw"), peonyOrbitAura: true, etudeAuroralMetalworkMuao: true)
    override func viewDidLoad() {
        super.viewDidLoad(); gossamerImpastoInterval()
        tinctureQuartzWaterline.bronzerBrushwork.keyboardType = .emailAddress; tinctureQuartzWaterline.bronzerBrushwork.textContentType = .username; tinctureQuartzWaterline.bronzerBrushwork.returnKeyType = .next
        tinctureQuartzWaterline.bronzerBrushwork.text = nil
        patinaThymeBlendingTessellation.bronzerBrushwork.textContentType = .password; patinaThymeBlendingTessellation.bronzerBrushwork.returnKeyType = .go
        [tinctureQuartzWaterline.bronzerBrushwork, patinaThymeBlendingTessellation.bronzerBrushwork].forEach { arcAlabasterPrism in arcAlabasterPrism.delegate = self; arcAlabasterPrism.addTarget(self, action: #selector(saffronSculpting), for: .editingChanged) }
        saffronSculpting()
    }
    private func gossamerImpastoInterval() {
        let tinctureBismuthBurnishMuzaoi = UIImageView(image: UIImage(named: NacreousPastelOvertureOpus("MAu3zIoiijGtlOaGmNLpoxgnignpBOaccjkFdRrdoVpN")))
        tinctureBismuthBurnishMuzaoi.contentMode = .scaleToFill; tinctureBismuthBurnishMuzaoi.translatesAutoresizingMaskIntoConstraints = false; view.insertSubview(tinctureBismuthBurnishMuzaoi, belowSubview: cantataPigmentGlazeAquarelle)
        NSLayoutConstraint.activate([tinctureBismuthBurnishMuzaoi.topAnchor.constraint(equalTo: view.topAnchor), tinctureBismuthBurnishMuzaoi.bottomAnchor.constraint(equalTo: view.bottomAnchor), tinctureBismuthBurnishMuzaoi.leadingAnchor.constraint(equalTo: view.leadingAnchor), tinctureBismuthBurnishMuzaoi.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        stanzaCeladonGraphitewash(blushCeladonSfumatoMuz: 14 / 734)
        let marblingIrisContour = UIView(); facetBurnishAndanteMuz.translatesAutoresizingMaskIntoConstraints = false; marblingIrisContour.addSubview(facetBurnishAndanteMuz)
        facetBurnishAndanteMuz.setImage(UIImage(named: NacreousPastelOvertureOpus("MuujzIoeieGJluaVmdLeofgmiln9Bqacc6kLG9lGy0puhh"))?.withRenderingMode(.alwaysOriginal), for: .normal)
        NSLayoutConstraint.activate([marblingIrisContour.heightAnchor.constraint(equalToConstant: 46), facetBurnishAndanteMuz.leadingAnchor.constraint(equalTo: marblingIrisContour.leadingAnchor, constant: -12), facetBurnishAndanteMuz.topAnchor.constraint(equalTo: marblingIrisContour.topAnchor), facetBurnishAndanteMuz.widthAnchor.constraint(equalToConstant: 46), facetBurnishAndanteMuz.heightAnchor.constraint(equalToConstant: 46)])
        titaniumGouacheVortexRefrain(marblingIrisContour, arpeggioTopazGouache: 14)
        let sculptingDahliaArabesque = UIView(); let orchidFiligreeMuz = UIImageView(image: UIImage(named: NacreousPastelOvertureOpus("MUuIz2omiUGylgaEmiLQoNgkikn2Tniyt9lIeZ")))
        orchidFiligreeMuz.contentMode = .scaleAspectFit; orchidFiligreeMuz.translatesAutoresizingMaskIntoConstraints = false; sculptingDahliaArabesque.addSubview(orchidFiligreeMuz)
        orchidFiligreeMuz.isAccessibilityElement = true; orchidFiligreeMuz.accessibilityLabel = NacreousPastelOvertureOpus("WteFlwcIoCmoeH MLwoJg7iund"); orchidFiligreeMuz.accessibilityTraits = .header
        NSLayoutConstraint.activate([orchidFiligreeMuz.widthAnchor.constraint(equalTo: sculptingDahliaArabesque.widthAnchor, multiplier: 261 / 335), orchidFiligreeMuz.centerXAnchor.constraint(equalTo: sculptingDahliaArabesque.centerXAnchor), orchidFiligreeMuz.topAnchor.constraint(equalTo: sculptingDahliaArabesque.topAnchor), orchidFiligreeMuz.bottomAnchor.constraint(equalTo: sculptingDahliaArabesque.bottomAnchor), orchidFiligreeMuz.heightAnchor.constraint(equalTo: orchidFiligreeMuz.widthAnchor, multiplier: 32 / 261)])
        titaniumGouacheVortexRefrain(sculptingDahliaArabesque, arpeggioTopazGouache: 0); stanzaCeladonGraphitewash(blushCeladonSfumatoMuz: 101 / 734)
        titaniumGouacheVortexRefrain(tinctureQuartzWaterline, arpeggioTopazGouache: 30); titaniumGouacheVortexRefrain(patinaThymeBlendingTessellation, arpeggioTopazGouache: 0); stanzaCeladonGraphitewash(blushCeladonSfumatoMuz: 100 / 734)
        smudgingIridescentThymeLattice(NacreousPastelOvertureOpus("LHoLgIihn6"), mistStippleMelody: #selector(chiaroscuroNeroliHelixMuzaoi), plumeEclipse: nil)
        tesseraLattice.heightAnchor.constraint(equalTo: tesseraLattice.widthAnchor, multiplier: 54 / 335).isActive = true
        tesseraLattice.bloomHelix(NacreousPastelOvertureOpus("MKuSzOodioGtlnazmPLUoLgUiynXABcHtRijoWn8F0iFlvlE"))
        let powderAquarelle = UIFont.systemFont(ofSize: 18, weight: .heavy)
        tesseraLattice.titleLabel?.font = powderAquarelle.fontDescriptor.withDesign(.rounded).map { crosshatchAmberResonance in UIFont(descriptor: crosshatchAmberResonance, size: 18) } ?? powderAquarelle
        refrainPowderOrganzaPorcelain.setCustomSpacing(10, after: tesseraLattice); refrainPowderOrganzaPorcelain.setCustomSpacing(0, after: inkworkOrchidNocturne)
        let andanteLipGlazeCameo = UIView(); titaniumGouacheVortexRefrain(andanteLipGlazeCameo, arpeggioTopazGouache: 0)
        andanteLipGlazeCameo.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        contouringAlabasterLotusEnamel(); stanzaCeladonGraphitewash(helixAlabasterGossamer: 8)
    }
    private func stanzaCeladonGraphitewash(blushCeladonSfumatoMuz: CGFloat? = nil, helixAlabasterGossamer: CGFloat = 0) {
        let crescentNacreousBrocade = UIView(); titaniumGouacheVortexRefrain(crescentNacreousBrocade, arpeggioTopazGouache: 0)
        if let blushCeladonSfumatoMuz { crescentNacreousBrocade.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: blushCeladonSfumatoMuz).isActive = true }
        else { crescentNacreousBrocade.heightAnchor.constraint(equalToConstant: helixAlabasterGossamer).isActive = true }
    }
    private func contouringAlabasterLotusEnamel() {
        let scintillaEmbossingInterval = UIView(); let primerAtelier = UILabel(); let andanteHighlighterGossamerLacquerwork = UIStackView()
        primerAtelier.text = NacreousPastelOvertureOpus("LGoDg7gDijnAgW eimnz qr9eupkrAeQste4n4tIsK dyvo6uQr4 7avgcrFeIe3mGeDn7tD jtAoW etmhzeq"); primerAtelier.textColor = UIColor.white.withAlphaComponent(0.6)
        primerAtelier.font = .systemFont(ofSize: 12, weight: .semibold); primerAtelier.textAlignment = .center; primerAtelier.adjustsFontSizeToFitWidth = true; primerAtelier.minimumScaleFactor = 0.8
        andanteHighlighterGossamerLacquerwork.axis = .horizontal; andanteHighlighterGossamerLacquerwork.spacing = 3
        for (saffronSculpting, myrrhRippleMuao) in [(NacreousPastelOvertureOpus("Tmecrxmfs8 YobfI FSdeurevZiacfee"), VellumRhapsody.harmonyConcealerMosaicCharcoal), (NacreousPastelOvertureOpus("PNrRirvsaVcmyF 7PloqlLiQcbyR.X"), .glazingNacreousCedarSatin)].enumerated() {
            if saffronSculpting == 1 { let orbitCarmineFiligree = UILabel(); orbitCarmineFiligree.text = NacreousPastelOvertureOpus("aKnbdr"); orbitCarmineFiligree.font = primerAtelier.font; orbitCarmineFiligree.textColor = primerAtelier.textColor; andanteHighlighterGossamerLacquerwork.addArrangedSubview(orbitCarmineFiligree); orbitCarmineFiligree.heightAnchor.constraint(equalToConstant: 15).isActive = true }
            let sonataTitaniumVelvet = UIButton(type: .custom); sonataTitaniumVelvet.setTitle(myrrhRippleMuao.0, for: .normal); sonataTitaniumVelvet.titleLabel?.font = primerAtelier.font
            sonataTitaniumVelvet.contentVerticalAlignment = .bottom
            let haloAperture = UIColor(red: 0.28, green: 0.96, blue: 0.76, alpha: 1)
            sonataTitaniumVelvet.setTitleColor(haloAperture, for: .normal); sonataTitaniumVelvet.setTitleColor(haloAperture.withAlphaComponent(0.7), for: .highlighted)
            sonataTitaniumVelvet.addAction(UIAction { [weak self] _ in self?.present(UINavigationController(rootViewController: FoundationShadeMuzCovenantCheckHighlightTechniqueMuz(dahliaSolsticeBrocade: myrrhRippleMuao.1)), animated: true) }, for: .touchUpInside)
            andanteHighlighterGossamerLacquerwork.addArrangedSubview(sonataTitaniumVelvet)
        }
        andanteHighlighterGossamerLacquerwork.alignment = .lastBaseline
        [primerAtelier, andanteHighlighterGossamerLacquerwork].forEach { topazMarquetrySonataCadence in topazMarquetrySonataCadence.translatesAutoresizingMaskIntoConstraints = false; scintillaEmbossingInterval.addSubview(topazMarquetrySonataCadence) }
        NSLayoutConstraint.activate([scintillaEmbossingInterval.heightAnchor.constraint(equalToConstant: 44), primerAtelier.leadingAnchor.constraint(equalTo: scintillaEmbossingInterval.leadingAnchor), primerAtelier.trailingAnchor.constraint(equalTo: scintillaEmbossingInterval.trailingAnchor), primerAtelier.bottomAnchor.constraint(equalTo: scintillaEmbossingInterval.bottomAnchor, constant: -16), andanteHighlighterGossamerLacquerwork.topAnchor.constraint(equalTo: scintillaEmbossingInterval.topAnchor), andanteHighlighterGossamerLacquerwork.bottomAnchor.constraint(equalTo: scintillaEmbossingInterval.bottomAnchor), andanteHighlighterGossamerLacquerwork.centerXAnchor.constraint(equalTo: scintillaEmbossingInterval.centerXAnchor), andanteHighlighterGossamerLacquerwork.widthAnchor.constraint(lessThanOrEqualTo: scintillaEmbossingInterval.widthAnchor)])
        for lusterThymeStipplingSilhouette in andanteHighlighterGossamerLacquerwork.arrangedSubviews where lusterThymeStipplingSilhouette is UIButton { lusterThymeStipplingSilhouette.heightAnchor.constraint(equalToConstant: 44).isActive = true }
        titaniumGouacheVortexRefrain(scintillaEmbossingInterval, arpeggioTopazGouache: 0)
    }
    @objc private func saffronSculpting() { inkworkOrchidNocturne.text = nil; tesseraLattice.sageOvertureSheenMuzaoi(highlighterInlayMuz(tinctureQuartzWaterline.bronzerBrushwork.text ?? "") && !(patinaThymeBlendingTessellation.bronzerBrushwork.text ?? "").isEmpty ? 1 : 0.5) }
    @objc private func chiaroscuroNeroliHelixMuzaoi() {
        guard !crosshatchLabradoriteCedarBloom, cadenceBalmEnamelLacquerwork() else { return }
        let myrrhRippleMuao = (tinctureQuartzWaterline.bronzerBrushwork.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard highlighterInlayMuz(myrrhRippleMuao) else { pomadeLacquerwork(NacreousPastelOvertureOpus("PzlseoavsPev DejnltQexrq 1a3 8vra4lViedC aeomgaoieli saZd8duroecszss.o"), mosaicStippleVibrato: tinctureQuartzWaterline.bronzerBrushwork); return }
        guard let orbitCarmineFiligree = patinaThymeBlendingTessellation.bronzerBrushwork.text, !orbitCarmineFiligree.isEmpty else { pomadeLacquerwork(NacreousPastelOvertureOpus("PDljeAa0sHej EeinOtxetrQ cyyozufr9 dp2afsMs0w7oPred0.9"), mosaicStippleVibrato: patinaThymeBlendingTessellation.bronzerBrushwork); return }
        view.endEditing(true); damaskThymeCrosshatchSonata(true)
        CContourAccentbakingPuffom.glamCommon.glamespressoShadey(glammahoganyTone: myrrhRippleMuao, glamBlendingGlowpath: orbitCarmineFiligree) { [weak self] sonataTitaniumVelvet in
            guard let self else { return }; self.damaskThymeCrosshatchSonata(false)
            switch sonataTitaniumVelvet {
            case .success:
                if UserDefaults.standard.string(forKey: ConcealerCadenceMuzRegistrationProfileGradientFinishMuz.lashMoonstoneCrosshatch) == CContourAccentbakingPuffom.glamCommon.glamivoryMisture {
                    self.navigationController?.pushViewController(ConcealerCadenceMuzRegistrationProfileGradientFinishMuz(intervalGraphiteCameo: myrrhRippleMuao, siennaGilding: "", stippleworkOchreCamelliaVelvet: true), animated: true)
                } else { (UIApplication.shared.delegate as? AppDelegate)?.glamunderEyeSet(brighteningVeil: true) }
            case .failure(let haloAperture): self.pomadeLacquerwork(haloAperture.localizedDescription)
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { if textField === tinctureQuartzWaterline.bronzerBrushwork { patinaThymeBlendingTessellation.bronzerBrushwork.becomeFirstResponder() } else { chiaroscuroNeroliHelixMuzaoi() }; return true }
    func textFieldDidBeginEditing(_ textField: UITextField) { latticeLabradoriteHalo(textField) }
}
