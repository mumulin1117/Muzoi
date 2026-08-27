import Foundation

final class MuzoiGlamFacebookBridgeNetwork: NSObject {
    static let shared = MuzoiGlamFacebookBridgeNetwork()

    func postRequest(
        _ path: String,
        parameters: [String: Any],
        isPaymentFlow: Bool = false,
        completion: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }
    ) {
        guard let requestURL = URL(string: MuzoiGlamFacebookBridgeConfig.shared.baseURL + path) else {
            completion(.failure(NSError(domain: MuzoiGlamFacebookBridgeConstants.invalidURLDomain, code: 400)))
            return
        }

        guard
            let jsonString = Self.jsonString(from: parameters),
            let crypto = MuzoiGlamFacebookBridgeCrypto(),
            let encryptedString = crypto.encrypt(jsonString),
            let encryptedData = encryptedString.data(using: .utf8)
        else {
            completion(.failure(NSError(domain: MuzoiGlamFacebookBridgeConstants.invalidJSONDomain, code: 1001)))
            return
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = MuzoiGlamFacebookBridgeConstants.postMethod
        request.httpBody = encryptedData
        request.timeoutInterval = 15
        request.setValue(
            MuzoiGlamFacebookBridgeConstants.jsonContentType,
            forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.contentTypeHeader
        )
        request.setValue(
            MuzoiGlamFacebookBridgeConfig.shared.appID,
            forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.appIDHeader
        )
        request.setValue(Bundle.main.muzoiAppVersion, forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.appVersionHeader)
        request.setValue(MuzoiGlamFacebookBridgeKeychain.deviceID(), forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.deviceIDHeader)
        request.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.languageHeader)
        request.setValue(
            UserDefaults.standard.string(forKey: MuzoiGlamFacebookBridgeConstants.userTokenKey) ?? "",
            forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.loginTokenHeader
        )
        request.setValue(
            UserDefaults.standard.string(forKey: MuzoiGlamFacebookBridgeConstants.pushTokenKey) ?? "",
            forHTTPHeaderField: MuzoiGlamFacebookBridgeConstants.pushTokenHeader
        )

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }

            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: MuzoiGlamFacebookBridgeConstants.emptyPayloadDomain, code: 1000)))
                }
                return
            }

            self.handleResponse(
                isPaymentFlow: isPaymentFlow,
                rawData: data,
                completion: completion
            )
        }.resume()
    }

    private func handleResponse(
        isPaymentFlow: Bool,
        rawData: Data,
        completion: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        do {
            guard let json = try JSONSerialization.jsonObject(with: rawData) as? [String: Any] else {
                throw NSError(domain: MuzoiGlamFacebookBridgeConstants.invalidJSONDomain, code: 1001)
            }

            let code = json[MuzoiGlamFacebookBridgeConstants.codeField] as? String
            if isPaymentFlow {
                guard code == MuzoiGlamFacebookBridgeConstants.successCode else {
                    throw NSError(domain: MuzoiGlamFacebookBridgeConstants.paymentDomain, code: 1001)
                }
                DispatchQueue.main.async { completion(.success([:])) }
                return
            }

            guard
                code == MuzoiGlamFacebookBridgeConstants.successCode,
                let encryptedResult = json[MuzoiGlamFacebookBridgeConstants.resultField] as? String
            else {
                throw NSError(
                    domain: json[MuzoiGlamFacebookBridgeConstants.messageField] as? String
                        ?? MuzoiGlamFacebookBridgeConstants.fallbackDataErrorTitle,
                    code: 1002
                )
            }

            guard
                let crypto = MuzoiGlamFacebookBridgeCrypto(),
                let decryptedString = crypto.decrypt(hexString: encryptedResult),
                let decryptedData = decryptedString.data(using: .utf8),
                let result = try JSONSerialization.jsonObject(with: decryptedData) as? [String: Any]
            else {
                throw NSError(domain: MuzoiGlamFacebookBridgeConstants.decryptionDomain, code: 1003)
            }

            DispatchQueue.main.async { completion(.success(result)) }
        } catch {
            DispatchQueue.main.async { completion(.failure(error)) }
        }
    }

    static func jsonString(from dictionary: [String: Any]) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

private extension Bundle {
    var muzoiAppVersion: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
}

