import UIKit

/// A miniature makeup compact: the brush picks up four pigments in a continuous loop.
@MainActor
final class MuzoiGlamPaletteIndicator: UIView {
    private let aura = CAGradientLayer()
    private let shadow = CALayer()
    private let stage = CATransformLayer()
    private let compact = CATransformLayer()
    private let brush = CALayer()
    private let mirrorSheen = CAGradientLayer()
    private var pigmentLights: [CAGradientLayer] = []
    private var wantsMotion = false
    private var running = false
    private var configured = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        accessibilityElementsHidden = true
        aura.type = .radial
        aura.colors = [color(0xE991CE, alpha: 0.17), color(0x9654C9, alpha: 0.04), UIColor.clear.cgColor]
        aura.locations = [0, 0.52, 1]
        aura.startPoint = CGPoint(x: 0.5, y: 0.55); aura.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(aura)
        shadow.backgroundColor = color(0x09050F, alpha: 0.55)
        shadow.shadowColor = color(0x09050F); shadow.shadowOpacity = 0.5; shadow.shadowRadius = 5
        layer.addSublayer(shadow)
        stage.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
        layer.addSublayer(stage)
        compact.bounds = stage.bounds; compact.position = CGPoint(x: 60, y: 60)
        compact.transform = CATransform3DRotate(CATransform3DMakeRotation(-0.10, 0, 0, 1), 0.18, 1, 0, 0)
        stage.addSublayer(compact)
        makeMirror()
        makeCompact()
        makeBrush()
        NotificationCenter.default.addObserver(self, selector: #selector(motionPreferenceChanged),
                                               name: UIAccessibility.reduceMotionStatusDidChangeNotification, object: nil)
    }

    required init?(coder: NSCoder) { nil }
    override var intrinsicContentSize: CGSize { CGSize(width: 112, height: 112) }

    override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin(); CATransaction.setDisableActions(true)
        aura.frame = bounds.insetBy(dx: -bounds.width * 0.08, dy: -bounds.height * 0.08)
        shadow.frame = CGRect(x: bounds.width * 0.19, y: bounds.height * 0.92,
                              width: bounds.width * 0.66, height: bounds.height * 0.045)
        shadow.cornerRadius = shadow.bounds.height / 2
        shadow.shadowPath = UIBezierPath(ovalIn: shadow.bounds).cgPath
        stage.position = CGPoint(x: bounds.midX, y: bounds.midY - bounds.height * 0.01)
        var perspective = CATransform3DIdentity; perspective.m34 = -1 / 420
        let scale = min(bounds.width, bounds.height) / 120
        stage.transform = CATransform3DScale(perspective, scale, scale, scale)
        CATransaction.commit()
    }

    private func makeMirror() {
        let lid = CALayer()
        lid.frame = CGRect(x: 13, y: 9, width: 94, height: 37)
        lid.zPosition = -2
        lid.shadowColor = color(0x09050F); lid.shadowOpacity = 0.35
        lid.shadowRadius = 3; lid.shadowOffset = CGSize(width: 0, height: 2)
        let rim = gradient(lid.bounds, colors: [0xF7D9DD, 0x775466, 0xC195BB, 0x34213E], radius: 11)
        rim.borderColor = color(0xE7B1DB, alpha: 0.38); rim.borderWidth = 0.6
        lid.addSublayer(rim)
        let mirror = gradient(lid.bounds.insetBy(dx: 3, dy: 3),
                              colors: [0xF3DDEB, 0x9E8CA9, 0xDBD5E4, 0x64566E], radius: 8)
        mirror.masksToBounds = true
        lid.addSublayer(mirror)
        let reflection = CAShapeLayer()
        let reflectedLight = UIBezierPath()
        reflectedLight.move(to: CGPoint(x: 4, y: 1)); reflectedLight.addLine(to: CGPoint(x: 28, y: 1))
        reflectedLight.addLine(to: CGPoint(x: 65, y: 31)); reflectedLight.addLine(to: CGPoint(x: 45, y: 31)); reflectedLight.close()
        reflection.path = reflectedLight.cgPath; reflection.fillColor = color(0xFFF7FE, alpha: 0.19)
        mirror.addSublayer(reflection)
        // A small engraved M ties the compact to Muzoi without adding product copy.
        let monogram = CAShapeLayer()
        let mark = UIBezierPath()
        mark.move(to: CGPoint(x: 35, y: 22)); mark.addLine(to: CGPoint(x: 39, y: 10))
        mark.addLine(to: CGPoint(x: 44, y: 19)); mark.addLine(to: CGPoint(x: 50, y: 10))
        mark.addLine(to: CGPoint(x: 53, y: 22))
        monogram.path = mark.cgPath; monogram.fillColor = UIColor.clear.cgColor
        monogram.strokeColor = color(0x73556E, alpha: 0.64); monogram.lineWidth = 1.2
        monogram.lineCap = .round; monogram.lineJoin = .round
        mirror.addSublayer(monogram)
        mirrorSheen.frame = mirror.bounds
        mirrorSheen.colors = [UIColor.clear.cgColor, color(0xFFFFFF, alpha: 0.65), UIColor.clear.cgColor]
        mirrorSheen.locations = [0.25, 0.5, 0.75]
        mirrorSheen.startPoint = CGPoint(x: 0, y: 0.2); mirrorSheen.endPoint = CGPoint(x: 1, y: 0.8)
        mirrorSheen.opacity = 0.45
        mirror.addSublayer(mirrorSheen)
        compact.addSublayer(lid)
    }

    private func makeCompact() {
        let depth = gradient(CGRect(x: 13, y: 47, width: 94, height: 63),
                             colors: [0x8D5A84, 0x2A1538, 0x140D21], radius: 12)
        depth.shadowColor = color(0x09050F); depth.shadowOpacity = 0.45
        depth.shadowRadius = 4; depth.shadowOffset = CGSize(width: 0, height: 3)
        compact.addSublayer(depth)
        let rim = gradient(CGRect(x: 13, y: 42, width: 94, height: 62),
                           colors: [0xF5CDDC, 0x9B649A, 0x432647, 0xE3B0D8], radius: 12)
        rim.borderWidth = 0.6; rim.borderColor = color(0xFFE5F2, alpha: 0.6)
        compact.addSublayer(rim)
        let tray = gradient(rim.bounds.insetBy(dx: 2, dy: 2), colors: [0x3F2A48, 0x23182E, 0x34223D], radius: 10)
        rim.addSublayer(tray)
        for x: CGFloat in [33, 76] {
            let hinge = gradient(CGRect(x: x, y: 40, width: 11, height: 4), colors: [0xE7C7D1, 0x795767], radius: 2)
            compact.addSublayer(hinge)
        }
        let pigments: [(CGPoint, [UInt32])] = [
            (CGPoint(x: 9, y: 7), [0xFFE7CE, 0xE7BC9C, 0xAF7C6F]),
            (CGPoint(x: 51, y: 7), [0xFFC5E1, 0xE28EBE, 0xAC558F]),
            (CGPoint(x: 9, y: 33), [0xE2CEFF, 0xAF87DE, 0x71529F]),
            (CGPoint(x: 51, y: 33), [0xF398DC, 0xC954B5, 0x813B8B])
        ]
        for (index, pigment) in pigments.enumerated() { makePigment(in: rim, at: pigment.0, colors: pigment.1, index: index) }
        let clasp = gradient(CGRect(x: 53, y: 103, width: 14, height: 4), colors: [0xF5D7DF, 0x8D6280], radius: 2)
        compact.addSublayer(clasp)
    }

    private func makePigment(in tray: CALayer, at origin: CGPoint, colors: [UInt32], index: Int) {
        let well = gradient(CGRect(origin: origin, size: CGSize(width: 34, height: 23)),
                            colors: [0x150E20, 0x65445F, 0xE8C1DA], radius: 6)
        tray.addSublayer(well)
        let powder = gradient(well.bounds.insetBy(dx: 1.8, dy: 1.8), colors: colors, radius: 4.8)
        powder.masksToBounds = true
        well.addSublayer(powder)
        let pressing = CAShapeLayer()
        let ridges = UIBezierPath()
        for inset: CGFloat in [3, 6, 9] {
            let rect = powder.bounds.insetBy(dx: inset, dy: inset * 0.5)
            ridges.append(UIBezierPath(roundedRect: rect, cornerRadius: 3))
        }
        pressing.path = ridges.cgPath; pressing.fillColor = UIColor.clear.cgColor
        pressing.strokeColor = color(0xFFF2FC, alpha: 0.15); pressing.lineWidth = 0.45
        powder.addSublayer(pressing)
        let mica = CAShapeLayer()
        let grains = UIBezierPath()
        for grain in 0..<23 {
            let x = 2 + CGFloat((grain * 17 + index * 7) % 89) / 89 * (powder.bounds.width - 4)
            let y = 2 + CGFloat((grain * 31 + index * 11) % 67) / 67 * (powder.bounds.height - 4)
            let size: CGFloat = grain % 4 == 0 ? 0.65 : 0.35
            grains.append(UIBezierPath(ovalIn: CGRect(x: x, y: y, width: size, height: size)))
        }
        mica.path = grains.cgPath; mica.fillColor = color(0xFFF6FF, alpha: 0.52)
        powder.addSublayer(mica)
        let light = CAGradientLayer()
        light.frame = powder.bounds
        light.colors = [UIColor.clear.cgColor, color(0xFFF5FB, alpha: 0.65), UIColor.clear.cgColor]
        light.locations = [0, 0.38, 1]
        light.startPoint = CGPoint(x: 0, y: 0); light.endPoint = CGPoint(x: 1, y: 1)
        light.opacity = 0
        powder.addSublayer(light)
        pigmentLights.append(light)
    }

    private func makeBrush() {
        brush.bounds = CGRect(x: 0, y: 0, width: 67, height: 14)
        brush.anchorPoint = CGPoint(x: 0, y: 0.5)
        brush.position = CGPoint(x: 37, y: 57)
        brush.zPosition = 14
        brush.transform = CATransform3DMakeRotation(-0.98, 0, 0, 1)
        brush.shadowColor = color(0x170A23); brush.shadowOpacity = 0.35
        brush.shadowRadius = 1.5; brush.shadowOffset = CGSize(width: 0, height: 3)
        let handle = gradient(CGRect(x: 29, y: 3, width: 38, height: 8),
                              colors: [0xFFF1FA, 0xECA4D0, 0xA864A6, 0x693D80], radius: 4)
        handle.startPoint = CGPoint(x: 0.5, y: 0); handle.endPoint = CGPoint(x: 0.5, y: 1)
        brush.addSublayer(handle)
        let handleLight = CALayer(); handleLight.frame = CGRect(x: 35, y: 4.2, width: 25, height: 0.6)
        handleLight.backgroundColor = color(0xFFF2FD, alpha: 0.7); handleLight.cornerRadius = 0.3
        brush.addSublayer(handleLight)
        let ferrule = gradient(CGRect(x: 18, y: 1, width: 14, height: 12),
                               colors: [0xF8E1CF, 0xFFF4E4, 0xB78B88, 0x6F4E69], radius: 2)
        ferrule.startPoint = CGPoint(x: 0.5, y: 0); ferrule.endPoint = CGPoint(x: 0.5, y: 1)
        brush.addSublayer(ferrule)
        for x: CGFloat in [21, 29] {
            let seam = CALayer(); seam.frame = CGRect(x: x, y: 2, width: 0.6, height: 10)
            seam.backgroundColor = color(0x8B6375, alpha: 0.6); brush.addSublayer(seam)
        }
        let silhouette = UIBezierPath()
        silhouette.move(to: CGPoint(x: 20, y: 1))
        silhouette.addCurve(to: CGPoint(x: 0, y: 7), controlPoint1: CGPoint(x: 10, y: -2), controlPoint2: CGPoint(x: 1, y: 0))
        silhouette.addCurve(to: CGPoint(x: 20, y: 13), controlPoint1: CGPoint(x: 1, y: 14), controlPoint2: CGPoint(x: 10, y: 16))
        silhouette.close()
        let bristles = gradient(CGRect(x: 0, y: 0, width: 21, height: 14), colors: [0xFAD2E4, 0xC995B2, 0x6B4A68])
        bristles.startPoint = CGPoint(x: 0, y: 0.3); bristles.endPoint = CGPoint(x: 1, y: 0.8)
        let mask = CAShapeLayer(); mask.path = silhouette.cgPath; bristles.mask = mask
        brush.addSublayer(bristles)
        let fibers = CAShapeLayer(); let strokes = UIBezierPath()
        for index in 0..<8 {
            let y = CGFloat(index) * 1.25 + 2.6
            strokes.move(to: CGPoint(x: 2.5 + abs(y - 7) * 0.5, y: y))
            strokes.addQuadCurve(to: CGPoint(x: 19, y: 3 + CGFloat(index)), controlPoint: CGPoint(x: 11, y: y - 1))
        }
        fibers.path = strokes.cgPath; fibers.fillColor = UIColor.clear.cgColor
        fibers.strokeColor = color(0xFFF0F8, alpha: 0.37); fibers.lineWidth = 0.38
        brush.addSublayer(fibers)
        compact.addSublayer(brush)
    }

    private func gradient(_ frame: CGRect, colors: [UInt32], radius: CGFloat = 0) -> CAGradientLayer {
        let finish = CAGradientLayer(); finish.frame = frame
        finish.colors = colors.map { color($0) }
        finish.startPoint = CGPoint(x: 0.1, y: 0); finish.endPoint = CGPoint(x: 0.85, y: 1)
        finish.cornerRadius = radius; finish.cornerCurve = .continuous
        return finish
    }

    private func color(_ value: UInt32, alpha: CGFloat = 1) -> CGColor {
        UIColor(red: CGFloat((value >> 16) & 255) / 255, green: CGFloat((value >> 8) & 255) / 255,
                blue: CGFloat(value & 255) / 255, alpha: alpha).cgColor
    }

    func setAnimating(_ active: Bool) { wantsMotion = active; updateMotion() }
    override func didMoveToWindow() { super.didMoveToWindow(); updateMotion() }
    @objc private func motionPreferenceChanged() { updateMotion() }

    private func updateMotion() {
        let active = wantsMotion && window != nil && !UIAccessibility.isReduceMotionEnabled
        guard active != running else { return }
        if active {
            if !configured { addMotion(); configured = true }
            let paused = layer.timeOffset
            layer.speed = 1; layer.timeOffset = 0; layer.beginTime = 0
            if paused > 0 { layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - paused }
        } else {
            let paused = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0; layer.timeOffset = paused
        }
        running = active
    }

    private func addMotion() {
        let duration = 3.6
        let points: [CGPoint] = [CGPoint(x: 37, y: 54), CGPoint(x: 37, y: 58), CGPoint(x: 37, y: 52),
                                 CGPoint(x: 79, y: 54), CGPoint(x: 79, y: 58), CGPoint(x: 79, y: 52),
                                 CGPoint(x: 79, y: 80), CGPoint(x: 79, y: 84), CGPoint(x: 79, y: 78),
                                 CGPoint(x: 37, y: 80), CGPoint(x: 37, y: 84), CGPoint(x: 37, y: 78), CGPoint(x: 37, y: 54)]
        let tap = CAKeyframeAnimation(keyPath: "position")
        tap.values = points.map { NSValue(cgPoint: $0) }
        tap.keyTimes = [0, 0.07, 0.14, 0.25, 0.32, 0.39, 0.50, 0.57, 0.64, 0.75, 0.82, 0.89, 1]
        tap.calculationMode = .cubic
        tap.timingFunctions = Array(repeating: CAMediaTimingFunction(name: .easeInEaseOut), count: points.count - 1)
        tap.duration = duration; tap.repeatCount = .infinity
        brush.add(tap, forKey: "muzoi.pigmentPickup")
        for (index, light) in pigmentLights.enumerated() {
            let peak: Double = [0.07, 0.32, 0.82, 0.57][index]
            let pickup = CAKeyframeAnimation(keyPath: "opacity")
            pickup.values = [0, 0, 0.85, 0, 0]
            pickup.keyTimes = [0, NSNumber(value: peak - 0.05), NSNumber(value: peak), NSNumber(value: peak + 0.14), 1]
            pickup.duration = duration; pickup.repeatCount = .infinity
            light.add(pickup, forKey: "muzoi.powderLustre")
        }
        let sheen = CAKeyframeAnimation(keyPath: "transform.translation.x")
        sheen.values = [-90, -90, 90, 90]; sheen.keyTimes = [0, 0.12, 0.78, 1]
        sheen.duration = duration; sheen.repeatCount = .infinity
        sheen.timingFunctions = Array(repeating: CAMediaTimingFunction(name: .easeInEaseOut), count: 3)
        mirrorSheen.add(sheen, forKey: "muzoi.mirrorReflection")
        let breathe = CABasicAnimation(keyPath: "transform.scale")
        breathe.fromValue = 0.99; breathe.toValue = 1.015
        breathe.duration = duration / 2; breathe.autoreverses = true; breathe.repeatCount = .infinity
        breathe.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        compact.add(breathe, forKey: "muzoi.compactBreath")
        let float = CABasicAnimation(keyPath: "transform.translation.y")
        float.fromValue = 0.5; float.toValue = -1.6
        float.duration = duration / 2; float.autoreverses = true; float.repeatCount = .infinity
        float.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        compact.add(float, forKey: "muzoi.compactFloat")
    }
}
