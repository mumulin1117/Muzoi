import UIKit

final class MuzoiGlamFacebookBridgeIndicator {
    static let shared = MuzoiGlamFacebookBridgeIndicator()

    private var overlayWindow: UIWindow?

    static func show(info: String) {
        shared.present(message: info, icon: nil, isLoading: true)
    }

    static func showInfo(_ message: String) {
        shared.present(message: message, icon: UIImage(systemName: "info.circle"), isLoading: false)
    }

    static func showSuccess(_ message: String) {
        shared.present(message: message, icon: UIImage(systemName: "checkmark.circle.fill"), isLoading: false)
    }

    static func dismiss() {
        shared.dismiss()
    }

    private func present(message: String, icon: UIImage?, isLoading: Bool) {
        DispatchQueue.main.async {
            self.dismiss()

            let window: UIWindow
            if let scene = Self.activeWindowScene() {
                window = UIWindow(windowScene: scene)
                window.frame = scene.coordinateSpace.bounds
            } else {
                window = UIWindow(frame: UIScreen.main.bounds)
            }

            window.windowLevel = .alert + 1
            window.backgroundColor = .clear
            window.rootViewController = UIViewController()

            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            container.layer.cornerRadius = 14

            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 12

            let spinner = UIActivityIndicatorView(style: .large)
            spinner.color = .white

            if isLoading {
                spinner.startAnimating()
                stack.addArrangedSubview(spinner)
            } else if let icon {
                let imageView = UIImageView(image: icon)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.tintColor = .white
                imageView.contentMode = .scaleAspectFit
                imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
                stack.addArrangedSubview(imageView)
            }

            let label = UILabel()
            label.text = message
            label.textColor = .white
            label.font = .systemFont(ofSize: 15, weight: .medium)
            label.numberOfLines = 2
            label.textAlignment = .center
            stack.addArrangedSubview(label)

            let rootView = window.rootViewController?.view ?? window
            rootView.backgroundColor = .clear
            container.addSubview(stack)
            rootView.addSubview(container)

            NSLayoutConstraint.activate([
                container.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
                container.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
                container.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
                stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
                stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)
            ])

            container.alpha = 0
            container.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            window.isHidden = false
            self.overlayWindow = window

            UIView.animate(
                withDuration: 0.25,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: .curveEaseOut
            ) {
                container.alpha = 1
                container.transform = .identity
            }

            if !isLoading {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.dismiss()
                }
            }
        }
    }

    private func dismiss() {
        overlayWindow?.isHidden = true
        overlayWindow = nil
    }

    private static func activeWindowScene() -> UIWindowScene? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first { $0.activationState == .foregroundActive }
        }
        return nil
    }
}
