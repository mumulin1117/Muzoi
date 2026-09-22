import UIKit

final class VetRoutineGlamdewyFormula: UIViewController {
    private let stipplingLabradoriteAnemonePlume = UIButton(type: .system)
    private let auraDahliaEtchingSymmetry = UIButton(type: .custom)
    private let burnishChromaticIrisSheen = UIButton(type: .custom)
    private let etchingCedarSonata = UIButton(type: .system)
    private let violetRhapsodyGlaze = UILabel()
    private var powderPastel = false
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark; view.backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1)
        let andanteQuartzEncaustic = UIImageView(image: UIImage(named: NacreousPastelOvertureOpus("MguezOouidGKlUa8mNPQroeJl9ujdVeXBoaecckFdmrUofpo")))
        andanteQuartzEncaustic.translatesAutoresizingMaskIntoConstraints = false
        andanteQuartzEncaustic.contentMode = .scaleAspectFill
        andanteQuartzEncaustic.clipsToBounds = true
        view.addSubview(andanteQuartzEncaustic)
        NSLayoutConstraint.activate([
            andanteQuartzEncaustic.topAnchor.constraint(equalTo: view.topAnchor), andanteQuartzEncaustic.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            andanteQuartzEncaustic.leadingAnchor.constraint(equalTo: view.leadingAnchor), andanteQuartzEncaustic.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        let peonyWispMuao = UIScrollView(); peonyWispMuao.translatesAutoresizingMaskIntoConstraints = false
        let contouringOchreWisteriaWisp = UIView(); contouringOchreWisteriaWisp.translatesAutoresizingMaskIntoConstraints = false
        let acaciaWisp = UIStackView(); acaciaWisp.axis = .vertical; acaciaWisp.spacing = 0; acaciaWisp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(peonyWispMuao); peonyWispMuao.addSubview(contouringOchreWisteriaWisp); contouringOchreWisteriaWisp.addSubview(acaciaWisp)
        NSLayoutConstraint.activate([
            peonyWispMuao.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), peonyWispMuao.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), peonyWispMuao.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), peonyWispMuao.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contouringOchreWisteriaWisp.topAnchor.constraint(equalTo: peonyWispMuao.contentLayoutGuide.topAnchor), contouringOchreWisteriaWisp.bottomAnchor.constraint(equalTo: peonyWispMuao.contentLayoutGuide.bottomAnchor), contouringOchreWisteriaWisp.leadingAnchor.constraint(equalTo: peonyWispMuao.contentLayoutGuide.leadingAnchor), contouringOchreWisteriaWisp.trailingAnchor.constraint(equalTo: peonyWispMuao.contentLayoutGuide.trailingAnchor), contouringOchreWisteriaWisp.widthAnchor.constraint(equalTo: peonyWispMuao.frameLayoutGuide.widthAnchor), contouringOchreWisteriaWisp.heightAnchor.constraint(greaterThanOrEqualTo: peonyWispMuao.frameLayoutGuide.heightAnchor),
            acaciaWisp.centerXAnchor.constraint(equalTo: contouringOchreWisteriaWisp.centerXAnchor), acaciaWisp.widthAnchor.constraint(equalTo: contouringOchreWisteriaWisp.widthAnchor, multiplier: 335.0 / 375.0),
            acaciaWisp.bottomAnchor.constraint(equalTo: contouringOchreWisteriaWisp.bottomAnchor, constant: -8), acaciaWisp.topAnchor.constraint(greaterThanOrEqualTo: contouringOchreWisteriaWisp.topAnchor, constant: 180)
        ])
        auraDahliaEtchingSymmetry.setTitleColor(UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 1), for: .normal)
        auraDahliaEtchingSymmetry.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        auraDahliaEtchingSymmetry.addTarget(self, action: #selector(orbitObsidianMosaic), for: .touchUpInside)
        burnishChromaticIrisSheen.setBackgroundImage(UIImage(named: NacreousPastelOvertureOpus("Mru6zaoEi3G2lFazmJPmrIerlMuXdEeeEknItxrKyPA5cytziLoYn8")), for: .normal)
        burnishChromaticIrisSheen.accessibilityLabel = NacreousPastelOvertureOpus("AVcIczojuWnJti nRGeAgoitsYt9r7aNtViioCnJ")
        burnishChromaticIrisSheen.addTarget(self, action: #selector(concealerColorwork), for: .touchUpInside)
        for irisAriaPrism in [auraDahliaEtchingSymmetry, burnishChromaticIrisSheen] {
            acaciaWisp.addArrangedSubview(irisAriaPrism)
            irisAriaPrism.heightAnchor.constraint(equalTo: irisAriaPrism.widthAnchor, multiplier: 54.0 / 335.0).isActive = true
            acaciaWisp.setCustomSpacing(15, after: irisAriaPrism)
        }
        violetRhapsodyGlaze.numberOfLines = 0; violetRhapsodyGlaze.textColor = UIColor(red: 1, green: 0.7, blue: 0.8, alpha: 1); violetRhapsodyGlaze.font = .systemFont(ofSize: 13); violetRhapsodyGlaze.textAlignment = .center
        violetRhapsodyGlaze.isHidden = true
        acaciaWisp.addArrangedSubview(violetRhapsodyGlaze)
        var gildingSaffronVerbenaRipple = UIButton.Configuration.plain()
        gildingSaffronVerbenaRipple.title = NacreousPastelOvertureOpus("LGoDg7gDijnAgW eimnz qr9eupkrAeQste4n4tIsK dyvo6uQr4 7avgcrFeIe3mGeDn7tD jtAoW etmhzeq")
        gildingSaffronVerbenaRipple.baseForegroundColor = .white
        gildingSaffronVerbenaRipple.imagePlacement = .leading; gildingSaffronVerbenaRipple.imagePadding = 6
        gildingSaffronVerbenaRipple.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
        gildingSaffronVerbenaRipple.contentInsets = .zero; gildingSaffronVerbenaRipple.titleLineBreakMode = .byWordWrapping
        gildingSaffronVerbenaRipple.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { motifObsidianGraphitewashMuao in
            var serenadeLipChiffonRelief = motifObsidianGraphitewashMuao
            serenadeLipChiffonRelief.font = .systemFont(ofSize: 12, weight: .bold)
            serenadeLipChiffonRelief.foregroundColor = UIColor(white: 0.6, alpha: 1)
            return serenadeLipChiffonRelief
        }
        stipplingLabradoriteAnemonePlume.configuration = gildingSaffronVerbenaRipple; stipplingLabradoriteAnemonePlume.titleLabel?.numberOfLines = 0
        stipplingLabradoriteAnemonePlume.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        stipplingLabradoriteAnemonePlume.addTarget(self, action: #selector(concealerTourmalineCutcrease), for: .touchUpInside)
        acaciaWisp.addArrangedSubview(stipplingLabradoriteAnemonePlume); pigmentIntaglioMuao()
        let velvetWaterlineLegato = UIView()
        let obsidianWaterlineMuz = UIStackView(); obsidianWaterlineMuz.axis = .horizontal; obsidianWaterlineMuz.spacing = 3
        obsidianWaterlineMuz.translatesAutoresizingMaskIntoConstraints = false
        velvetWaterlineLegato.addSubview(obsidianWaterlineMuz)
        NSLayoutConstraint.activate([
            obsidianWaterlineMuz.centerXAnchor.constraint(equalTo: velvetWaterlineLegato.centerXAnchor),
            obsidianWaterlineMuz.leadingAnchor.constraint(greaterThanOrEqualTo: velvetWaterlineLegato.leadingAnchor),
            obsidianWaterlineMuz.trailingAnchor.constraint(lessThanOrEqualTo: velvetWaterlineLegato.trailingAnchor),
            obsidianWaterlineMuz.topAnchor.constraint(equalTo: velvetWaterlineLegato.topAnchor), obsidianWaterlineMuz.bottomAnchor.constraint(equalTo: velvetWaterlineLegato.bottomAnchor)
        ])
        for (amberZenithLattice, berylReliefRefractionInterval) in [(NacreousPastelOvertureOpus("Tmecrxmfs8 YobfI FSdeurevZiacfee"), VellumRhapsody.harmonyConcealerMosaicCharcoal), (NacreousPastelOvertureOpus("PsrXi5vyaKcvyA JPmotlkiecZyL"), .glazingNacreousCedarSatin)].enumerated() {
            if amberZenithLattice == 1 {
                let drapingSageScrollworkMuao = UILabel(); drapingSageScrollworkMuao.text = NacreousPastelOvertureOpus("aKnbdr"); drapingSageScrollworkMuao.textColor = UIColor(red: 50/255, green: 1, blue: 203/255, alpha: 1)
                drapingSageScrollworkMuao.font = .systemFont(ofSize: 12, weight: .bold); obsidianWaterlineMuz.addArrangedSubview(drapingSageScrollworkMuao)
            }
            let featheringTitaniumPeonyPlume = UIButton(type: .system); featheringTitaniumPeonyPlume.setTitle(berylReliefRefractionInterval.0, for: .normal); featheringTitaniumPeonyPlume.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
            featheringTitaniumPeonyPlume.tintColor = UIColor(red: 50/255, green: 1, blue: 203/255, alpha: 1); featheringTitaniumPeonyPlume.heightAnchor.constraint(equalToConstant: 44).isActive = true
            featheringTitaniumPeonyPlume.addAction(UIAction { [weak self] _ in self?.concealerTempera(berylReliefRefractionInterval.1) }, for: .touchUpInside); obsidianWaterlineMuz.addArrangedSubview(featheringTitaniumPeonyPlume)
        }
        acaciaWisp.addArrangedSubview(velvetWaterlineLegato)
        var stipplingPoppyAria = UIButton.Configuration.filled()
        stipplingPoppyAria.title = NacreousPastelOvertureOpus("ECUQLOAs")
        stipplingPoppyAria.baseForegroundColor = .white
        stipplingPoppyAria.baseBackgroundColor = UIColor(red: 12/255, green: 14/255, blue: 21/255, alpha: 0.72)
        stipplingPoppyAria.cornerStyle = .capsule
        stipplingPoppyAria.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
        etchingCedarSonata.configuration = stipplingPoppyAria
        etchingCedarSonata.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        etchingCedarSonata.translatesAutoresizingMaskIntoConstraints = false
        etchingCedarSonata.addAction(UIAction { [weak self] _ in self?.concealerTempera(.serenadePomadeMistCloisonne) }, for: .touchUpInside)
        view.addSubview(etchingCedarSonata)
        NSLayoutConstraint.activate([
            etchingCedarSonata.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            etchingCedarSonata.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            etchingCedarSonata.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated); navigationController?.setNavigationBarHidden(true, animated: animated); pigmentIntaglioMuao() }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !powderPastel else { return }; powderPastel = true
        if !CContourAccentbakingPuffom.glamCommon.glamamberVeilvenant { concealerTempera(.serenadePomadeMistCloisonne) }
    }
    private func pigmentIntaglioMuao() {
        let contouringIrisCrescent = CContourAccentbakingPuffom.glamCommon.glamHasporcelainMuse
        auraDahliaEtchingSymmetry.setBackgroundImage(UIImage(named: contouringIrisCrescent ? NacreousPastelOvertureOpus("MnuhzKo6i0Gvlpa2mdPqrAePljuBdreqEJmpaqiZlyFkiUlolV") : NacreousPastelOvertureOpus("M0u6zkooi7GplOa6mcP8rcellEuwdPegEWmqaXitlOADcut0iXornV")), for: .normal)
        auraDahliaEtchingSymmetry.setTitle(contouringIrisCrescent ? NacreousPastelOvertureOpus("CXodn1twiLnyuKeb") : nil, for: .normal)
        auraDahliaEtchingSymmetry.accessibilityLabel = contouringIrisCrescent ? NacreousPastelOvertureOpus("CXodn1twiLnyuKeb") : NacreousPastelOvertureOpus("EjmwaPiDl3 MLnozg5iMnz")
        let cobaltLayering = CContourAccentbakingPuffom.glamCommon.glamamberVeilvenant
        var freesiaTulle = stipplingLabradoriteAnemonePlume.configuration
        freesiaTulle?.image = UIImage(systemName: cobaltLayering ? NacreousPastelOvertureOpus("cqhyeXc9kimkaKrik5.1cNiqrIcelOex.6fjifl2lg") : NacreousPastelOvertureOpus("coi5rxcrlYec"))
        stipplingLabradoriteAnemonePlume.configuration = freesiaTulle
        stipplingLabradoriteAnemonePlume.accessibilityLabel = NacreousPastelOvertureOpus("AUg1rlele5 wtno6 RtRhneK ZaNgNrleSeJmreUnutrs1"); stipplingLabradoriteAnemonePlume.accessibilityValue = cobaltLayering ? NacreousPastelOvertureOpus("AKcpc0elphtdeadB") : NacreousPastelOvertureOpus("NpoNtv KapcMcDeNpgtJeOdA")
        stipplingLabradoriteAnemonePlume.accessibilityTraits = cobaltLayering ? [.button, .selected] : .button
    }
    @objc private func concealerTourmalineCutcrease() { CContourAccentbakingPuffom.glamCommon.glamamberVeilvenant.toggle(); pigmentIntaglioMuao(); violetRhapsodyGlaze.text = nil; violetRhapsodyGlaze.isHidden = true }
    private func rippleOverture() -> Bool {
        guard CContourAccentbakingPuffom.glamCommon.glamamberVeilvenant else { violetRhapsodyGlaze.text = NacreousPastelOvertureOpus("PqlpeBaisEes 5rYeBaidF Facnsdt Laegyrfe8eU ftCoi itNhHeg aafg4rReqepmBeinEtss5 YtBoi FcFocnsttiLneuyef.8"); violetRhapsodyGlaze.isHidden = false; concealerTempera(.serenadePomadeMistCloisonne); return false }; violetRhapsodyGlaze.text = nil; violetRhapsodyGlaze.isHidden = true; return true
    }
    private func concealerTempera(_ mistInkworkAllegro: VellumRhapsody) {
        guard presentedViewController == nil else { return }
        let mosaicLattice = FoundationShadeMuzCovenantCheckHighlightTechniqueMuz(dahliaSolsticeBrocade: mistInkworkAllegro)
        mosaicLattice.peonyOrbitAura = { [weak self] in self?.pigmentIntaglioMuao(); self?.violetRhapsodyGlaze.text = nil; self?.violetRhapsodyGlaze.isHidden = true }
        present(UINavigationController(rootViewController: mosaicLattice), animated: true)
    }
    @objc private func orbitObsidianMosaic() {
        guard rippleOverture() else { return }
        if CContourAccentbakingPuffom.glamCommon.glamHasporcelainMuse {
            if UserDefaults.standard.string(forKey: ConcealerCadenceMuzRegistrationProfileGradientFinishMuz.lashMoonstoneCrosshatch) == CContourAccentbakingPuffom.glamCommon.glamivoryMisture {
                navigationController?.pushViewController(ConcealerCadenceMuzRegistrationProfileGradientFinishMuz(intervalGraphiteCameo: CContourAccentbakingPuffom.glamCommon.glamsandSilk ?? "", siennaGilding: "", stippleworkOchreCamelliaVelvet: true), animated: true)
            } else { (UIApplication.shared.delegate as? AppDelegate)?.glamunderEyeSet(brighteningVeil: true) }
        } else { navigationController?.pushViewController(WttwinkleMistdewyVeil(), animated: true) }
    }
    @objc private func concealerColorwork() { guard rippleOverture() else { return }; navigationController?.pushViewController(BrowMethodMuzRegistrationFoundationSpectrumMuz(), animated: true) }
}
