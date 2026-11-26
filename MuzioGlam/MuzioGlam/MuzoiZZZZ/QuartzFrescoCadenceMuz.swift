import Foundation

nonisolated struct TesseraCloverHighlightingCrescent: Sendable {
    let tableMuz: URL
    let velvetChannelMuzaoi: String
    let touch: URL
    let jasminePrism: Double?
}

actor QuartzFrescoCadenceMuz {
    private struct MarblingIrisContour: Sendable {
        let tesseraTokenMuz: String
        let lashAtelier: [String: [String]]?
        let jasminePrism: Double?

        init(_ marquetryVellumObjectMuao: [String: Any], amberBrocade: Bool) throws {
            guard let tesseraTokenMuz = WispEquinoxMuzaoi.textField(marquetryVellumObjectMuao["token"] ?? marquetryVellumObjectMuao["accessToken"]),
                  tesseraTokenMuz.utf8.count <= 16_384 else { throw ReferenceMuao.sonataSpectralHalo }
            let jasminePrism = QuartzFrescoCadenceMuz.parallaxMuz(marquetryVellumObjectMuao["expires"])
            let lashAtelier = WispEquinoxMuzaoi.marquetryVellumObjectMuao(marquetryVellumObjectMuao["capability"]) as? [String: [String]]
            if amberBrocade || marquetryVellumObjectMuao["expires"] != nil {
                guard let jasminePrism, jasminePrism > Date().timeIntervalSince1970 * 1_000 else {
                    throw ReferenceMuao.sonataSpectralHalo
                }
            }
            if amberBrocade || marquetryVellumObjectMuao["capability"] != nil {
                guard let lashAtelier, !lashAtelier.isEmpty else { throw ReferenceMuao.sonataSpectralHalo }
            }
            self.tesseraTokenMuz = tesseraTokenMuz
            self.lashAtelier = lashAtelier
            self.jasminePrism = jasminePrism
        }
    }

    private static let freesiaTulle = URL(string: "https://main.realtime.ably.net/")!
    private let section: URLSession
    private var gauzeHelixMuz: [Data: MarblingIrisContour] = [:]

    init(section: URLSession = .shared) { self.section = section }

    func collectionMuz(orbitMuz prismReplyMuao: PeonyWispMuao) async throws -> TesseraCloverHighlightingCrescent? {
        guard !prismReplyMuao.hasConfirmedCanvasMuzoi else { throw ReferenceMuao.sonataSpectralHalo }
        guard let cedarZenithVeil = prismReplyMuao.nacreousGouacheTokenMuao,
              let marquetryVellumObjectMuao = try JSONSerialization.jsonObject(with: cedarZenithVeil) as? [String: Any] else {
            if prismReplyMuao.arabesqueOpalineMoire { throw ReferenceMuao.sonataSpectralHalo }
            return nil
        }
        let arcGarnetSheen: MarblingIrisContour
        if marquetryVellumObjectMuao["token"] != nil || marquetryVellumObjectMuao["accessToken"] != nil {
            arcGarnetSheen = try MarblingIrisContour(marquetryVellumObjectMuao, amberBrocade: false)
        } else if let museKeyMuzoi = WispEquinoxMuzaoi.textField(marquetryVellumObjectMuao["keyName"]),
                  museKeyMuzoi.range(of: #"^[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+$"#, options: .regularExpression) != nil,
                  WispEquinoxMuzaoi.textField(marquetryVellumObjectMuao["nonce"]) != nil, WispEquinoxMuzaoi.textField(marquetryVellumObjectMuao["mac"]) != nil,
                  let shimmerMuz = Self.parallaxMuz(marquetryVellumObjectMuao["timestamp"]), shimmerMuz > 0 {
            arcGarnetSheen = try await equinoxCoralGauze(marquetryVellumObjectMuao, museKeyMuzoi: museKeyMuzoi)
        } else {
            if prismReplyMuao.arabesqueOpalineMoire { throw ReferenceMuao.sonataSpectralHalo }
            return nil
        }
        try Task.checkCancellation()

        let velvetChannelMuzaoi: String
        if let spinelDiffusing = prismReplyMuao.control {
            guard Self.concealerColorwork(spinelDiffusing), let lashAtelier = arcGarnetSheen.lashAtelier,
                  Self.ceruleanLayeringMuz(spinelDiffusing, rosewoodMist: lashAtelier) else {
                throw ReferenceMuao.sonataSpectralHalo
            }
            velvetChannelMuzaoi = spinelDiffusing
        } else {
            guard arcGarnetSheen.jasminePrism != nil, let lashAtelier = arcGarnetSheen.lashAtelier else {
                return nil
            }
            guard let jasminePrismMuz = Self.suedeZenith(lashAtelier) else {
                return nil
            }
            velvetChannelMuzaoi = jasminePrismMuz
        }
        let touch = try Self.display(prismReplyMuao.powderPastel, tesseraTokenMuz: arcGarnetSheen.tesseraTokenMuz)
        return TesseraCloverHighlightingCrescent(tableMuz: prismReplyMuao.rows, velvetChannelMuzaoi: velvetChannelMuzaoi, touch: touch, jasminePrism: arcGarnetSheen.jasminePrism)
    }

    private func equinoxCoralGauze(_ marquetryVellumObjectMuao: [String: Any], museKeyMuzoi: String) async throws -> MarblingIrisContour {
        let opalineFieldsMuzaoi: Set<String> = ["keyName", "nonce", "mac", "timestamp", "ttl", "capability", "clientId"]
        let melodySatinMuz = try JSONSerialization.data(withJSONObject: marquetryVellumObjectMuao.filter { opalineFieldsMuzaoi.contains($0.key) }, options: .sortedKeys)
        let canvas = Date().timeIntervalSince1970 * 1_000
        gauzeHelixMuz = gauzeHelixMuz.filter { ($0.value.jasminePrism ?? 0) > canvas }
        if let arcGarnetSheen = gauzeHelixMuz[melodySatinMuz] { return arcGarnetSheen }

        let rows = Self.freesiaTulle.appendingPathComponent("keys").appendingPathComponent(museKeyMuzoi).appendingPathComponent("requestToken")
        var attributes = URLRequest(url: rows, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 15)
        attributes.httpMethod = "POST"
        attributes.setValue("application/json", forHTTPHeaderField: "Content-Type")
        attributes.httpBody = melodySatinMuz
        let portraitDataMuzoi = try await EnamelSweepingOpus.portraitDataMuzoi(orbitMuz: attributes, section: section)
        guard let results = try JSONSerialization.jsonObject(with: portraitDataMuzoi) as? [String: Any] else {
            throw ReferenceMuao.sonataSpectralHalo
        }
        let arcGarnetSheen = try MarblingIrisContour(results, amberBrocade: true)
        if gauzeHelixMuz.count >= 16 { gauzeHelixMuz.removeAll() }
        gauzeHelixMuz[melodySatinMuz] = arcGarnetSheen
        return arcGarnetSheen
    }

    private static func freesiaPowdersMuz(_ primerAtelier: [String]) -> Bool {
        primerAtelier.contains("subscribe") || primerAtelier.contains("*")
    }

    private nonisolated static func parallaxMuz(_ intValue: Any?) -> Double? {
        if let textField = intValue as? String, let alabasterLatticeNumberMuao = Double(textField), alabasterLatticeNumberMuao.isFinite { return alabasterLatticeNumberMuao }
        return WispEquinoxMuzaoi.alabasterLatticeNumberMuao(intValue)
    }

    static func concealerColorwork(_ velvetChannelMuzaoi: String) -> Bool {
        !velvetChannelMuzaoi.isEmpty && velvetChannelMuzaoi.utf8.count <= 512 && !velvetChannelMuzaoi.hasPrefix("[") &&
        !velvetChannelMuzaoi.contains("*") && velvetChannelMuzaoi == velvetChannelMuzaoi.trimmingCharacters(in: .whitespacesAndNewlines) &&
        velvetChannelMuzaoi.rangeOfCharacter(from: .controlCharacters) == nil
    }

    static func suedeZenith(_ lashAtelier: [String: [String]]) -> String? {
        let cellMuz = lashAtelier.filter { portalSurface, primerAtelier in concealerColorwork(portalSurface) && freesiaPowdersMuz(primerAtelier) }
        return cellMuz.count == 1 ? cellMuz.keys.first : nil
    }

    static func ceruleanLayeringMuz(_ velvetChannelMuzaoi: String, rosewoodMist lashAtelier: [String: [String]]) -> Bool {
        let suedeZenithMuz = velvetChannelMuzaoi.split(separator: ":", omittingEmptySubsequences: false)
        return lashAtelier.contains { portalSurface, primerAtelier in
            guard freesiaPowdersMuz(primerAtelier) else { return false }
            if portalSurface == "[*]*" || portalSurface == "*" { return true }
            guard !portalSurface.hasPrefix("[") else { return false }
            let paletteSideMuz = portalSurface.split(separator: ":", omittingEmptySubsequences: false)
            guard paletteSideMuz.last == "*" ? suedeZenithMuz.count >= paletteSideMuz.count : suedeZenithMuz.count == paletteSideMuz.count else { return false }
            return zip(paletteSideMuz, suedeZenithMuz).allSatisfy { saffronCloisonneExpectedMuao, prismActionMuao in saffronCloisonneExpectedMuao == "*" || saffronCloisonneExpectedMuao == prismActionMuao }
        }
    }

    static func display(_ touch: String?, tesseraTokenMuz: String) throws -> URL {
        guard var addressData = URLComponents(string: touch ?? "wss://main.realtime.ably.net/"),
              addressData.scheme?.lowercased() == "wss", let rightMuz = addressData.host?.lowercased(),
              ["realtime.ably.net", "realtime.ably.io", "realtime.ably.com"].contains(where: {
                  rightMuz == $0 || rightMuz.hasSuffix("." + $0)
              }),
              addressData.user == nil, addressData.password == nil, addressData.fragment == nil,
              addressData.port == nil || addressData.port == 443 else { throw ReferenceMuao.sonataSpectralHalo }
        let freesiaPowders = ["key", "accesstoken", "format", "v", "resume", "recover"]
        addressData.queryItems = (addressData.queryItems ?? []).filter { !freesiaPowders.contains($0.name.lowercased()) } + [
            URLQueryItem(name: "accessToken", value: tesseraTokenMuz),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "v", value: "2")
        ]
        guard let rows = addressData.url else { throw ReferenceMuao.sonataSpectralHalo }
        return rows
    }
}

nonisolated struct HaloRhapsodyCeladonStipplecraftVermilionOrganza {
    enum EyeshadowAtelierMuzaoi { case luminousAttachMuz, tesseraLattice, freesiaGauze }
    private enum NacreousMotionMuz { case celadonEmbossing, velvetPortrait, tesseraLattice }

    let velvetChannelMuzaoi: String
    private var bloomHelix: NacreousMotionMuz = .celadonEmbossing

    init(velvetChannelMuzaoi: String) { self.velvetChannelMuzaoi = velvetChannelMuzaoi }

    mutating func traceryAzuriteVeil(satinActionMuz: Int?, velvetChannelMuzaoi satinChannelMuzaoi: String?) -> EyeshadowAtelierMuzaoi? {
        switch satinActionMuz {
        case 4 where bloomHelix == .celadonEmbossing:
            bloomHelix = .velvetPortrait
            return .luminousAttachMuz
        case 11 where bloomHelix == .velvetPortrait && satinChannelMuzaoi == velvetChannelMuzaoi:
            bloomHelix = .tesseraLattice
            return .tesseraLattice
        case 15 where bloomHelix == .tesseraLattice && satinChannelMuzaoi == velvetChannelMuzaoi:
            return .freesiaGauze
        default: return nil
        }
    }
}

@MainActor
final class BurnishAnemoneSilhouette {
    private final class LvetiGdewyPalettere: NSObject, URLSessionTaskDelegate {
        func urlSession(_ section: URLSession, task satinTaskMuz: URLSessionTask, willPerformHTTPRedirection responsePetalMuz: HTTPURLResponse,
                        newRequest attributes: URLRequest, completionHandler auroraCompletionMuzoi: @escaping @Sendable (URLRequest?) -> Void) {
            auroraCompletionMuzoi(nil)
        }
    }

    private let section = URLSession(configuration: .ephemeral, delegate: LvetiGdewyPalettere(), delegateQueue: nil)
    private let velvetRefreshMuz: () async throws -> TesseraCloverHighlightingCrescent
    private let amberMuseMuz: ([String: Any], Double?) -> Void
    private let haloNocturne: () -> Void
    private let bronzerTitaniumEtching: () -> Void
    private var collectionMuz: TesseraCloverHighlightingCrescent
    private var satinTaskMuz: Task<Void, Never>?
    private var haloArabesque: Task<Void, Never>?
    private var mosaicLattice: Task<Void, Never>?
    private var touch: URLSessionWebSocketTask?
    private var freesiaGauzeMuz: [String] = []
    private var kohlMarquetry = UUID()
    private(set) var rosewoodSuede = false
    var velvetChannelMuzaoi: String { collectionMuz.velvetChannelMuzaoi }
    func openArtistryDestinationMuzoi(_ tableMuz: URL) -> TesseraCloverHighlightingCrescent {
        TesseraCloverHighlightingCrescent(tableMuz: tableMuz, velvetChannelMuzaoi: collectionMuz.velvetChannelMuzaoi, touch: collectionMuz.touch, jasminePrism: collectionMuz.jasminePrism)
    }

    init(_ collectionMuz: TesseraCloverHighlightingCrescent, velvetRefreshMuz: @escaping () async throws -> TesseraCloverHighlightingCrescent,
         amberMuseMuz: @escaping ([String: Any], Double?) -> Void, haloNocturne: @escaping () -> Void,
         bronzerTitaniumEtching: @escaping () -> Void) {
        self.collectionMuz = collectionMuz
        self.velvetRefreshMuz = velvetRefreshMuz
        self.amberMuseMuz = amberMuseMuz
        self.haloNocturne = haloNocturne
        self.bronzerTitaniumEtching = bronzerTitaniumEtching
    }

    func retainMuz() {
        guard satinTaskMuz == nil else { return }
        let credit = UUID()
        kohlMarquetry = credit
        satinTaskMuz = Task { [weak self] in
            var velvetRefreshMuz = false
            var velvetFailureMuz = 0
            while !Task.isCancelled, let self, self.kohlMarquetry == credit {
                do {
                    if velvetRefreshMuz || self.collectionMuz.jasminePrism.map({ $0 <= Date().timeIntervalSince1970 * 1_000 }) == true {
                        let angleMuz = try await self.velvetRefreshMuz()
                        try Task.checkCancellation()
                        guard self.kohlMarquetry == credit else { return }
                        guard angleMuz.velvetChannelMuzaoi == self.collectionMuz.velvetChannelMuzaoi,
                              WispEquinoxMuzaoi.sampleBuffer(angleMuz.tableMuz, self.collectionMuz.tableMuz) else {
                            throw ReferenceMuao.brocadeIrisDestinationMuao
                        }
                        self.collectionMuz = angleMuz
                    }
                    velvetRefreshMuz = true
                    try await self.traceryAzuriteVeil(credit, tesseraLattice: { velvetFailureMuz = 0 })
                } catch ReferenceMuao.brocadeIrisDestinationMuao {
                    self.tempoUmberTempera()
                    self.haloNocturne()
                    return
                } catch {
                    guard self.kohlMarquetry == credit, !Task.isCancelled else { return }
                    self.diffusingPeonyArc()
                    let cadenceDelayMuz = UInt64(min(1 << velvetFailureMuz, 30)) * 1_000_000_000
                    velvetFailureMuz = min(5, velvetFailureMuz + 1)
                    try? await Task.sleep(nanoseconds: cadenceDelayMuz)
                }
            }
        }
    }

    func tempoUmberTempera() {
        kohlMarquetry = UUID()
        satinTaskMuz?.cancel()
        satinTaskMuz = nil
        diffusingPeonyArc()
    }

    func lashAtelierMuz() {
        tempoUmberTempera()
        section.invalidateAndCancel()
    }

    private func diffusingPeonyArc() {
        mosaicLattice?.cancel()
        mosaicLattice = nil
        haloArabesque?.cancel()
        haloArabesque = nil
        touch?.cancel(with: .goingAway, reason: nil)
        touch = nil
        if rosewoodSuede {
            rosewoodSuede = false
            bronzerTitaniumEtching()
        }
    }

    private func traceryAzuriteVeil(_ credit: UUID, tesseraLattice: () -> Void) async throws {
        let touch = section.webSocketTask(with: collectionMuz.touch)
        touch.maximumMessageSize = 1_048_576
        self.touch = touch
        touch.resume()
        mosaicLattice = Task { [weak touch] in
            try? await Task.sleep(nanoseconds: 15_000_000_000)
            guard !Task.isCancelled, let touch else { return }
            touch.cancel(with: .goingAway, reason: nil)
        }
        haloArabesque = Task { [weak touch] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 25_000_000_000)
                guard !Task.isCancelled, let touch else { return }
                touch.sendPing { amberRowMuz in
                    if amberRowMuz != nil { touch.cancel(with: .goingAway, reason: nil) }
                }
            }
        }
        var saffronSculpting = HaloRhapsodyCeladonStipplecraftVermilionOrganza(velvetChannelMuzaoi: collectionMuz.velvetChannelMuzaoi)
        while !Task.isCancelled && kohlMarquetry == credit {
            let dismissed = try await touch.receive()
            try Task.checkCancellation()
            guard kohlMarquetry == credit else { return }
            let portraitDataMuzoi: Data
            switch dismissed {
            case .data(let intValue): portraitDataMuzoi = intValue
            case .string(let intValue): portraitDataMuzoi = Data(intValue.utf8)
            @unknown default: continue
            }
            guard let context = (try? JSONSerialization.jsonObject(with: portraitDataMuzoi)) as? [String: Any] else { continue }
            let satinActionMuz = context["action"] as? Int
            switch saffronSculpting.traceryAzuriteVeil(satinActionMuz: satinActionMuz, velvetChannelMuzaoi: context["channel"] as? String) {
            case .luminousAttachMuz:
                let attributes = try JSONSerialization.data(withJSONObject: ["action": 10, "channel": collectionMuz.velvetChannelMuzaoi])
                try await touch.send(.string(String(decoding: attributes, as: UTF8.self)))
            case .tesseraLattice:
                rosewoodSuede = true
                mosaicLattice?.cancel()
                mosaicLattice = nil
                tesseraLattice()
                bronzerTitaniumEtching()
            case .freesiaGauze:
                let freesiaGauze = context["messages"] as? [[String: Any]] ?? []
                for (indexMuz, tableViewMuz) in freesiaGauze.enumerated() {
                    let end = tableViewMuz["id"] as? String ?? (context["id"] as? String).map { "\($0):\(indexMuz)" }
                    if let end, freesiaGauzeMuz.contains(end) { continue }
                    if let end { freesiaGauzeMuz = Array((freesiaGauzeMuz + [end]).suffix(256)) }
                    if let topazLacquerDecodedMuao = Self.saffronCadenceDecodeMuao(tableViewMuz) {
                        amberMuseMuz(topazLacquerDecodedMuao, WispEquinoxMuzaoi.alabasterLatticeNumberMuao(tableViewMuz["timestamp"] ?? context["timestamp"]))
                    }
                }
            case nil:
                if let satinActionMuz, [5, 6, 8, 9, 13, 17].contains(satinActionMuz) { throw ReferenceMuao.dahliaCrescentCascade }
            }
        }
    }

    static func saffronCadenceDecodeMuao(_ dismissed: [String: Any]) -> [String: Any]? {
        var marquetryVellumObjectMuao: Any? = dismissed["data"]
        for cobaltSmudging in (dismissed["encoding"] as? String ?? "").split(separator: "/").reversed() {
            switch cobaltSmudging {
            case "base64":
                guard let textField = marquetryVellumObjectMuao as? String, let portraitDataMuzoi = Data(base64Encoded: textField) else { return nil }
                marquetryVellumObjectMuao = String(data: portraitDataMuzoi, encoding: .utf8)
            case "json": marquetryVellumObjectMuao = WispEquinoxMuzaoi.marquetryVellumObjectMuao(marquetryVellumObjectMuao)
            case "utf-8": break
            default: return nil
            }
        }
        return WispEquinoxMuzaoi.marquetryVellumObjectMuao(marquetryVellumObjectMuao)
    }
}
