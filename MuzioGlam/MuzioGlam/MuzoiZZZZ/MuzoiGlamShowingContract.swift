import CoreFoundation
import Foundation

nonisolated enum MuzoiGlamShowingError: Error {
    case invalidResponse, invalidConnection, changedDestination, missingResource, socketClosed
}

nonisolated struct MuzoiGlamShowingIdentity: Sendable {
    static let appID = "48934308"
    static var registrationEntry: URL? {
        Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "New_login_dist")
    }

    let deviceID: String
    let version: String
    let pushToken: String?

    func registrationURL(_ entry: URL, language: String) -> URL? {
        guard entry.isFileURL, entry.lastPathComponent == "index.html" else { return nil }
        var url = URLComponents(url: entry, resolvingAgainstBaseURL: false)
        let identityKeys = Set(["appId", "appVersion", "deviceId", "lang", "pushToken"])
        let retained = (url?.queryItems ?? []).filter { !identityKeys.contains($0.name) }
        url?.queryItems = retained + [
            URLQueryItem(name: "appId", value: Self.appID),
            URLQueryItem(name: "appVersion", value: version),
            URLQueryItem(name: "deviceId", value: deviceID),
            URLQueryItem(name: "lang", value: language),
        ]
        if let pushToken { url?.queryItems?.append(URLQueryItem(name: "pushToken", value: pushToken)) }
        if url?.fragment?.isEmpty != false { url?.fragment = "/" }
        return url?.url
    }
}

nonisolated enum MuzoiGlamShowingPage: CaseIterable {
    case welcome, community

    static func confirmation(name: String, body: Any) -> Self? {
        allCases.first { $0.accepts(name: name, body: body) }
    }

    var handler: String { self == .welcome ? "MuzoiWelcome" : "MuzoiCommunityRules" }
    private var source: String { self == .welcome ? "MuzoiWelcome" : "MuzoiCommunity" }
    private var intent: String { self == .welcome ? "continue" : "iknow" }

    private func accepts(name: String, body: Any) -> Bool {
        guard name == handler, let payload = body as? [String: Any],
              let incomingSource = MuzoiGlamShowingURL.text(payload["source"]), incomingSource == source,
              let action = MuzoiGlamShowingURL.text(payload["action"])?.lowercased() else { return false }
        return action == "sure" || action == intent
    }
}

nonisolated enum MuzoiGlamShowingURL {
    static func text(_ value: Any?) -> String? {
        guard let string = value as? String else { return nil }
        let result = string.trimmingCharacters(in: .whitespacesAndNewlines)
        return result.isEmpty ? nil : result
    }

    static func https(_ value: Any?) -> URL? {
        guard let string = text(value), string.utf8.count <= 8192,
              let address = URLComponents(string: string), address.scheme?.lowercased() == "https",
              let host = address.host, !host.isEmpty,
              address.user == nil, address.password == nil, address.port == nil || address.port == 443 else { return nil }
        return address.url
    }

    static func businessLink(_ value: Any?) -> URL? {
        if let url = https(value) { return url }
        guard let text = text(value), text.utf8.count <= 8192,
              let address = URLComponents(string: text), address.scheme?.lowercased() == "itms-apps",
              let host = address.host?.lowercased(), ["apps.apple.com", "itunes.apple.com"].contains(host),
              address.user == nil, address.password == nil, address.port == nil else { return nil }
        return address.url
    }

    static func businessReceiptEndpoint(_ value: String) -> URL? {
        guard let url = https(value), url.host?.lowercased() == "mua.muzoi.top",
              url.path == "/yalovy/verify", url.query == nil, url.fragment == nil else { return nil }
        return url
    }

    static func sameOrigin(_ first: URL, _ second: URL) -> Bool {
        guard let first = https(first.absoluteString), let second = https(second.absoluteString) else { return false }
        return first.host?.lowercased() == second.host?.lowercased()
    }

    static func sameDocument(_ first: URL, _ second: URL) -> Bool {
        if first.isFileURL && second.isFileURL {
            return first.standardizedFileURL.path == second.standardizedFileURL.path
        }
        guard sameOrigin(first, second),
              let lhs = URLComponents(url: first, resolvingAgainstBaseURL: false),
              let rhs = URLComponents(url: second, resolvingAgainstBaseURL: false) else { return false }
        return (lhs.percentEncodedPath.isEmpty ? "/" : lhs.percentEncodedPath) == (rhs.percentEncodedPath.isEmpty ? "/" : rhs.percentEncodedPath)
    }

    static func object(_ value: Any?) -> [String: Any]? {
        if let object = value as? [String: Any] { return object }
        guard let string = value as? String, string.utf8.count <= 1_048_576 else { return nil }
        return (try? JSONSerialization.jsonObject(with: Data(string.utf8))) as? [String: Any]
    }

    static func number(_ value: Any?) -> Double? {
        guard let number = value as? NSNumber, CFGetTypeID(number) != CFBooleanGetTypeID(),
              number.doubleValue.isFinite else { return nil }
        return number.doubleValue
    }
}

nonisolated struct MuzoiGlamOpenReply: Sendable {
    let url: URL
    let longToken: Data?
    let roomID: String?
    let webSocketURL: String?
    let hasExplicitConnection: Bool
    let hasMalformedConnection: Bool

    init(data: Data) throws {
        guard data.count <= 1_048_576,
              let envelope = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              MuzoiGlamShowingURL.number(envelope["playfulCircleCharm"] ?? envelope["code"]) == 0,
              let address = MuzoiGlamShowingURL.https(envelope["canvasOrnateArtist"] ?? envelope["h5Url"]) else {
            throw MuzoiGlamShowingError.invalidResponse
        }
        let credential = MuzoiGlamShowingURL.object(envelope["charmStyleLustre"] ?? envelope["longtoken"])
        url = address
        let room = Self.presentField(envelope["roomId"]) ?? Self.presentField(credential?["roomId"])
        let socket = Self.presentField(envelope["webSocketUrl"]) ?? Self.presentField(credential?["webSocketUrl"])
        roomID = MuzoiGlamShowingURL.text(room)
        webSocketURL = MuzoiGlamShowingURL.text(socket)
        hasExplicitConnection = room != nil || socket != nil
        hasMalformedConnection = (room != nil && roomID == nil) || (socket != nil && webSocketURL == nil)
        longToken = try credential.flatMap {
            $0.isEmpty ? nil : try JSONSerialization.data(withJSONObject: $0, options: .sortedKeys)
        }
    }

    private static func presentField(_ value: Any?) -> Any? { value is NSNull ? nil : value }

    var hasBusinessConfiguration: Bool { longToken != nil || hasExplicitConnection }
}

nonisolated enum MuzoiGlamBusinessDiagnostic {
    static func record(_ event: String) {
        #if DEBUG
        try? FileHandle.standardError.write(contentsOf: Data("[MuzoiGlam Business] \(event)\n".utf8))
        #endif
    }
}

nonisolated struct MuzoiGlamBusinessReadiness: Equatable {
    enum Reason: String {
        case notBusiness, pageLoading, background, subscribing, paymentUnavailable, ready
    }

    let business: Bool
    let subscribed: Bool
    let reason: Reason
    var purchaseEnabled: Bool { reason == .ready }

    init(business: Bool, pageReady: Bool, foreground: Bool, subscribed: Bool, paymentAvailable: Bool) {
        self.business = business
        self.subscribed = business && subscribed
        if !business { reason = .notBusiness }
        else if !foreground { reason = .background }
        else if !pageReady { reason = .pageLoading }
        else if !subscribed { reason = .subscribing }
        else if !paymentAvailable { reason = .paymentUnavailable }
        else { reason = .ready }
    }

    var bridgePayload: [String: Any] {
        ["event": "muzoiGlamBusinessState", "version": 1, "business": business,
         "subscribed": subscribed, "purchaseEnabled": purchaseEnabled, "reason": reason.rawValue]
    }
}

nonisolated struct MuzoiGlamBusinessPurchaseSession: Equatable {
    let id: UUID
    let channel: String
}

nonisolated struct MuzoiGlamBusinessPurchaseRecord: Codable {
    let id: UUID
    let order: String
    let product: String
    let channel: String
    let sessionID: UUID?
    var verified = false
    var storeKit1: Bool? = nil
    var appleTransactionID: String? = nil
    var storeEnvironment: String? = nil

    var isLocalStoreKitTest: Bool { storeEnvironment == "xcode" }

    func belongs(to session: MuzoiGlamBusinessPurchaseSession?) -> Bool {
        guard let session, let sessionID else { return false }
        return sessionID == session.id && channel == session.channel
    }

    func owns(productID: String, accountToken: UUID?, transactionID: String?) -> Bool {
        guard product == productID, accountToken == nil || accountToken == id else { return false }
        if let appleTransactionID, let transactionID { return appleTransactionID == transactionID }
        return accountToken == id
    }

    static func pendingVerification(in records: [Self], excluding queued: Set<UUID> = []) -> [Self] {
        // A transaction linked to multiple local orders is ambiguous. Preserve
        // those records for reconciliation instead of attempting duplicate delivery.
        let counts = records.reduce(into: [String: Int]()) { counts, record in
            if let transaction = record.appleTransactionID { counts[transaction, default: 0] += 1 }
        }
        return records.filter { record in
            guard !record.verified, !record.isLocalStoreKitTest, !queued.contains(record.id),
                  !record.order.isEmpty, !record.product.isEmpty,
                  let transaction = record.appleTransactionID,
                  MuzoiGlamShowingURL.text(transaction) == transaction,
                  counts[transaction] == 1 else { return false }
            return true
        }
    }
}

nonisolated enum MuzoiGlamShowingHTTP {
    private nonisolated final class NoRedirects: NSObject, URLSessionTaskDelegate {
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse,
                        newRequest request: URLRequest, completionHandler: @escaping @Sendable (URLRequest?) -> Void) {
            completionHandler(nil)
        }
    }

    static func data(for request: URLRequest, session: URLSession) async throws -> Data {
        let (data, response) = try await session.data(for: request, delegate: NoRedirects())
        try Task.checkCancellation()
        #if DEBUG
        if request.url == MuzoiGlamOpenService.startupURL {
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            MuzoiGlamBusinessDiagnostic.record("openResponse.HTTP\(status).bytes\(data.count)")
        }
        #endif
        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode),
              response.url == request.url, data.count <= 1_048_576 else { throw MuzoiGlamShowingError.invalidResponse }
        return data
    }
}

nonisolated struct MuzoiGlamOpenService: Sendable {
    static let startupURL = URL(string: "https://server.muzoiplay.online/lustre2/transform/circle")!
    private let session: URLSession

    init(session: URLSession = .shared) { self.session = session }

    static func request(identity: MuzoiGlamShowingIdentity, account: String? = nil) throws -> URLRequest {
        var request = URLRequest(url: startupURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 15)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(MuzoiGlamShowingIdentity.appID, forHTTPHeaderField: "charmWonderOrnate")
        request.setValue(identity.version, forHTTPHeaderField: "canvasCreativeGlimmer")
        request.setValue(identity.deviceID, forHTTPHeaderField: "elegantAllureAllure")
        var body: [String: String] = identity.pushToken.map { ["paletteShadeMakeup": $0] } ?? [:]
        if let account = MuzoiGlamShowingURL.text(account) { body["discoverVibrantCircle"] = account }
        request.httpBody = try JSONEncoder().encode(body)
        return request
    }

    func open(identity: MuzoiGlamShowingIdentity, account: String? = nil) async throws -> MuzoiGlamOpenReply {
        try await MuzoiGlamOpenReply(data: MuzoiGlamShowingHTTP.data(for: Self.request(identity: identity, account: account), session: session))
    }

    func openUntilSuccessful(identity: MuzoiGlamShowingIdentity) async throws -> MuzoiGlamOpenReply {
        try await Self.retry { try await open(identity: identity) }
    }

    static func retry(
        operation: @Sendable () async throws -> MuzoiGlamOpenReply,
        sleep: @Sendable (UInt64) async throws -> Void = { try await Task.sleep(nanoseconds: $0) }
    ) async throws -> MuzoiGlamOpenReply {
        while true {
            try Task.checkCancellation()
            do {
                let reply = try await operation()
                try Task.checkCancellation()
                return reply
            } catch {
                try Task.checkCancellation()
                try await sleep(1_500_000_000)
            }
        }
    }
}

/// 解析 Muzoi 实时业务消息。
nonisolated enum MuzoiGlamBusinessCommand {
    case purchase(product: String, order: String)
    case invalidPurchase
    case connected(URL)
    case logout
    case openBrowser(URL)
    case forward

    static func read(_ packet: [String: Any]) -> Self {
        let incoming = MuzoiGlamBusinessConfiguration.profile.incoming
        switch packet["lacquer"] as? String {
        case incoming.purchaseAction:
            guard let data = MuzoiGlamShowingURL.object(packet[incoming.data]),
                  let product = MuzoiGlamShowingURL.text(data[incoming.productID]), product.utf8.count <= 255,
                  let order = MuzoiGlamShowingURL.text(data[incoming.orderID]), order.utf8.count <= 512,
                  product.rangeOfCharacter(from: .controlCharacters) == nil,
                  order.rangeOfCharacter(from: .controlCharacters) == nil else { return .invalidPurchase }
            return .purchase(product: product, order: order)
        case "linkSuccessMessage":
            guard let url = MuzoiGlamShowingURL.https(packet["url"]) else { return .forward }
            return .connected(url)
        case "logout": return .logout
        case "openBrowser":
            guard let data = MuzoiGlamShowingURL.object(packet["data"]),
                  let url = MuzoiGlamShowingURL.https(data["titanium"]) else { return .forward }
            return .openBrowser(url)
        default: return .forward
        }
    }
}

nonisolated struct MuzoiGlamBusinessConfiguration: Decodable {
    struct Incoming: Decodable {
        let data, purchaseSelector, purchaseAction, closeSelector, closeAction: String
        let openSelector, openAction, forwardSelector, forwardAction: String
        let productID, orderID, externalURL, directCloseHandler: String
    }

    struct Outgoing: Decodable {
        let event, purchaseEvent, orderID, productID, success, status, message, reason: String
        let openEvent, openState, source, nativeSource: String
    }

    struct Receipt: Decodable {
        let enabled: Bool
        let url, transactionID, receiptData, orderID: String

        var endpoint: URL? {
            let keys = [transactionID, receiptData, orderID]
            guard enabled, keys.allSatisfy({ MuzoiGlamShowingURL.text($0) == $0 }), Set(keys).count == keys.count else { return nil }
            return MuzoiGlamShowingURL.businessReceiptEndpoint(url)
        }

        func request(transaction: String, receipt: Data, order: String) throws -> URLRequest {
            guard let endpoint, !transaction.isEmpty, !receipt.isEmpty, !order.isEmpty else {
                throw MuzoiGlamShowingError.invalidResponse
            }
            var request = URLRequest(url: endpoint, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode([
                transactionID: transaction, receiptData: receipt.base64EncodedString(), orderID: order
            ])
            return request
        }

        static func accepts(_ data: Data, status: Int = 200) -> Bool {
            guard status == 200 else { return false }
            // Confirmed Muzoi contract: only HTTP 200 plus an empty JSON object.
            return ((try? JSONSerialization.jsonObject(with: data)) as? [String: Any])?.isEmpty == true
        }
    }

    let receipt: Receipt
    let incoming: Incoming
    let outgoing: Outgoing

    static let profile: Self = {
        // Confirmed Muzoi field aliases, message actions and receipt endpoint.
        // An invalid endpoint still disables all purchases.
        return Self(
            receipt: Receipt(enabled: true, url: "https://mua.muzoi.top/yalovy/verify", transactionID: "gardeniaS", receiptData: "houettePatina", orderID: "velvet"),
            incoming: Incoming(data: "data", purchaseSelector: "lacquer", purchaseAction: "pay",
                               closeSelector: "lacquer", closeAction: "logout", openSelector: "lacquer", openAction: "openBrowser",
                               forwardSelector: "lacquer", forwardAction: "linkSuccessMessage", productID: "sandalwoodGraphite", orderID: "patinaOrganza",
                               externalURL: "titanium", directCloseHandler: "holographicStyleArchive"),
            outgoing: Outgoing(event: "event", purchaseEvent: "payResult", orderID: "velvet",
                               productID: "productId", success: "success", status: "status", message: "message", reason: "reason",
                               openEvent: "nativeOpenState", openState: "state", source: "source", nativeSource: "native")
        )
    }()

    func opened(_ success: Bool) -> [String: Any] {
        [outgoing.event: outgoing.openEvent, outgoing.openState: success ? "success" : "failed",
         outgoing.source: outgoing.nativeSource]
    }

    func purchase(order: String, product: String, status: String, reason: String) -> [String: Any] {
        let message = [
            "verified": "Payment successful.",
            "pending": "Your purchase is still processing.",
            "cancelled": "Purchase cancelled.",
            "failed": "The purchase could not be completed."
        ][status] ?? "The purchase could not be completed."
        return [outgoing.event: outgoing.purchaseEvent, outgoing.orderID: order, outgoing.productID: product,
                outgoing.success: status == "verified", outgoing.status: status, outgoing.reason: reason,
                outgoing.message: message]
    }
}

