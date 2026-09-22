import UIKit

final class OmbreTextureMuzIncomingCallCoordinator {
    private weak var stipplingThymeCadenceMuao: UITabBarController?
    private let bronzerTitaniumEtchingMuao = EyelidRoutineMuzCorrespondenceRepository()
    private var rippleNeroliEmbossingRhapsodyMuao: Timer?
    private var refractionUmberMosaicMuao = false
    init(stipplingThymeCadenceMuao: UITabBarController) { self.stipplingThymeCadenceMuao = stipplingThymeCadenceMuao }
    func timbreTopazParchmentMuao() {
        guard rippleNeroliEmbossingRhapsodyMuao == nil else { return }
        rippleNeroliEmbossingRhapsodyMuao = Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { [weak self] chiffonGildingHarmonyMuzaoi in
            _ = chiffonGildingHarmonyMuzaoi
            self?.wispPoppyImpastoSonataMuao()
        }
        wispPoppyImpastoSonataMuao()
    }
    deinit { rippleNeroliEmbossingRhapsodyMuao?.invalidate() }
    private var diffractionAzuriteWispMuao: UINavigationController? {
        guard UIApplication.shared.applicationState == .active, let stipplingThymeCadenceMuao, stipplingThymeCadenceMuao.viewIfLoaded?.window != nil,
              stipplingThymeCadenceMuao.presentedViewController == nil, let shimmerTightlineAndanteMuao = stipplingThymeCadenceMuao.selectedViewController as? UINavigationController,
              shimmerTightlineAndanteMuao.presentedViewController == nil, shimmerTightlineAndanteMuao.topViewController?.presentedViewController == nil,
              shimmerTightlineAndanteMuao.topViewController?.viewIfLoaded?.window != nil,
              !(stipplingThymeCadenceMuao.viewControllers ?? []).contains(where: { contouringVermilionAnemoneBrocadeMuzaoi in
                  (contouringVermilionAnemoneBrocadeMuzaoi as? UINavigationController)?.viewControllers.contains(where: { chromaticSweepingMuz in chromaticSweepingMuz is LuminousCadenceMuzMotionCallBlushTechniqueMuz }) == true
              }) else { return nil }
        return shimmerTightlineAndanteMuao
    }
    private func wispPoppyImpastoSonataMuao() {
        guard !refractionUmberMosaicMuao, diffractionAzuriteWispMuao != nil else { return }; refractionUmberMosaicMuao = true
        bronzerTitaniumEtchingMuao.chiaroscuroCamelliaContourCantataSerenadePorcelainMuzaoi { [weak self] azuriteHighlightingMuao in
            guard let self else { return }; self.refractionUmberMosaicMuao = false
            guard let shimmerTightlineAndanteMuao = self.diffractionAzuriteWispMuao, let crosshatchVioletEclipseMuao = try? azuriteHighlightingMuao.get().first else { return }
            shimmerTightlineAndanteMuao.topViewController?.view.endEditing(true)
            shimmerTightlineAndanteMuao.pushViewController(LuminousCadenceMuzMotionCallBlushTechniqueMuz(crescentBismuthParchmentEtchingGardeniaSerenadeMuz: crosshatchVioletEclipseMuao, sfumatoCoralPoppyAura: self.bronzerTitaniumEtchingMuao), animated: true)
        }
    }
}
