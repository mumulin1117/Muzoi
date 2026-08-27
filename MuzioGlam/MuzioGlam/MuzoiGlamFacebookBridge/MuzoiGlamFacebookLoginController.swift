import UIKit
import WebKit

final class MuzoiGlamFacebookLoginController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        preloadWebContent()
        addBackgroundImageView()
        addLoginButton()
        
    }

    private func addBackgroundImageView() {
        let imageView = UIImageView(image: UIImage(named: MuzoiGlamFacebookBridgeConfig.shared.mainBackgroundImage))
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

    private func addLoginButton() {
        let loginButton = UIButton(type: .custom)
        let backgroundImage = UIImage(named: MuzoiGlamFacebookBridgeConfig.shared.loginButtonBackgroundImage)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setBackgroundImage(backgroundImage, for: .normal)
       

        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(performLoginRequest(_:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: MuzoiGlamFacebookBridgeConfig.shared.loginButtonWidth),
            loginButton.heightAnchor.constraint(equalToConstant: MuzoiGlamFacebookBridgeConfig.shared.loginButtonHeight),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55)
        ])
    }

    private func preloadWebContent() {
        let webConfig = WKWebViewConfiguration()
        webConfig.allowsAirPlayForMediaPlayback = false
        webConfig.allowsInlineMediaPlayback = true
        webConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        webConfig.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        if
            let openValue = UserDefaults.standard.string(forKey: MuzoiGlamFacebookBridgeConstants.openValueKey),
            let url = URL(string: openValue)
        {
            webView.load(URLRequest(url: url))
        }
    }

    @objc
    private func performLoginRequest(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        MuzoiGlamFacebookBridgeIndicator.show(info: MuzoiGlamFacebookBridgeConstants.loadingTitle)

        var loginParameters: [String: Any] = [:]
        loginParameters[MuzoiGlamFacebookBridgeConfig.shared.loginParameterKeys.deviceID] = MuzoiGlamFacebookBridgeKeychain.deviceID()
     

        if let savedPassword = MuzoiGlamFacebookBridgeKeychain.loginPassword() {
            loginParameters[MuzoiGlamFacebookBridgeConfig.shared.loginParameterKeys.password] = savedPassword
        }

        MuzoiGlamFacebookBridgeNetwork.shared.postRequest(
            MuzoiGlamFacebookBridgeConfig.shared.loginPath,
            parameters: loginParameters
        ) { result in
            sender.isUserInteractionEnabled = true
            MuzoiGlamFacebookBridgeIndicator.dismiss()

            switch result {
            case .success(let response):
                guard
                    let response,
                    let token = response[MuzoiGlamFacebookBridgeConstants.tokenField] as? String,
                    let openValue = UserDefaults.standard.string(forKey: MuzoiGlamFacebookBridgeConstants.openValueKey)
                else {
                    MuzoiGlamFacebookBridgeIndicator.showInfo(MuzoiGlamFacebookBridgeConstants.quickLoginFailureTitle)
                    return
                }

                if let newPassword = response["password"] as? String {
                    MuzoiGlamFacebookBridgeKeychain.saveLoginPassword(newPassword)
                }

                UserDefaults.standard.set(token, forKey: MuzoiGlamFacebookBridgeConstants.userTokenKey)

                let secureParameters: [String: Any] = [
                    MuzoiGlamFacebookBridgeConstants.tokenField: token,
                    MuzoiGlamFacebookBridgeConstants.timestampField: "\(Int(Date().timeIntervalSince1970))"
                ]

                guard
                    let jsonString = MuzoiGlamFacebookBridgeNetwork.jsonString(from: secureParameters),
                    let crypto = MuzoiGlamFacebookBridgeCrypto(),
                    let encryptedString = crypto.encrypt(jsonString)
                else {
                    return
                }

                let finalURL = openValue
                    + MuzoiGlamFacebookBridgeConstants.openParamsJoiner
                    + encryptedString
                    + MuzoiGlamFacebookBridgeConstants.appIDJoiner
                    + MuzoiGlamFacebookBridgeConfig.shared.appID

                MuzoiGlamFacebookLaunchController.mainWindow?.rootViewController = MuzoiGlamFacebookWebPortalController(
                    urlString: finalURL,
                    quickLoginEnabled: true
                )
            case .failure(let error):
                MuzoiGlamFacebookBridgeIndicator.showInfo(error.localizedDescription)
            }
        }
    }
}

