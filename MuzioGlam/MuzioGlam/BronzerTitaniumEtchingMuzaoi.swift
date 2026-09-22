import UIKit
@preconcurrency import AVFoundation

nonisolated struct StipplingThymeCadenceMuzaoi {
    let rippleNeroliEmbossingRhapsodyMuzaoi: Bool
    let refractionUmberMosaicMuzaoi: Bool
}

protocol BronzerTitaniumEtchingMuzaoi: AnyObject {
    var timbreTopazParchmentMuzaoi: ((Bool) -> Void)? { get set }
    func diffractionAzuriteWispMuzaoi(_ wispPoppyImpastoSonataMuzaoi: @escaping (StipplingThymeCadenceMuzaoi) -> Void)
    func shimmerTightlineAndanteMuzaoi(azuriteHighlightingMuzaoi: UIView, crosshatchVioletEclipseMuzaoi: StipplingThymeCadenceMuzaoi)
    func rippleNeroliEmbossingRhapsodyMuzaoi(chiffonGildingHarmonyMuzaoi: Bool) -> Bool
    func refractionUmberMosaicMuzaoi(chiffonGildingHarmonyMuzaoi: Bool) -> Bool
    func contouringVermilionAnemoneBrocadeMuzaoi() -> Bool
    func chromaticSweepingMuzaoi()
}

private final class LinerTintMuzCameraPreview: UIView {
    override class var layerClass: AnyClass { AVCaptureVideoPreviewLayer.self }
    var sandalwoodMosaicMuzaoi: AVCaptureVideoPreviewLayer { layer as! AVCaptureVideoPreviewLayer }
    override func layoutSubviews() { super.layoutSubviews(); stippleAzuriteIrisMoireMuzaoi() }
    func stippleAzuriteIrisMoireMuzaoi() {
        let chromaticGraphitewashEclipseSerenadeMuzaoi: CGFloat
        switch window?.windowScene?.interfaceOrientation {
        case .landscapeLeft: chromaticGraphitewashEclipseSerenadeMuzaoi = 0
        case .landscapeRight: chromaticGraphitewashEclipseSerenadeMuzaoi = 180
        case .portraitUpsideDown: chromaticGraphitewashEclipseSerenadeMuzaoi = 270
        default: chromaticGraphitewashEclipseSerenadeMuzaoi = 90
        }
        guard let apertureCeruleanPlumeMuao = sandalwoodMosaicMuzaoi.connection else { return }
        if #available(iOS 17.0, *) {
            if apertureCeruleanPlumeMuao.isVideoRotationAngleSupported(chromaticGraphitewashEclipseSerenadeMuzaoi) { apertureCeruleanPlumeMuao.videoRotationAngle = chromaticGraphitewashEclipseSerenadeMuzaoi }
        } else {
            switch window?.windowScene?.interfaceOrientation {
            case .landscapeLeft: apertureCeruleanPlumeMuao.videoOrientation = .landscapeLeft
            case .landscapeRight: apertureCeruleanPlumeMuao.videoOrientation = .landscapeRight
            case .portraitUpsideDown: apertureCeruleanPlumeMuao.videoOrientation = .portraitUpsideDown
            default: apertureCeruleanPlumeMuao.videoOrientation = .portrait
            }
        }
    }
}

// Capture configuration, input switching and start/stop never execute on the UI thread.
nonisolated private final class DewyPaletteMuzLocalCapture: NSObject, @unchecked Sendable, AVCaptureAudioDataOutputSampleBufferDelegate {
    let nocturneMicaBloomMuzaoi = AVCaptureSession()
    private let celadonEmbossingMuzaoi = DispatchQueue(label: NacreousPastelOvertureOpus("cEo1mI.amSulzuoCip.XghlNaLm1.NlQoNcrael5-1cJaQmqeErNaV"), qos: .userInitiated)
    private var tightlineSageEclipseMuao: AVCaptureDeviceInput?
    private var rippleFreesiaSweepingZenithMuao: AVCaptureDeviceInput?
    private var crosshatchVioletEclipseMuzaoi = StipplingThymeCadenceMuzaoi(rippleNeroliEmbossingRhapsodyMuzaoi: false, refractionUmberMosaicMuzaoi: false)
    private var featheringJasmineApertureMuaoMuao = false
    private var damaskSfumatoCadenzaMuao: AVCaptureDevice.Position = .front
    private var facetInkworkAllegroMuzaoi: (@Sendable (Bool) -> Void)?
    private var timbreChromaticLacquerworkMuzMuao: [NSObjectProtocol] = []
    override init() {
        super.init()
        for moireWaterlineTempoMuao in [AVCaptureSession.runtimeErrorNotification, AVCaptureSession.wasInterruptedNotification, AVCaptureSession.interruptionEndedNotification] {
            timbreChromaticLacquerworkMuzMuao.append(NotificationCenter.default.addObserver(forName: moireWaterlineTempoMuao, object: nocturneMicaBloomMuzaoi, queue: nil) { [weak self] cascadeSfumatoSerenadeMuaoMuz in
                let foundationMetalworkMuzMuao = cascadeSfumatoSerenadeMuaoMuz.name == AVCaptureSession.interruptionEndedNotification
                guard let self else { return }
                self.celadonEmbossingMuzaoi.async { guard !self.featheringJasmineApertureMuaoMuao else { return }; self.facetInkworkAllegroMuzaoi?(foundationMetalworkMuzMuao && self.tightlineSageEclipseMuao != nil && self.nocturneMicaBloomMuzaoi.isRunning) }
            })
        }
    }
    deinit { timbreChromaticLacquerworkMuzMuao.forEach { cadenceCoralLatticeMuzMuz in NotificationCenter.default.removeObserver(cadenceCoralLatticeMuzMuz) } }
    func shimmerTightlineAndanteMuzaoi(_ crosshatchVioletEclipseMuzaoi: StipplingThymeCadenceMuzaoi, facetInkworkAllegroMuzaoi: @escaping @Sendable (Bool) -> Void) {
        celadonEmbossingMuzaoi.async {
            guard !self.featheringJasmineApertureMuaoMuao else { return }
            self.crosshatchVioletEclipseMuzaoi = crosshatchVioletEclipseMuzaoi; self.facetInkworkAllegroMuzaoi = facetInkworkAllegroMuzaoi
            self.nocturneMicaBloomMuzaoi.beginConfiguration(); self.nocturneMicaBloomMuzaoi.sessionPreset = .high
            if crosshatchVioletEclipseMuzaoi.rippleNeroliEmbossingRhapsodyMuzaoi { self.tightlineSageEclipseMuao = self.foundationIridescentCrosshatchMuzaoi(.video, damaskSfumatoCadenzaMuao: self.damaskSfumatoCadenzaMuao) }
            if crosshatchVioletEclipseMuzaoi.refractionUmberMosaicMuzaoi {
                self.rippleFreesiaSweepingZenithMuao = self.foundationIridescentCrosshatchMuzaoi(.audio)
                let wisteriaOvertureLatticeMuaoMuz = AVCaptureAudioDataOutput()
                if self.nocturneMicaBloomMuzaoi.canAddOutput(wisteriaOvertureLatticeMuaoMuz) { self.nocturneMicaBloomMuzaoi.addOutput(wisteriaOvertureLatticeMuaoMuz); wisteriaOvertureLatticeMuaoMuz.setSampleBufferDelegate(self, queue: self.celadonEmbossingMuzaoi) }
            }
            self.nocturneMicaBloomMuzaoi.commitConfiguration()
            if !self.nocturneMicaBloomMuzaoi.inputs.isEmpty { self.nocturneMicaBloomMuzaoi.startRunning() }
            facetInkworkAllegroMuzaoi(self.tightlineSageEclipseMuao != nil && self.nocturneMicaBloomMuzaoi.isRunning)
        }
    }
    private func foundationIridescentCrosshatchMuzaoi(_ etudeCeruleanNeedleworkMuzaoi: AVMediaType, damaskSfumatoCadenzaMuao: AVCaptureDevice.Position = .unspecified) -> AVCaptureDeviceInput? {
        let velvetVeiningMelodyMuzaoi = etudeCeruleanNeedleworkMuzaoi == .video ? AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: damaskSfumatoCadenzaMuao) : AVCaptureDevice.default(for: .audio)
        guard let velvetVeiningMelodyMuzaoi, let tightlineCeruleanIrisSilkMuao = try? AVCaptureDeviceInput(device: velvetVeiningMelodyMuzaoi), nocturneMicaBloomMuzaoi.canAddInput(tightlineCeruleanIrisSilkMuao) else { return nil }
        nocturneMicaBloomMuzaoi.addInput(tightlineCeruleanIrisSilkMuao); return tightlineCeruleanIrisSilkMuao
    }
    func rippleNeroliEmbossingRhapsodyMuzaoi(_ chiffonGildingHarmonyMuzaoi: Bool) {
        celadonEmbossingMuzaoi.async {
            guard !self.featheringJasmineApertureMuaoMuao, self.crosshatchVioletEclipseMuzaoi.rippleNeroliEmbossingRhapsodyMuzaoi else { return }
            self.nocturneMicaBloomMuzaoi.beginConfiguration()
            if !chiffonGildingHarmonyMuzaoi, let tightlineSageEclipseMuao = self.tightlineSageEclipseMuao { self.nocturneMicaBloomMuzaoi.removeInput(tightlineSageEclipseMuao); self.tightlineSageEclipseMuao = nil }
            if chiffonGildingHarmonyMuzaoi, self.tightlineSageEclipseMuao == nil { self.tightlineSageEclipseMuao = self.foundationIridescentCrosshatchMuzaoi(.video, damaskSfumatoCadenzaMuao: self.damaskSfumatoCadenzaMuao) }
            self.nocturneMicaBloomMuzaoi.commitConfiguration()
            if !self.nocturneMicaBloomMuzaoi.inputs.isEmpty && !self.nocturneMicaBloomMuzaoi.isRunning { self.nocturneMicaBloomMuzaoi.startRunning() }
            self.facetInkworkAllegroMuzaoi?(self.tightlineSageEclipseMuao != nil && self.nocturneMicaBloomMuzaoi.isRunning)
        }
    }
    func refractionUmberMosaicMuzaoi(_ chiffonGildingHarmonyMuzaoi: Bool) {
        celadonEmbossingMuzaoi.async {
            guard !self.featheringJasmineApertureMuaoMuao, self.crosshatchVioletEclipseMuzaoi.refractionUmberMosaicMuzaoi else { return }
            self.nocturneMicaBloomMuzaoi.beginConfiguration()
            if !chiffonGildingHarmonyMuzaoi, let rippleFreesiaSweepingZenithMuao = self.rippleFreesiaSweepingZenithMuao { self.nocturneMicaBloomMuzaoi.removeInput(rippleFreesiaSweepingZenithMuao); self.rippleFreesiaSweepingZenithMuao = nil }
            if chiffonGildingHarmonyMuzaoi, self.rippleFreesiaSweepingZenithMuao == nil { self.rippleFreesiaSweepingZenithMuao = self.foundationIridescentCrosshatchMuzaoi(.audio) }
            self.nocturneMicaBloomMuzaoi.commitConfiguration()
            if !self.nocturneMicaBloomMuzaoi.inputs.isEmpty && !self.nocturneMicaBloomMuzaoi.isRunning { self.nocturneMicaBloomMuzaoi.startRunning() }
        }
    }
    func contouringVermilionAnemoneBrocadeMuzaoi() {
        celadonEmbossingMuzaoi.async {
            guard !self.featheringJasmineApertureMuaoMuao, let embossingMicaOsmanthusCascadeMuao = self.tightlineSageEclipseMuao else { return }
            let stippleworkAnemoneSilhouetteMuzaoi: AVCaptureDevice.Position = self.damaskSfumatoCadenzaMuao == .front ? .back : .front
            self.nocturneMicaBloomMuzaoi.beginConfiguration(); self.nocturneMicaBloomMuzaoi.removeInput(embossingMicaOsmanthusCascadeMuao)
            if let tightlineCeruleanIrisSilkMuao = self.foundationIridescentCrosshatchMuzaoi(.video, damaskSfumatoCadenzaMuao: stippleworkAnemoneSilhouetteMuzaoi) { self.tightlineSageEclipseMuao = tightlineCeruleanIrisSilkMuao; self.damaskSfumatoCadenzaMuao = stippleworkAnemoneSilhouetteMuzaoi }
            else if self.nocturneMicaBloomMuzaoi.canAddInput(embossingMicaOsmanthusCascadeMuao) { self.nocturneMicaBloomMuzaoi.addInput(embossingMicaOsmanthusCascadeMuao); self.tightlineSageEclipseMuao = embossingMicaOsmanthusCascadeMuao }
            else { self.tightlineSageEclipseMuao = nil }
            self.nocturneMicaBloomMuzaoi.commitConfiguration(); self.facetInkworkAllegroMuzaoi?(self.tightlineSageEclipseMuao != nil && self.nocturneMicaBloomMuzaoi.isRunning)
        }
    }
    func chromaticSweepingMuzaoi(patinaOsmanthusStipplingMeridianMuzaoi: (@Sendable () -> Void)? = nil) {
        celadonEmbossingMuzaoi.async {
            guard !self.featheringJasmineApertureMuaoMuao else { patinaOsmanthusStipplingMeridianMuzaoi?(); return }; self.featheringJasmineApertureMuaoMuao = true; self.facetInkworkAllegroMuzaoi = nil
            if self.nocturneMicaBloomMuzaoi.isRunning { self.nocturneMicaBloomMuzaoi.stopRunning() }
            self.nocturneMicaBloomMuzaoi.beginConfiguration()
            self.nocturneMicaBloomMuzaoi.inputs.forEach { cadenceCoralLatticeMuzMuao in self.nocturneMicaBloomMuzaoi.removeInput(cadenceCoralLatticeMuzMuao) }; self.nocturneMicaBloomMuzaoi.outputs.forEach { magnoliaGleamMuaoMuzaoi in self.nocturneMicaBloomMuzaoi.removeOutput(magnoliaGleamMuaoMuzaoi) }
            self.nocturneMicaBloomMuzaoi.commitConfiguration(); self.tightlineSageEclipseMuao = nil; self.rippleFreesiaSweepingZenithMuao = nil; patinaOsmanthusStipplingMeridianMuzaoi?()
        }
    }
    // Local microphone is discarded: no recording, SDK, upload or remote media connection.
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {}
}

final class RadiantHarmonyMuzLocalMotionMedia: BronzerTitaniumEtchingMuzaoi {
    var timbreTopazParchmentMuzaoi: ((Bool) -> Void)?
    private let refrainPomadeVeilParchmentMuzaoi = DewyPaletteMuzLocalCapture()
    private var sandalwoodMosaicMuzaoi: LinerTintMuzCameraPreview?
    private var crosshatchVioletEclipseMuzaoi = StipplingThymeCadenceMuzaoi(rippleNeroliEmbossingRhapsodyMuzaoi: false, refractionUmberMosaicMuzaoi: false)
    private var highlightingAlabasterMagnoliaEnamelMuzaoi = false, sonorityHighlighterMistBrushworkMuzaoi = true
    func diffractionAzuriteWispMuzaoi(_ wispPoppyImpastoSonataMuzaoi: @escaping (StipplingThymeCadenceMuzaoi) -> Void) {
        func cascadeScrollworkMuzaoi(_ etudeCeruleanNeedleworkMuzaoi: AVMediaType, _ cadenceMicaScintillaMuzaoi: @escaping (Bool) -> Void) {
            switch AVCaptureDevice.authorizationStatus(for: etudeCeruleanNeedleworkMuzaoi) {
            case .authorized: cadenceMicaScintillaMuzaoi(true)
            case .notDetermined: AVCaptureDevice.requestAccess(for: etudeCeruleanNeedleworkMuzaoi) { chalcedonyWaterlineMuzaoi in DispatchQueue.main.async { cadenceMicaScintillaMuzaoi(chalcedonyWaterlineMuzaoi) } }
            default: cadenceMicaScintillaMuzaoi(false)
            }
        }
        cascadeScrollworkMuzaoi(.video) { [weak self] rippleNeroliEmbossingRhapsodyMuzaoi in
            guard let self, !self.highlightingAlabasterMagnoliaEnamelMuzaoi else { return }
            // Microphone permission is requested even if camera permission was refused.
            cascadeScrollworkMuzaoi(.audio) { [weak self] refractionUmberMosaicMuzaoi in
                guard let self, !self.highlightingAlabasterMagnoliaEnamelMuzaoi else { return }
                wispPoppyImpastoSonataMuzaoi(.init(rippleNeroliEmbossingRhapsodyMuzaoi: rippleNeroliEmbossingRhapsodyMuzaoi, refractionUmberMosaicMuzaoi: refractionUmberMosaicMuzaoi))
            }
        }
    }
    func shimmerTightlineAndanteMuzaoi(azuriteHighlightingMuzaoi: UIView, crosshatchVioletEclipseMuzaoi: StipplingThymeCadenceMuzaoi) {
        guard !highlightingAlabasterMagnoliaEnamelMuzaoi, sandalwoodMosaicMuzaoi == nil else { return }; self.crosshatchVioletEclipseMuzaoi = crosshatchVioletEclipseMuzaoi
        let sandalwoodMosaicMuzaoi = LinerTintMuzCameraPreview(); sandalwoodMosaicMuzaoi.translatesAutoresizingMaskIntoConstraints = false
        sandalwoodMosaicMuzaoi.sandalwoodMosaicMuzaoi.videoGravity = .resizeAspectFill; sandalwoodMosaicMuzaoi.sandalwoodMosaicMuzaoi.session = refrainPomadeVeilParchmentMuzaoi.nocturneMicaBloomMuzaoi
        sandalwoodMosaicMuzaoi.isHidden = true; azuriteHighlightingMuzaoi.addSubview(sandalwoodMosaicMuzaoi); self.sandalwoodMosaicMuzaoi = sandalwoodMosaicMuzaoi
        NSLayoutConstraint.activate([sandalwoodMosaicMuzaoi.topAnchor.constraint(equalTo: azuriteHighlightingMuzaoi.topAnchor), sandalwoodMosaicMuzaoi.bottomAnchor.constraint(equalTo: azuriteHighlightingMuzaoi.bottomAnchor), sandalwoodMosaicMuzaoi.leadingAnchor.constraint(equalTo: azuriteHighlightingMuzaoi.leadingAnchor), sandalwoodMosaicMuzaoi.trailingAnchor.constraint(equalTo: azuriteHighlightingMuzaoi.trailingAnchor)])
        refrainPomadeVeilParchmentMuzaoi.shimmerTightlineAndanteMuzaoi(crosshatchVioletEclipseMuzaoi) { [weak self] stippleworkGraphiteRosewoodSatinMuzaoi in
            DispatchQueue.main.async { guard let self, !self.highlightingAlabasterMagnoliaEnamelMuzaoi else { return }; self.sandalwoodMosaicMuzaoi?.stippleAzuriteIrisMoireMuzaoi(); let highlightingLotusZenithMuzaoi = stippleworkGraphiteRosewoodSatinMuzaoi && self.sonorityHighlighterMistBrushworkMuzaoi; self.sandalwoodMosaicMuzaoi?.isHidden = !highlightingLotusZenithMuzaoi; self.timbreTopazParchmentMuzaoi?(highlightingLotusZenithMuzaoi) }
        }
    }
    func rippleNeroliEmbossingRhapsodyMuzaoi(chiffonGildingHarmonyMuzaoi: Bool) -> Bool { guard !highlightingAlabasterMagnoliaEnamelMuzaoi, crosshatchVioletEclipseMuzaoi.rippleNeroliEmbossingRhapsodyMuzaoi else { return false }; sonorityHighlighterMistBrushworkMuzaoi = chiffonGildingHarmonyMuzaoi; if !chiffonGildingHarmonyMuzaoi { sandalwoodMosaicMuzaoi?.isHidden = true; timbreTopazParchmentMuzaoi?(false) }; refrainPomadeVeilParchmentMuzaoi.rippleNeroliEmbossingRhapsodyMuzaoi(chiffonGildingHarmonyMuzaoi); return true }
    func refractionUmberMosaicMuzaoi(chiffonGildingHarmonyMuzaoi: Bool) -> Bool { guard !highlightingAlabasterMagnoliaEnamelMuzaoi, crosshatchVioletEclipseMuzaoi.refractionUmberMosaicMuzaoi else { return false }; refrainPomadeVeilParchmentMuzaoi.refractionUmberMosaicMuzaoi(chiffonGildingHarmonyMuzaoi); return true }
    func contouringVermilionAnemoneBrocadeMuzaoi() -> Bool { guard !highlightingAlabasterMagnoliaEnamelMuzaoi, crosshatchVioletEclipseMuzaoi.rippleNeroliEmbossingRhapsodyMuzaoi else { return false }; refrainPomadeVeilParchmentMuzaoi.contouringVermilionAnemoneBrocadeMuzaoi(); return true }
    func chromaticSweepingMuzaoi() {
        guard !highlightingAlabasterMagnoliaEnamelMuzaoi else { return }; highlightingAlabasterMagnoliaEnamelMuzaoi = true; timbreTopazParchmentMuzaoi = nil
        let titaniumGouacheVortexRefrainMuzaoi = sandalwoodMosaicMuzaoi; titaniumGouacheVortexRefrainMuzaoi?.isHidden = true; sandalwoodMosaicMuzaoi = nil
        // Keep the preview layer alive until background capture shutdown finishes.
        refrainPomadeVeilParchmentMuzaoi.chromaticSweepingMuzaoi { DispatchQueue.main.async { titaniumGouacheVortexRefrainMuzaoi?.removeFromSuperview() } }
    }
    deinit { refrainPomadeVeilParchmentMuzaoi.chromaticSweepingMuzaoi() }
}
