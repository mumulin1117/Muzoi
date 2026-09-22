import UIKit

protocol LuminousCadenceMuzDetailHero: AnyObject {
    var luminousHeroArtworkMuz: UIImageView? { get }
}

final class LuminousCadenceMuzDetailTransition: NSObject, UINavigationControllerDelegate {
    private weak var sourceArtworkMuz: UIImageView?
    private weak var detailControllerMuz: UIViewController?
    private weak var navigationControllerMuz: UINavigationController?
    private weak var previousDelegateMuz: UINavigationControllerDelegate?
    private let sourceFrameMuz: CGRect

    init(sourceArtworkMuz: UIImageView, detailControllerMuz: UIViewController) {
        self.sourceArtworkMuz = sourceArtworkMuz
        self.detailControllerMuz = detailControllerMuz
        sourceFrameMuz = sourceArtworkMuz.convert(sourceArtworkMuz.bounds, to: sourceArtworkMuz.window)
        super.init()
    }

    func luminousAttachMuz(to navigationControllerMuz: UINavigationController) {
        self.navigationControllerMuz = navigationControllerMuz
        previousDelegateMuz = navigationControllerMuz.delegate
        navigationControllerMuz.delegate = self
        LuminousCadenceMuzDetailTransitionStore.shared.retainMuz(self, for: navigationControllerMuz)
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentingMuz = operation == .push && toVC === detailControllerMuz
        let dismissingMuz = operation == .pop && fromVC === detailControllerMuz
        guard presentingMuz || dismissingMuz else {
            return previousDelegateMuz?.navigationController?(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
        }
        return LuminousCadenceMuzDetailAnimator(sourceArtworkMuz: sourceArtworkMuz, sourceFrameMuz: sourceFrameMuz,
                                                detailControllerMuz: detailControllerMuz, presentingMuz: presentingMuz)
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        previousDelegateMuz?.navigationController?(navigationController, didShow: viewController, animated: animated)
        guard let detailControllerMuz, !navigationController.viewControllers.contains(where: { $0 === detailControllerMuz }) else { return }
        if navigationController.delegate === self { navigationController.delegate = previousDelegateMuz }
        LuminousCadenceMuzDetailTransitionStore.shared.releaseMuz(for: navigationController)
    }
}

private final class LuminousCadenceMuzDetailTransitionStore {
    static let shared = LuminousCadenceMuzDetailTransitionStore()
    private var transitionsMuz: [ObjectIdentifier: LuminousCadenceMuzDetailTransition] = [:]
    func retainMuz(_ transitionMuz: LuminousCadenceMuzDetailTransition, for navigationControllerMuz: UINavigationController) { transitionsMuz[ObjectIdentifier(navigationControllerMuz)] = transitionMuz }
    func releaseMuz(for navigationControllerMuz: UINavigationController) { transitionsMuz.removeValue(forKey: ObjectIdentifier(navigationControllerMuz)) }
}

private final class LuminousCadenceMuzDetailAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private weak var sourceArtworkMuz: UIImageView?
    private weak var detailControllerMuz: UIViewController?
    private let sourceFrameMuz: CGRect
    private let presentingMuz: Bool

    init(sourceArtworkMuz: UIImageView?, sourceFrameMuz: CGRect, detailControllerMuz: UIViewController?, presentingMuz: Bool) {
        self.sourceArtworkMuz = sourceArtworkMuz; self.sourceFrameMuz = sourceFrameMuz
        self.detailControllerMuz = detailControllerMuz; self.presentingMuz = presentingMuz
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { UIAccessibility.isReduceMotionEnabled ? 0.18 : 0.4 }

    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let fromViewMuz = context.view(forKey: .from), let toViewMuz = context.view(forKey: .to),
              let toControllerMuz = context.viewController(forKey: .to) else { context.completeTransition(false); return }
        let containerMuz = context.containerView
        toViewMuz.frame = context.finalFrame(for: toControllerMuz)
        if presentingMuz { containerMuz.addSubview(toViewMuz) } else { containerMuz.insertSubview(toViewMuz, belowSubview: fromViewMuz) }
        toViewMuz.layoutIfNeeded(); fromViewMuz.layoutIfNeeded()

        let heroMuz = (detailControllerMuz as? LuminousCadenceMuzDetailHero)?.luminousHeroArtworkMuz
        let visibleSourceMuz = sourceArtworkMuz?.window != nil ? sourceArtworkMuz : nil
        let artworkMuz = visibleSourceMuz?.image ?? heroMuz?.image
        let sourceRectMuz = presentingMuz ? containerMuz.convert(sourceFrameMuz, from: sourceArtworkMuz?.window) : (visibleSourceMuz?.convert(visibleSourceMuz?.bounds ?? .zero, to: containerMuz) ?? containerMuz.convert(sourceFrameMuz, from: sourceArtworkMuz?.window))
        let heroRectMuz = heroMuz?.convert(heroMuz?.bounds ?? .zero, to: containerMuz) ?? sourceRectMuz
        let startRectMuz = presentingMuz ? sourceRectMuz : heroRectMuz
        let endRectMuz = presentingMuz ? heroRectMuz : sourceRectMuz
        guard let artworkMuz, startRectMuz.width > 1, endRectMuz.width > 1 else {
            toViewMuz.alpha = 0
            UIView.animate(withDuration: transitionDuration(using: context), animations: { fromViewMuz.alpha = 0; toViewMuz.alpha = 1 }) { _ in
                fromViewMuz.alpha = 1; context.completeTransition(!context.transitionWasCancelled)
            }
            return
        }

        let movingArtworkMuz = UIImageView(image: artworkMuz)
        movingArtworkMuz.contentMode = .scaleAspectFill; movingArtworkMuz.clipsToBounds = true; movingArtworkMuz.frame = startRectMuz
        movingArtworkMuz.layer.cornerRadius = presentingMuz ? visibleSourceMuz?.layer.cornerRadius ?? 18 : heroMuz?.layer.cornerRadius ?? 0
        containerMuz.addSubview(movingArtworkMuz)
        let sourceWasHiddenMuz = visibleSourceMuz?.isHidden ?? false, heroWasHiddenMuz = heroMuz?.isHidden ?? false
        visibleSourceMuz?.isHidden = true; heroMuz?.isHidden = true
        toViewMuz.alpha = presentingMuz ? 0 : 1
        fromViewMuz.alpha = 1
        UIView.animate(withDuration: transitionDuration(using: context), delay: 0, options: [.curveEaseInOut, .allowUserInteraction]) {
            movingArtworkMuz.frame = endRectMuz
            movingArtworkMuz.layer.cornerRadius = self.presentingMuz ? heroMuz?.layer.cornerRadius ?? 0 : visibleSourceMuz?.layer.cornerRadius ?? 18
            toViewMuz.alpha = 1; fromViewMuz.alpha = self.presentingMuz ? 0.72 : 0
        } completion: { _ in
            visibleSourceMuz?.isHidden = sourceWasHiddenMuz; heroMuz?.isHidden = heroWasHiddenMuz
            movingArtworkMuz.removeFromSuperview(); fromViewMuz.alpha = 1; toViewMuz.alpha = 1
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
}

final class LuminousCadenceMuzCompactTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    static let shared = LuminousCadenceMuzCompactTransition()
    private var presentingMuz = true
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? { presentingMuz = true; return self }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? { presentingMuz = false; return self }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { UIAccessibility.isReduceMotionEnabled ? 0.15 : 0.32 }
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let appearingMuz = context.view(forKey: presentingMuz ? .to : .from) else { context.completeTransition(false); return }
        if presentingMuz { context.containerView.addSubview(appearingMuz); appearingMuz.alpha = 0; appearingMuz.transform = CGAffineTransform(scaleX: 0.88, y: 0.18).translatedBy(x: 0, y: 110) }
        UIView.animate(withDuration: transitionDuration(using: context), delay: 0, usingSpringWithDamping: 0.86, initialSpringVelocity: 0.2, options: [.curveEaseOut, .allowUserInteraction]) {
            appearingMuz.alpha = self.presentingMuz ? 1 : 0
            appearingMuz.transform = self.presentingMuz ? .identity : CGAffineTransform(scaleX: 0.9, y: 0.22).translatedBy(x: 0, y: 100)
        } completion: { _ in
            appearingMuz.transform = .identity
            if !self.presentingMuz && !context.transitionWasCancelled { appearingMuz.removeFromSuperview() }
            context.completeTransition(!context.transitionWasCancelled)
        }
    }
}

extension UIView {
    func luminousPetalHaloMuz() {
        guard window != nil, !UIAccessibility.isReduceMotionEnabled else { return }
        let haloMuz = UIView(frame: bounds.insetBy(dx: -18, dy: -18)); haloMuz.isUserInteractionEnabled = false
        addSubview(haloMuz)
        let colorsMuz = [UIColor(red: 1, green: 0.42, blue: 0.72, alpha: 0.9), UIColor(red: 0.9, green: 0.55, blue: 1, alpha: 0.8), UIColor.white.withAlphaComponent(0.85)]
        for indexMuz in 0..<9 {
            let petalMuz = UIView(frame: CGRect(x: haloMuz.bounds.midX - 3, y: haloMuz.bounds.midY - 5, width: 6, height: 10))
            petalMuz.backgroundColor = colorsMuz[indexMuz % colorsMuz.count]; petalMuz.layer.cornerRadius = 3
            haloMuz.addSubview(petalMuz)
            let angleMuz = CGFloat(indexMuz) * (.pi * 2 / 9)
            UIView.animate(withDuration: 0.38, delay: Double(indexMuz) * 0.012, options: [.curveEaseOut]) {
                petalMuz.transform = CGAffineTransform(translationX: cos(angleMuz) * 31, y: sin(angleMuz) * 31).rotated(by: angleMuz)
                petalMuz.alpha = 0
            }
        }
        UIView.animate(withDuration: 0.42, animations: { haloMuz.alpha = 0 }) { _ in haloMuz.removeFromSuperview() }
    }
}

extension UIViewController {
    func luminousCardArtworkMuz() -> UIImageView? {
        let selectedContainerMuz: UIView? = (view.subviewsRecursiveMuz().compactMap { $0 as? UICollectionView }.first { !($0.indexPathsForSelectedItems ?? []).isEmpty }).flatMap { collectionMuz in
            collectionMuz.indexPathsForSelectedItems?.first.flatMap(collectionMuz.cellForItem(at:))
        } ?? (view.subviewsRecursiveMuz().compactMap { $0 as? UITableView }.first { $0.indexPathForSelectedRow != nil }).flatMap { tableMuz in
            tableMuz.indexPathForSelectedRow.flatMap(tableMuz.cellForRow(at:))
        }
        guard let searchRootMuz: UIView = selectedContainerMuz ?? view else { return nil }
        let centerMuz = view.convert(CGPoint(x: view.bounds.midX, y: view.bounds.midY), to: view.window)
        return searchRootMuz.subviewsRecursiveMuz().compactMap { $0 as? GlamAtelierMuzRemoteArtwork }.filter { artworkMuz in
            guard artworkMuz.image != nil, !artworkMuz.isHidden, artworkMuz.alpha > 0.1, artworkMuz.window != nil else { return false }
            return artworkMuz.convert(artworkMuz.bounds, to: view.window).intersects(view.window?.bounds ?? .zero)
        }.max { leftMuz, rightMuz in
            func scoreMuz(_ artworkMuz: UIImageView) -> CGFloat { let frameMuz = artworkMuz.convert(artworkMuz.bounds, to: view.window); return frameMuz.width * frameMuz.height - hypot(frameMuz.midX - centerMuz.x, frameMuz.midY - centerMuz.y) * 120 }
            return scoreMuz(leftMuz) < scoreMuz(rightMuz)
        }
    }
}

private extension UIView {
    func subviewsRecursiveMuz() -> [UIView] { subviews + subviews.flatMap { $0.subviewsRecursiveMuz() } }
}
