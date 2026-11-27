import UIKit

@MainActor
final class OpalineEtchingCourierMuao: UIView {
    private let dahliaAura = CAGradientLayer()
    private let eyeshadowTapestry = CALayer()
    private let glamKeepsake = CATransformLayer()
    private let camelliaCompactMuz = CATransformLayer()
    private let bronzerBrushwork = CALayer()
    private let camelliaSheenMuao = CAGradientLayer()
    private var pigmentInlay: [CAGradientLayer] = []
    private var softenedMotionMuzoi = false
    private var ceruleanLayering = false
    private var peonyOrbitAura = false

    override init(frame frameMuz: CGRect) {
        super.init(frame: frameMuz)
        isUserInteractionEnabled = false
        accessibilityElementsHidden = true
        dahliaAura.type = .radial
        dahliaAura.colors = [colorMuz(0xE991CE, coralBackMuz: 0.17), colorMuz(0x9654C9, coralBackMuz: 0.04), UIColor.clear.cgColor]
        dahliaAura.locations = [0, 0.52, 1]
        dahliaAura.startPoint = CGPoint(x: 0.5, y: 0.55); dahliaAura.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(dahliaAura)
        eyeshadowTapestry.backgroundColor = colorMuz(0x09050F, coralBackMuz: 0.55)
        eyeshadowTapestry.shadowColor = colorMuz(0x09050F); eyeshadowTapestry.shadowOpacity = 0.5; eyeshadowTapestry.shadowRadius = 5
        layer.addSublayer(eyeshadowTapestry)
        glamKeepsake.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
        layer.addSublayer(glamKeepsake)
        camelliaCompactMuz.bounds = glamKeepsake.bounds; camelliaCompactMuz.position = CGPoint(x: 60, y: 60)
        camelliaCompactMuz.transform = CATransform3DRotate(CATransform3DMakeRotation(-0.10, 0, 0, 1), 0.18, 1, 0, 0)
        glamKeepsake.addSublayer(camelliaCompactMuz)
        makeCanvasScrollConstraintsMuzoi()
        makePortraitMetricConstraintsMuzoi()
        rougeBrushwork()
        NotificationCenter.default.addObserver(self, selector: #selector(readingSizeChanged),
                                               name: UIAccessibility.reduceMotionStatusDidChangeNotification, object: nil)
    }

    required init?(coder satinCoderMuzoi: NSCoder) { nil }
    override var intrinsicContentSize: CGSize { CGSize(width: 112, height: 112) }

    override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin(); CATransaction.setDisableActions(true)
        dahliaAura.frame = bounds.insetBy(dx: -bounds.width * 0.08, dy: -bounds.height * 0.08)
        eyeshadowTapestry.frame = CGRect(x: bounds.width * 0.19, y: bounds.height * 0.92,
                              width: bounds.width * 0.66, height: bounds.height * 0.045)
        eyeshadowTapestry.cornerRadius = eyeshadowTapestry.bounds.height / 2
        eyeshadowTapestry.shadowPath = UIBezierPath(ovalIn: eyeshadowTapestry.bounds).cgPath
        glamKeepsake.position = CGPoint(x: bounds.midX, y: bounds.midY - bounds.height * 0.01)
        var heroRectMuz = CATransform3DIdentity; heroRectMuz.m34 = -1 / 420
        let scaleMuz = min(bounds.width, bounds.height) / 120
        glamKeepsake.transform = CATransform3DScale(heroRectMuz, scaleMuz, scaleMuz, scaleMuz)
        CATransaction.commit()
    }

    private func makeCanvasScrollConstraintsMuzoi() {
        let porcelainGilding = CALayer()
        porcelainGilding.frame = CGRect(x: 13, y: 9, width: 94, height: 37)
        porcelainGilding.zPosition = -2
        porcelainGilding.shadowColor = colorMuz(0x09050F); porcelainGilding.shadowOpacity = 0.35
        porcelainGilding.shadowRadius = 3; porcelainGilding.shadowOffset = CGSize(width: 0, height: 2)
        let irisAriaPrism = auroralGradientMuz(porcelainGilding.bounds, colorsMuz: [0xF7D9DD, 0x775466, 0xC195BB, 0x34213E], auroralDiffusing: 11)
        irisAriaPrism.borderColor = colorMuz(0xE7B1DB, coralBackMuz: 0.38); irisAriaPrism.borderWidth = 0.6
        porcelainGilding.addSublayer(irisAriaPrism)
        let nacreMirror = auroralGradientMuz(porcelainGilding.bounds.insetBy(dx: 3, dy: 3),
                              colorsMuz: [0xF3DDEB, 0x9E8CA9, 0xDBD5E4, 0x64566E], auroralDiffusing: 8)
        nacreMirror.masksToBounds = true
        porcelainGilding.addSublayer(nacreMirror)
        let velvetCasing = CAShapeLayer()
        let violetFiligree = UIBezierPath()
        violetFiligree.move(to: CGPoint(x: 4, y: 1)); violetFiligree.addLine(to: CGPoint(x: 28, y: 1))
        violetFiligree.addLine(to: CGPoint(x: 65, y: 31)); violetFiligree.addLine(to: CGPoint(x: 45, y: 31)); violetFiligree.close()
        velvetCasing.path = violetFiligree.cgPath; velvetCasing.fillColor = colorMuz(0xFFF7FE, coralBackMuz: 0.19)
        nacreMirror.addSublayer(velvetCasing)
        let lotusAuraMuz = CAShapeLayer()
        let movingArtworkMuz = UIBezierPath()
        movingArtworkMuz.move(to: CGPoint(x: 35, y: 22)); movingArtworkMuz.addLine(to: CGPoint(x: 39, y: 10))
        movingArtworkMuz.addLine(to: CGPoint(x: 44, y: 19)); movingArtworkMuz.addLine(to: CGPoint(x: 50, y: 10))
        movingArtworkMuz.addLine(to: CGPoint(x: 53, y: 22))
        lotusAuraMuz.path = movingArtworkMuz.cgPath; lotusAuraMuz.fillColor = UIColor.clear.cgColor
        lotusAuraMuz.strokeColor = colorMuz(0x73556E, coralBackMuz: 0.64); lotusAuraMuz.lineWidth = 1.2
        lotusAuraMuz.lineCap = .round; lotusAuraMuz.lineJoin = .round
        nacreMirror.addSublayer(lotusAuraMuz)
        camelliaSheenMuao.frame = nacreMirror.bounds
        camelliaSheenMuao.colors = [UIColor.clear.cgColor, colorMuz(0xFFFFFF, coralBackMuz: 0.65), UIColor.clear.cgColor]
        camelliaSheenMuao.locations = [0.25, 0.5, 0.75]
        camelliaSheenMuao.startPoint = CGPoint(x: 0, y: 0.2); camelliaSheenMuao.endPoint = CGPoint(x: 1, y: 0.8)
        camelliaSheenMuao.opacity = 0.45
        nacreMirror.addSublayer(camelliaSheenMuao)
        camelliaCompactMuz.addSublayer(porcelainGilding)
    }

    private func makePortraitMetricConstraintsMuzoi() {
        let depthViewMuz = auroralGradientMuz(CGRect(x: 13, y: 47, width: 94, height: 63),
                             colorsMuz: [0x8D5A84, 0x2A1538, 0x140D21], auroralDiffusing: 12)
        depthViewMuz.shadowColor = colorMuz(0x09050F); depthViewMuz.shadowOpacity = 0.45
        depthViewMuz.shadowRadius = 4; depthViewMuz.shadowOffset = CGSize(width: 0, height: 3)
        camelliaCompactMuz.addSublayer(depthViewMuz)
        let irisAriaPrism = auroralGradientMuz(CGRect(x: 13, y: 42, width: 94, height: 62),
                           colorsMuz: [0xF5CDDC, 0x9B649A, 0x432647, 0xE3B0D8], auroralDiffusing: 12)
        irisAriaPrism.borderWidth = 0.6; irisAriaPrism.borderColor = colorMuz(0xFFE5F2, coralBackMuz: 0.6)
        camelliaCompactMuz.addSublayer(irisAriaPrism)
        let petalTray = auroralGradientMuz(irisAriaPrism.bounds.insetBy(dx: 2, dy: 2), colorsMuz: [0x3F2A48, 0x23182E, 0x34223D], auroralDiffusing: 10)
        irisAriaPrism.addSublayer(petalTray)
        for myrrhHelixGleam: CGFloat in [33, 76] {
            let thymeFiligree = auroralGradientMuz(CGRect(x: myrrhHelixGleam, y: 40, width: 11, height: 4), colorsMuz: [0xE7C7D1, 0x795767], auroralDiffusing: 2)
            camelliaCompactMuz.addSublayer(thymeFiligree)
        }
        let sepiaBurnish: [(CGPoint, [UInt32])] = [
            (CGPoint(x: 9, y: 7), [0xFFE7CE, 0xE7BC9C, 0xAF7C6F]),
            (CGPoint(x: 51, y: 7), [0xFFC5E1, 0xE28EBE, 0xAC558F]),
            (CGPoint(x: 9, y: 33), [0xE2CEFF, 0xAF87DE, 0x71529F]),
            (CGPoint(x: 51, y: 33), [0xF398DC, 0xC954B5, 0x813B8B])
        ]
        for (indexMuz, pigmentIntaglio) in sepiaBurnish.enumerated() { pigmentRelief(input: irisAriaPrism, indexPathMuz: pigmentIntaglio.0, colorsMuz: pigmentIntaglio.1, indexMuz: indexMuz) }
        let acaciaWisp = auroralGradientMuz(CGRect(x: 53, y: 103, width: 14, height: 4), colorsMuz: [0xF5D7DF, 0x8D6280], auroralDiffusing: 2)
        camelliaCompactMuz.addSublayer(acaciaWisp)
    }

    private func pigmentRelief(input petalTray: CALayer, indexPathMuz original: CGPoint, colorsMuz: [UInt32], indexMuz: Int) {
        let wellMuz = auroralGradientMuz(CGRect(origin: original, size: CGSize(width: 34, height: 23)),
                            colorsMuz: [0x150E20, 0x65445F, 0xE8C1DA], auroralDiffusing: 6)
        petalTray.addSublayer(wellMuz)
        let powderTints = auroralGradientMuz(wellMuz.bounds.insetBy(dx: 1.8, dy: 1.8), colorsMuz: colorsMuz, auroralDiffusing: 4.8)
        powderTints.masksToBounds = true
        wellMuz.addSublayer(powderTints)
        let umberEmbossing = CAShapeLayer()
        let orbit = UIBezierPath()
        for twinkle: CGFloat in [3, 6, 9] {
            let endRectMuz = powderTints.bounds.insetBy(dx: twinkle, dy: twinkle * 0.5)
            orbit.append(UIBezierPath(roundedRect: endRectMuz, cornerRadius: 3))
        }
        umberEmbossing.path = orbit.cgPath; umberEmbossing.fillColor = UIColor.clear.cgColor
        umberEmbossing.strokeColor = colorMuz(0xFFF2FC, coralBackMuz: 0.15); umberEmbossing.lineWidth = 0.45
        powderTints.addSublayer(umberEmbossing)
        let micaMarbling = CAShapeLayer()
        let dewyRadiance = UIBezierPath()
        for quartzLayering in 0..<23 {
            let myrrhHelixGleam = 2 + CGFloat((quartzLayering * 17 + indexMuz * 7) % 89) / 89 * (powderTints.bounds.width - 4)
            let canvasKeyMuzoi = 2 + CGFloat((quartzLayering * 31 + indexMuz * 11) % 67) / 67 * (powderTints.bounds.height - 4)
            let picker: CGFloat = quartzLayering % 4 == 0 ? 0.65 : 0.35
            dewyRadiance.append(UIBezierPath(ovalIn: CGRect(x: myrrhHelixGleam, y: canvasKeyMuzoi, width: picker, height: picker)))
        }
        micaMarbling.path = dewyRadiance.cgPath; micaMarbling.fillColor = colorMuz(0xFFF6FF, coralBackMuz: 0.52)
        powderTints.addSublayer(micaMarbling)
        let lipParchmentMuao = CAGradientLayer()
        lipParchmentMuao.frame = powderTints.bounds
        lipParchmentMuao.colors = [UIColor.clear.cgColor, colorMuz(0xFFF5FB, coralBackMuz: 0.65), UIColor.clear.cgColor]
        lipParchmentMuao.locations = [0, 0.38, 1]
        lipParchmentMuao.startPoint = CGPoint(x: 0, y: 0); lipParchmentMuao.endPoint = CGPoint(x: 1, y: 1)
        lipParchmentMuao.opacity = 0
        powderTints.addSublayer(lipParchmentMuao)
        pigmentInlay.append(lipParchmentMuao)
    }

    private func rougeBrushwork() {
        bronzerBrushwork.bounds = CGRect(x: 0, y: 0, width: 67, height: 14)
        bronzerBrushwork.anchorPoint = CGPoint(x: 0, y: 0.5)
        bronzerBrushwork.position = CGPoint(x: 37, y: 57)
        bronzerBrushwork.zPosition = 14
        bronzerBrushwork.transform = CATransform3DMakeRotation(-0.98, 0, 0, 1)
        bronzerBrushwork.shadowColor = colorMuz(0x170A23); bronzerBrushwork.shadowOpacity = 0.35
        bronzerBrushwork.shadowRadius = 1.5; bronzerBrushwork.shadowOffset = CGSize(width: 0, height: 3)
        let saffronHandle = auroralGradientMuz(CGRect(x: 29, y: 3, width: 38, height: 8),
                              colorsMuz: [0xFFF1FA, 0xECA4D0, 0xA864A6, 0x693D80], auroralDiffusing: 4)
        saffronHandle.startPoint = CGPoint(x: 0.5, y: 0); saffronHandle.endPoint = CGPoint(x: 0.5, y: 1)
        bronzerBrushwork.addSublayer(saffronHandle)
        let handlePath = CALayer(); handlePath.frame = CGRect(x: 35, y: 4.2, width: 25, height: 0.6)
        handlePath.backgroundColor = colorMuz(0xFFF2FD, coralBackMuz: 0.7); handlePath.cornerRadius = 0.3
        bronzerBrushwork.addSublayer(handlePath)
        let cedarOrbitGleam = auroralGradientMuz(CGRect(x: 18, y: 1, width: 14, height: 12),
                               colorsMuz: [0xF8E1CF, 0xFFF4E4, 0xB78B88, 0x6F4E69], auroralDiffusing: 2)
        cedarOrbitGleam.startPoint = CGPoint(x: 0.5, y: 0); cedarOrbitGleam.endPoint = CGPoint(x: 0.5, y: 1)
        bronzerBrushwork.addSublayer(cedarOrbitGleam)
        for myrrhHelixGleam: CGFloat in [21, 29] {
            let rosewoodHaloMuz = CALayer(); rosewoodHaloMuz.frame = CGRect(x: myrrhHelixGleam, y: 2, width: 0.6, height: 10)
            rosewoodHaloMuz.backgroundColor = colorMuz(0x8B6375, coralBackMuz: 0.6); bronzerBrushwork.addSublayer(rosewoodHaloMuz)
        }
        let scintillaSilhouette = UIBezierPath()
        scintillaSilhouette.move(to: CGPoint(x: 20, y: 1))
        scintillaSilhouette.addCurve(to: CGPoint(x: 0, y: 7), controlPoint1: CGPoint(x: 10, y: -2), controlPoint2: CGPoint(x: 1, y: 0))
        scintillaSilhouette.addCurve(to: CGPoint(x: 20, y: 13), controlPoint1: CGPoint(x: 1, y: 14), controlPoint2: CGPoint(x: 10, y: 16))
        scintillaSilhouette.close()
        let sableBristles = auroralGradientMuz(CGRect(x: 0, y: 0, width: 21, height: 14), colorsMuz: [0xFAD2E4, 0xC995B2, 0x6B4A68])
        sableBristles.startPoint = CGPoint(x: 0, y: 0.3); sableBristles.endPoint = CGPoint(x: 1, y: 0.8)
        let balmTapestry = CAShapeLayer(); balmTapestry.path = scintillaSilhouette.cgPath; sableBristles.mask = balmTapestry
        bronzerBrushwork.addSublayer(sableBristles)
        let amberSuedeMuz = CAShapeLayer(); let heroMuz = UIBezierPath()
        for indexMuz in 0..<8 {
            let canvasKeyMuzoi = CGFloat(indexMuz) * 1.25 + 2.6
            heroMuz.move(to: CGPoint(x: 2.5 + abs(canvasKeyMuzoi - 7) * 0.5, y: canvasKeyMuzoi))
            heroMuz.addQuadCurve(to: CGPoint(x: 19, y: 3 + CGFloat(indexMuz)), controlPoint: CGPoint(x: 11, y: canvasKeyMuzoi - 1))
        }
        amberSuedeMuz.path = heroMuz.cgPath; amberSuedeMuz.fillColor = UIColor.clear.cgColor
        amberSuedeMuz.strokeColor = colorMuz(0xFFF0F8, coralBackMuz: 0.37); amberSuedeMuz.lineWidth = 0.38
        bronzerBrushwork.addSublayer(amberSuedeMuz)
        camelliaCompactMuz.addSublayer(bronzerBrushwork)
    }

    private func auroralGradientMuz(_ frameMuz: CGRect, colorsMuz: [UInt32], auroralDiffusing: CGFloat = 0) -> CAGradientLayer {
        let pearlFinishIssueMuzoi = CAGradientLayer(); pearlFinishIssueMuzoi.frame = frameMuz
        pearlFinishIssueMuzoi.colors = colorsMuz.map { colorMuz($0) }
        pearlFinishIssueMuzoi.startPoint = CGPoint(x: 0.1, y: 0); pearlFinishIssueMuzoi.endPoint = CGPoint(x: 0.85, y: 1)
        pearlFinishIssueMuzoi.cornerRadius = auroralDiffusing; pearlFinishIssueMuzoi.cornerCurve = .continuous
        return pearlFinishIssueMuzoi
    }

    private func colorMuz(_ intValue: UInt32, coralBackMuz: CGFloat = 1) -> CGColor {
        UIColor(red: CGFloat((intValue >> 16) & 255) / 255, green: CGFloat((intValue >> 8) & 255) / 255,
                blue: CGFloat(intValue & 255) / 255, alpha: coralBackMuz).cgColor
    }

    func micaStippling(_ accepted: Bool) { softenedMotionMuzoi = accepted; opalineMotionMuz() }
    override func didMoveToWindow() { super.didMoveToWindow(); opalineMotionMuz() }
    @objc private func readingSizeChanged() { opalineMotionMuz() }

    private func opalineMotionMuz() {
        let accepted = softenedMotionMuzoi && window != nil && !UIAccessibility.isReduceMotionEnabled
        guard accepted != ceruleanLayering else { return }
        if accepted {
            if !peonyOrbitAura { advanceSparkleMotionMuzoi(); peonyOrbitAura = true }
            let savedMuz = layer.timeOffset
            layer.speed = 1; layer.timeOffset = 0; layer.beginTime = 0
            if savedMuz > 0 { layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - savedMuz }
        } else {
            let savedMuz = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0; layer.timeOffset = savedMuz
        }
        ceruleanLayering = accepted
    }

    private func advanceSparkleMotionMuzoi() {
        let dewyHalo = 3.6
        let accentPoints: [CGPoint] = [CGPoint(x: 37, y: 54), CGPoint(x: 37, y: 58), CGPoint(x: 37, y: 52),
                                 CGPoint(x: 79, y: 54), CGPoint(x: 79, y: 58), CGPoint(x: 79, y: 52),
                                 CGPoint(x: 79, y: 80), CGPoint(x: 79, y: 84), CGPoint(x: 79, y: 78),
                                 CGPoint(x: 37, y: 80), CGPoint(x: 37, y: 84), CGPoint(x: 37, y: 78), CGPoint(x: 37, y: 54)]
        let horizontalMuz = CAKeyframeAnimation(keyPath: "position")
        horizontalMuz.values = accentPoints.map { NSValue(cgPoint: $0) }
        horizontalMuz.keyTimes = [0, 0.07, 0.14, 0.25, 0.32, 0.39, 0.50, 0.57, 0.64, 0.75, 0.82, 0.89, 1]
        horizontalMuz.calculationMode = .cubic
        horizontalMuz.timingFunctions = Array(repeating: CAMediaTimingFunction(name: .easeInEaseOut), count: accentPoints.count - 1)
        horizontalMuz.duration = dewyHalo; horizontalMuz.repeatCount = .infinity
        bronzerBrushwork.add(horizontalMuz, forKey: "muzoi.pigmentPickup")
        for (indexMuz, lipParchmentMuao) in pigmentInlay.enumerated() {
            let orchidPlumeMuao: Double = [0.07, 0.32, 0.82, 0.57][indexMuz]
            let choice = CAKeyframeAnimation(keyPath: "opacity")
            choice.values = [0, 0, 0.85, 0, 0]
            choice.keyTimes = [0, NSNumber(value: orchidPlumeMuao - 0.05), NSNumber(value: orchidPlumeMuao), NSNumber(value: orchidPlumeMuao + 0.14), 1]
            choice.duration = dewyHalo; choice.repeatCount = .infinity
            lipParchmentMuao.add(choice, forKey: "muzoi.powderLustre")
        }
        let juniperSheen = CAKeyframeAnimation(keyPath: "transform.translation.x")
        juniperSheen.values = [-90, -90, 90, 90]; juniperSheen.keyTimes = [0, 0.12, 0.78, 1]
        juniperSheen.duration = dewyHalo; juniperSheen.repeatCount = .infinity
        juniperSheen.timingFunctions = Array(repeating: CAMediaTimingFunction(name: .easeInEaseOut), count: 3)
        camelliaSheenMuao.add(juniperSheen, forKey: "muzoi.mirrorReflection")
        let bristlePath = CABasicAnimation(keyPath: "transform.scale")
        bristlePath.fromValue = 0.99; bristlePath.toValue = 1.015
        bristlePath.duration = dewyHalo / 2; bristlePath.autoreverses = true; bristlePath.repeatCount = .infinity
        bristlePath.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        camelliaCompactMuz.add(bristlePath, forKey: "muzoi.compactBreath")
        let info = CABasicAnimation(keyPath: "transform.translation.y")
        info.fromValue = 0.5; info.toValue = -1.6
        info.duration = dewyHalo / 2; info.autoreverses = true; info.repeatCount = .infinity
        info.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        camelliaCompactMuz.add(info, forKey: "muzoi.compactFloat")
    }
}
