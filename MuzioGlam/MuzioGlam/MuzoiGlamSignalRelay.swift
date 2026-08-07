import Foundation

final class MuzoiGlamSignalRelay {
    static var glamSessionToken: String? {
        get {
            UserDefaults.standard.string(forKey: "muzoi_UserKey")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "muzoi_UserKey")
        }
    }

    static func glamTransmit(
        glamEndpoint: String,
        glamEnvelope: [String: Any],
        glamSuccess: ((Any?) -> Void)?,
        glamFailure: ((Error) -> Void)?
    ) {
        guard let glamDestination = URL(
            string: "http://x7k9m2q8v4n6r1t5z3p0.shop/backtwo" + glamEndpoint
        ) else {
            glamFailure?(MuzoiGlamRelayFault.glamInvalidDestination)
            return
        }

        var glamRequest = glamForgeRequest(
            glamDestination: glamDestination,
            glamEnvelope: glamEnvelope
        )
        let glamHeaders = [
            "key": "93219714",
            "token": glamSessionToken ?? ""
        ]
        glamHeaders.forEach { glamField, glamValue in
            glamRequest.setValue(glamValue, forHTTPHeaderField: glamField)
        }

        let glamConfiguration = URLSessionConfiguration.default
        glamConfiguration.timeoutIntervalForRequest = 30
        let glamRelay = URLSession(configuration: glamConfiguration)

        glamRelay.dataTask(with: glamRequest) { glamData, glamResponse, glamFault in
            DispatchQueue.main.async {
                if let glamFault {
                    glamFailure?(glamFault)
                    return
                }
                guard
                    let glamHTTPResponse = glamResponse as? HTTPURLResponse,
                    (200 ... 299).contains(glamHTTPResponse.statusCode),
                    let glamData
                else {
                    glamFailure?(MuzoiGlamRelayFault.glamInvalidResponse)
                    return
                }

                do {
                    let glamObject = try JSONSerialization.jsonObject(
                        with: glamData,
                        options: .allowFragments
                    )
                    glamSuccess?(glamObject)
                } catch {
                    glamFailure?(error)
                }
            }
        }.resume()
    }

    private static func glamForgeRequest(
        glamDestination: URL,
        glamEnvelope: [String: Any]
    ) -> URLRequest {
        var glamRequest = URLRequest(
            url: glamDestination,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 30
        )
        glamRequest.httpMethod = "POST"
        glamRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        glamRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        glamRequest.httpBody = try? JSONSerialization.data(withJSONObject: glamEnvelope)
        return glamRequest
    }
}

enum MuzoiGlamRelayFault: LocalizedError {
    case glamInvalidDestination
    case glamInvalidResponse

    var errorDescription: String? {
        switch self {
        case .glamInvalidDestination:
            return "The requested destination is unavailable."
        case .glamInvalidResponse:
            return "The service returned an invalid response."
        }
    }
}
