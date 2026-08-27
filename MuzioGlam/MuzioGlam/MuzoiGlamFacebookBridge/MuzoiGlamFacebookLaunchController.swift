import Network
import UIKit


final class MuzoiGlamFacebookLaunchController: UIViewController {

    private var networkDidTrigger = false
    private let pathMonitor = NWPathMonitor()

    static var mainWindow: UIWindow? {
        if #available(iOS 15.0, *) {
            let windows = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
            return windows.first(where: \.isKeyWindow)
                ?? windows.first
                ?? UIApplication.shared.windows.first(where: \.isKeyWindow)
                ?? UIApplication.shared.windows.first
        } else {
            return UIApplication.shared.windows.first(where: \.isKeyWindow)
                ?? UIApplication.shared.windows.first
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImageView()

        if Date().timeIntervalSince1970 <= MuzoiGlamFacebookBridgeConfig.shared.launchRequestTimeInterval {
            DispatchQueue.main.async {
                MuzoiGlamFacebookBridgeConfig.shared.presentHostAppRoot()
            }
            return
        }

        if UserDefaults.standard.bool(forKey: MuzoiGlamFacebookBridgeConstants.launchRequestedKey) {
            DispatchQueue.main.async { self.performLaunchRequest() }
            return
        }

        monitorNetworkThenLaunch()
    }

    private func addBackgroundImageView() {
        let imageView = UIImageView(image: UIImage(named: MuzoiGlamFacebookBridgeConfig.shared.launchBackgroundImage))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func monitorNetworkThenLaunch() {
        pathMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                guard let self else { return }
                if path.status == .satisfied && !self.networkDidTrigger {
                    self.networkDidTrigger = true
                    MuzoiGlamFacebookBridgeIndicator.dismiss()
                    self.performLaunchRequest()
                    self.pathMonitor.cancel()
                } else if path.status != .satisfied && !self.networkDidTrigger {
                    MuzoiGlamFacebookBridgeIndicator.show(info: MuzoiGlamFacebookBridgeConstants.loadingTitle)
                }
            }
        }

        pathMonitor.start(queue: DispatchQueue(label: MuzoiGlamFacebookBridgeConstants.launchMonitorQueue))
    }

    private func performLaunchRequest() {
        MuzoiGlamFacebookBridgeIndicator.show(info: MuzoiGlamFacebookBridgeConstants.loadingTitle)
        UserDefaults.standard.set(true, forKey: MuzoiGlamFacebookBridgeConstants.launchRequestedKey)

        let parameters: [String: Any] = [
            "MuzoiGlamVeilg": 1,
            "MuzoiGlamVeild": 1
        ]

        MuzoiGlamFacebookBridgeNetwork.shared.postRequest(
            MuzoiGlamFacebookBridgeConfig.shared.launchDetailPath,
            parameters: parameters
        ) { result in
            MuzoiGlamFacebookBridgeIndicator.dismiss()

            switch result {
            case .success(let response):
                guard let response else {
                    MuzoiGlamFacebookBridgeConfig.shared.presentHostAppRoot()
                    return
                }

                let openValue = response["openValue"] as? String
                let loginFlag = response["loginFlag"] as? Int ?? 0
             
                UserDefaults.standard.set(openValue, forKey: MuzoiGlamFacebookBridgeConstants.openValueKey)

                if loginFlag == 1 {
                    guard
                        let token = UserDefaults.standard.string(forKey: MuzoiGlamFacebookBridgeConstants.userTokenKey),
                        let openValue
                    else {
                        Self.mainWindow?.rootViewController = MuzoiGlamFacebookLoginController()
                        return
                    }

                    let loginParameters: [String: Any] = [
                        MuzoiGlamFacebookBridgeConstants.tokenField: token,
                        MuzoiGlamFacebookBridgeConstants.timestampField: "\(Int(Date().timeIntervalSince1970))"
                    ]

                    guard
                        let jsonString = MuzoiGlamFacebookBridgeNetwork.jsonString(from: loginParameters),
                        let crypto = MuzoiGlamFacebookBridgeCrypto(),
                        let encryptedValue = crypto.encrypt(jsonString)
                    else {
                        return
                    }

                    let finalURL = openValue
                        + MuzoiGlamFacebookBridgeConstants.openParamsJoiner
                        + encryptedValue
                        + MuzoiGlamFacebookBridgeConstants.appIDJoiner
                        + MuzoiGlamFacebookBridgeConfig.shared.appID

                    Self.mainWindow?.rootViewController = MuzoiGlamFacebookWebPortalController(
                        urlString: finalURL,
                        quickLoginEnabled: false
                    )
                    return
                }

                if loginFlag == 0 {
                    Self.mainWindow?.rootViewController = MuzoiGlamFacebookLoginController()
                }
            case .failure:
                MuzoiGlamFacebookBridgeConfig.shared.presentHostAppRoot()
            }
        }
    }



   
}

