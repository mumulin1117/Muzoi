import Foundation

nonisolated struct MuzoiGlamBusinessConnection: Sendable {
    let page: URL
    let channel: String
    let socket: URL
    let expires: Double?
}

actor MuzoiGlamAblyResolver {
    private struct Grant: Sendable {
        let token: String
        let capability: [String: [String]]?
        let expires: Double?

        init(_ object: [String: Any], exchanged: Bool) throws {
            guard let token = MuzoiGlamShowingURL.text(object["token"] ?? object["accessToken"]),
                  token.utf8.count <= 16_384 else { throw MuzoiGlamShowingError.invalidConnection }
            let expires = MuzoiGlamAblyResolver.claimNumber(object["expires"])
            let capability = MuzoiGlamShowingURL.object(object["capability"]) as? [String: [String]]
            if exchanged || object["expires"] != nil {
                guard let expires, expires > Date().timeIntervalSince1970 * 1_000 else {
                    throw MuzoiGlamShowingError.invalidConnection
                }
            }
            if exchanged || object["capability"] != nil {
                guard let capability, !capability.isEmpty else { throw MuzoiGlamShowingError.invalidConnection }
            }
            self.token = token
            self.capability = capability
            self.expires = expires
        }
    }

    private static let restURL = URL(string: "https://main.realtime.ably.net/")!
    private let session: URLSession
    private var cached: [Data: Grant] = [:]

    init(session: URLSession = .shared) { self.session = session }

    func connection(for reply: MuzoiGlamOpenReply) async throws -> MuzoiGlamBusinessConnection? {
        guard !reply.hasMalformedConnection else { throw MuzoiGlamShowingError.invalidConnection }
        guard let credential = reply.longToken,
              let object = try JSONSerialization.jsonObject(with: credential) as? [String: Any] else {
            MuzoiGlamBusinessDiagnostic.record("credentialMissingOrUnreadable")
            if reply.hasExplicitConnection { throw MuzoiGlamShowingError.invalidConnection }
            return nil
        }
        let grant: Grant
        if object["token"] != nil || object["accessToken"] != nil {
            MuzoiGlamBusinessDiagnostic.record("usingTokenDetails")
            grant = try Grant(object, exchanged: false)
        } else if let key = MuzoiGlamShowingURL.text(object["keyName"]),
                  key.range(of: #"^[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+$"#, options: .regularExpression) != nil,
                  MuzoiGlamShowingURL.text(object["nonce"]) != nil, MuzoiGlamShowingURL.text(object["mac"]) != nil,
                  let timestamp = Self.claimNumber(object["timestamp"]), timestamp > 0 {
            MuzoiGlamBusinessDiagnostic.record("exchangingSignedTokenRequest")
            do { grant = try await exchange(object, key: key) }
            catch {
                if !Task.isCancelled { MuzoiGlamBusinessDiagnostic.record("tokenExchangeFailed") }
                throw error
            }
        } else {
            MuzoiGlamBusinessDiagnostic.record("unrecognizedCredential")
            if reply.hasExplicitConnection { throw MuzoiGlamShowingError.invalidConnection }
            return nil
        }
        try Task.checkCancellation()

        let channel: String
        if let explicit = reply.roomID {
            guard Self.concrete(explicit), let capability = grant.capability,
                  Self.canSubscribe(explicit, with: capability) else {
                MuzoiGlamBusinessDiagnostic.record("explicitRoomNotAuthorized")
                throw MuzoiGlamShowingError.invalidConnection
            }
            channel = explicit
        } else {
            guard grant.expires != nil, let capability = grant.capability else {
                MuzoiGlamBusinessDiagnostic.record("grantMissingExpiryOrCapability")
                return nil
            }
            guard let inferred = Self.soleChannel(capability) else {
                MuzoiGlamBusinessDiagnostic.record("noUniqueConcreteChannel")
                return nil
            }
            channel = inferred
        }
        let socket = try Self.socketURL(reply.webSocketURL, token: grant.token)
        MuzoiGlamBusinessDiagnostic.record("connectionResolved")
        return MuzoiGlamBusinessConnection(page: reply.url, channel: channel, socket: socket, expires: grant.expires)
    }

    private func exchange(_ object: [String: Any], key: String) async throws -> Grant {
        let signedFields: Set<String> = ["keyName", "nonce", "mac", "timestamp", "ttl", "capability", "clientId"]
        let body = try JSONSerialization.data(withJSONObject: object.filter { signedFields.contains($0.key) }, options: .sortedKeys)
        let now = Date().timeIntervalSince1970 * 1_000
        cached = cached.filter { ($0.value.expires ?? 0) > now }
        if let grant = cached[body] { return grant }

        let url = Self.restURL.appendingPathComponent("keys").appendingPathComponent(key).appendingPathComponent("requestToken")
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 15)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        let data = try await MuzoiGlamShowingHTTP.data(for: request, session: session)
        guard let result = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw MuzoiGlamShowingError.invalidConnection
        }
        let grant = try Grant(result, exchanged: true)
        if cached.count >= 16 { cached.removeAll() }
        cached[body] = grant
        return grant
    }

    private static func canReceive(_ operations: [String]) -> Bool {
        operations.contains("subscribe") || operations.contains("*")
    }

    private nonisolated static func claimNumber(_ value: Any?) -> Double? {
        if let text = value as? String, let number = Double(text), number.isFinite { return number }
        return MuzoiGlamShowingURL.number(value)
    }

    static func concrete(_ channel: String) -> Bool {
        !channel.isEmpty && channel.utf8.count <= 512 && !channel.hasPrefix("[") &&
        !channel.contains("*") && channel == channel.trimmingCharacters(in: .whitespacesAndNewlines) &&
        channel.rangeOfCharacter(from: .controlCharacters) == nil
    }

    static func soleChannel(_ capability: [String: [String]]) -> String? {
        let channels = capability.filter { resource, operations in concrete(resource) && canReceive(operations) }
        return channels.count == 1 ? channels.keys.first : nil
    }

    static func canSubscribe(_ channel: String, with capability: [String: [String]]) -> Bool {
        let segments = channel.split(separator: ":", omittingEmptySubsequences: false)
        return capability.contains { resource, operations in
            guard canReceive(operations) else { return false }
            if resource == "[*]*" || resource == "*" { return true }
            guard !resource.hasPrefix("[") else { return false }
            let pattern = resource.split(separator: ":", omittingEmptySubsequences: false)
            guard pattern.last == "*" ? segments.count >= pattern.count : segments.count == pattern.count else { return false }
            return zip(pattern, segments).allSatisfy { expected, actual in expected == "*" || expected == actual }
        }
    }

    static func socketURL(_ socket: String?, token: String) throws -> URL {
        guard var address = URLComponents(string: socket ?? "wss://main.realtime.ably.net/"),
              address.scheme?.lowercased() == "wss", let host = address.host?.lowercased(),
              ["realtime.ably.net", "realtime.ably.io", "realtime.ably.com"].contains(where: {
                  host == $0 || host.hasSuffix("." + $0)
              }),
              address.user == nil, address.password == nil, address.fragment == nil,
              address.port == nil || address.port == 443 else { throw MuzoiGlamShowingError.invalidConnection }
        let reserved = ["key", "accesstoken", "format", "v", "resume", "recover"]
        address.queryItems = (address.queryItems ?? []).filter { !reserved.contains($0.name.lowercased()) } + [
            URLQueryItem(name: "accessToken", value: token),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "v", value: "2")
        ]
        guard let url = address.url else { throw MuzoiGlamShowingError.invalidConnection }
        return url
    }
}

nonisolated struct MuzoiGlamBusinessSubscription {
    enum Event { case attach, attached, messages }
    private enum Phase { case connecting, attaching, attached }

    let channel: String
    private var phase: Phase = .connecting

    init(channel: String) { self.channel = channel }

    mutating func receive(action: Int?, channel incomingChannel: String?) -> Event? {
        switch action {
        case 4 where phase == .connecting:
            phase = .attaching
            return .attach
        case 11 where phase == .attaching && incomingChannel == channel:
            phase = .attached
            return .attached
        case 15 where phase == .attached && incomingChannel == channel:
            return .messages
        default: return nil
        }
    }
}

@MainActor
final class MuzoiGlamBusinessStream {
    private final class SocketDelegate: NSObject, URLSessionTaskDelegate {
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse,
                        newRequest request: URLRequest, completionHandler: @escaping @Sendable (URLRequest?) -> Void) {
            completionHandler(nil)
        }
    }

    private let session = URLSession(configuration: .ephemeral, delegate: SocketDelegate(), delegateQueue: nil)
    private let refresh: () async throws -> MuzoiGlamBusinessConnection
    private let onMessage: ([String: Any], Double?) -> Void
    private let onChanged: () -> Void
    private let onSubscriptionChanged: () -> Void
    private var connection: MuzoiGlamBusinessConnection
    private var task: Task<Void, Never>?
    private var heartbeat: Task<Void, Never>?
    private var attachTimeout: Task<Void, Never>?
    private var socket: URLSessionWebSocketTask?
    private var received: [String] = []
    private var marker = UUID()
    private(set) var isSubscribed = false
    var channel: String { connection.channel }
    func destination(_ page: URL) -> MuzoiGlamBusinessConnection {
        MuzoiGlamBusinessConnection(page: page, channel: connection.channel, socket: connection.socket, expires: connection.expires)
    }

    init(_ connection: MuzoiGlamBusinessConnection, refresh: @escaping () async throws -> MuzoiGlamBusinessConnection,
         onMessage: @escaping ([String: Any], Double?) -> Void, onChanged: @escaping () -> Void,
         onSubscriptionChanged: @escaping () -> Void) {
        self.connection = connection
        self.refresh = refresh
        self.onMessage = onMessage
        self.onChanged = onChanged
        self.onSubscriptionChanged = onSubscriptionChanged
    }

    func start() {
        guard task == nil else { return }
        let current = UUID()
        marker = current
        task = Task { [weak self] in
            var refresh = false
            var failures = 0
            while !Task.isCancelled, let self, self.marker == current {
                do {
                    if refresh || self.connection.expires.map({ $0 <= Date().timeIntervalSince1970 * 1_000 }) == true {
                        let next = try await self.refresh()
                        try Task.checkCancellation()
                        guard self.marker == current else { return }
                        guard next.channel == self.connection.channel,
                              MuzoiGlamShowingURL.sameDocument(next.page, self.connection.page) else {
                            throw MuzoiGlamShowingError.changedDestination
                        }
                        self.connection = next
                    }
                    refresh = true
                    try await self.receive(current, attached: { failures = 0 })
                } catch MuzoiGlamShowingError.changedDestination {
                    self.stop()
                    self.onChanged()
                    return
                } catch {
                    guard self.marker == current, !Task.isCancelled else { return }
                    self.disconnect()
                    let delay = UInt64(min(1 << failures, 30)) * 1_000_000_000
                    failures = min(5, failures + 1)
                    try? await Task.sleep(nanoseconds: delay)
                }
            }
        }
    }

    func stop() {
        marker = UUID()
        task?.cancel()
        task = nil
        disconnect()
    }

    func close() {
        stop()
        session.invalidateAndCancel()
    }

    private func disconnect() {
        attachTimeout?.cancel()
        attachTimeout = nil
        heartbeat?.cancel()
        heartbeat = nil
        socket?.cancel(with: .goingAway, reason: nil)
        socket = nil
        if isSubscribed {
            isSubscribed = false
            onSubscriptionChanged()
        }
    }

    private func receive(_ current: UUID, attached: () -> Void) async throws {
        let socket = session.webSocketTask(with: connection.socket)
        socket.maximumMessageSize = 1_048_576
        self.socket = socket
        socket.resume()
        attachTimeout = Task { [weak socket] in
            try? await Task.sleep(nanoseconds: 15_000_000_000)
            guard !Task.isCancelled, let socket else { return }
            MuzoiGlamBusinessDiagnostic.record("subscriptionTimedOut")
            socket.cancel(with: .goingAway, reason: nil)
        }
        heartbeat = Task { [weak socket] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 25_000_000_000)
                guard !Task.isCancelled, let socket else { return }
                socket.sendPing { error in
                    if error != nil { socket.cancel(with: .goingAway, reason: nil) }
                }
            }
        }
        var subscription = MuzoiGlamBusinessSubscription(channel: connection.channel)
        while !Task.isCancelled && marker == current {
            let message = try await socket.receive()
            try Task.checkCancellation()
            guard marker == current else { return }
            let data: Data
            switch message {
            case .data(let value): data = value
            case .string(let value): data = Data(value.utf8)
            @unknown default: continue
            }
            guard let packet = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { continue }
            let action = packet["action"] as? Int
            switch subscription.receive(action: action, channel: packet["channel"] as? String) {
            case .attach:
                let request = try JSONSerialization.data(withJSONObject: ["action": 10, "channel": connection.channel])
                try await socket.send(.string(String(decoding: request, as: UTF8.self)))
            case .attached:
                isSubscribed = true
                attachTimeout?.cancel()
                attachTimeout = nil
                attached()
                MuzoiGlamBusinessDiagnostic.record("channelAttached")
                onSubscriptionChanged()
            case .messages:
                let messages = packet["messages"] as? [[String: Any]] ?? []
                for (index, item) in messages.enumerated() {
                    let id = item["id"] as? String ?? (packet["id"] as? String).map { "\($0):\(index)" }
                    if let id, received.contains(id) { continue }
                    if let id { received = Array((received + [id]).suffix(256)) }
                    if let decoded = Self.decode(item) {
                        onMessage(decoded, MuzoiGlamShowingURL.number(item["timestamp"] ?? packet["timestamp"]))
                    }
                }
            case nil:
                if let action, [5, 6, 8, 9, 13, 17].contains(action) { throw MuzoiGlamShowingError.socketClosed }
            }
        }
    }

    static func decode(_ message: [String: Any]) -> [String: Any]? {
        var object: Any? = message["data"]
        for encoding in (message["encoding"] as? String ?? "").split(separator: "/").reversed() {
            switch encoding {
            case "base64":
                guard let text = object as? String, let data = Data(base64Encoded: text) else { return nil }
                object = String(data: data, encoding: .utf8)
            case "json": object = MuzoiGlamShowingURL.object(object)
            case "utf-8": break
            default: return nil
            }
        }
        return MuzoiGlamShowingURL.object(object)
    }
}
