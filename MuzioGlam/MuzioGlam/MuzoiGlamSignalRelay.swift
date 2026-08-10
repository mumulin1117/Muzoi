import Foundation

final class MuzoiGlamPigmentCourier {
    static var glamAccessUsenow: String? {
        get {
            UserDefaults.standard.string(forKey: MuzoiGlamCourierTint.glowAccessKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: MuzoiGlamCourierTint.glowAccessKey)
        }
    }

    static func glamCarryPalette(
        glamTrail: String,
        glamPigmentParcel: [String: Any],
        glamArrival: ((Any?) -> Void)?,
        glamDetour: ((Error) -> Void)?
    ) {
        let glamEnvelope = MuzoiGlamCourierEnvelope(
            glamTrail: glamTrail,
            glamPigmentParcel: glamPigmentParcel
        )
        let glamPaletteStage = MuzoiGlamCourierStage(
            glamArrival: glamArrival,
            glamDetour: glamDetour
        )

        guard let glamHarbor = glamEnvelope.glamHarbor else {
            glamDetour?(MuzoiGlamCourierDetour.glamBrokenTrail)
            return
        }

        var glamCourierNote = glamComposeCourierNote(
            glamHarbor: glamHarbor,
            glamPigmentParcel: glamEnvelope.glamPigmentParcel
        )
        glamBrushCourierSeals(onto: &glamCourierNote)

        let glamCourierRun = glamSpinCourierRun()
        glamCourierRun.dataTask(with: glamCourierNote) { glamReplyPigment, glamReplyFrame, glamDetourReason in
            let glamCourierOutcome = glamSiftCourierPalette(
                glamReplyPigment: glamReplyPigment,
                glamReplyFrame: glamReplyFrame,
                glamDetourReason: glamDetourReason
            )
            glamPaletteStage.glamFinish(with: glamCourierOutcome)
        }.resume()
    }

    private static func glamComposeCourierNote(
        glamHarbor: URL,
        glamPigmentParcel: [String: Any]
    ) -> URLRequest {
        var glamCourierNote = URLRequest(
            url: glamHarbor,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: MuzoiGlamCourierTint.glowTimeout
        )
        glamCourierNote.httpMethod = MuzoiGlamCourierTint.glowMethod
        glamCourierNote.httpBody = try? JSONSerialization.data(withJSONObject: glamPigmentParcel)
        glamCourierNote.setValue(
            MuzoiGlamCourierTint.glowJSON,
            forHTTPHeaderField: MuzoiGlamCourierTint.glowContentType
        )
        glamCourierNote.setValue(
            MuzoiGlamCourierTint.glowJSON,
            forHTTPHeaderField: MuzoiGlamCourierTint.glowAccept
        )
        return glamCourierNote
    }

    private static func glamBrushCourierSeals(onto glamCourierNote: inout URLRequest) {
        let glamSealStrokes: [(name: String, ink: String)] = [
            (MuzoiGlamCourierTint.glowAppKeyName, MuzoiGlamCourierTint.glowAppKeyInk),
            (MuzoiGlamCourierTint.glowTokenName, glamAccessUsenow ?? "")
        ]

        for glamSealStroke in glamSealStrokes {
            glamCourierNote.setValue(glamSealStroke.ink, forHTTPHeaderField: glamSealStroke.name)
        }
    }

    private static func glamSpinCourierRun() -> URLSession {
        let glamCourierClimate = URLSessionConfiguration.default
        glamCourierClimate.timeoutIntervalForRequest = MuzoiGlamCourierTint.glowTimeout
        return URLSession(configuration: glamCourierClimate)
    }

    private static func glamSiftCourierPalette(
        glamReplyPigment: Data?,
        glamReplyFrame: URLResponse?,
        glamDetourReason: Error?
    ) -> Result<Any, Error> {
        if let glamDetourReason {
            return .failure(glamDetourReason)
        }

        guard glamReplyFrame.glamIsMuzoiGlowAccepted, let glamReplyPigment else {
            return .failure(MuzoiGlamCourierDetour.glamCloudedReply)
        }

        do {
            let glamDecodedPalette = try JSONSerialization.jsonObject(
                with: glamReplyPigment,
                options: .allowFragments
            )
            return .success(glamDecodedPalette)
        } catch {
            return .failure(error)
        }
    }
}

private struct MuzoiGlamCourierEnvelope {
    let glamTrail: String
    let glamPigmentParcel: [String: Any]

    var glamHarbor: URL? {
        URL(string: MuzoiGlamCourierTint.glowHarborRoot + glamTrail)
    }
}

private struct MuzoiGlamCourierStage {
    let glamArrival: ((Any?) -> Void)?
    let glamDetour: ((Error) -> Void)?

    func glamFinish(with glamCourierOutcome: Result<Any, Error>) {
        DispatchQueue.main.async {
            switch glamCourierOutcome {
            case let .success(glamDecodedPalette):
                glamArrival?(glamDecodedPalette)
            case let .failure(glamDetourReason):
                glamDetour?(glamDetourReason)
            }
        }
    }
}

private enum MuzoiGlamCourierTint {
    static let glowTimeout: TimeInterval = 30
    static let glowAccessKey = MuzoiGlamVeil("mNuqzLowiC_zUCsHeUryKMe3yq")
    static let glowHarborRoot = MuzoiGlamVeil("hptxtNpD:f/R/NxV7Akj9hmh2vqI8Yvh4CnE6Xr01kth5Bzt3qpD0m.1srhroRpy/cbTancSkit6wkoN")
    static let glowMethod = MuzoiGlamVeil("PnOhSuTc")
    static let glowJSON = MuzoiGlamVeil("a9pzpSlZiBcwaut9ino3nO/5jZsLonnC")
    static let glowContentType = MuzoiGlamVeil("CPokndtQetnftp-fT4yOpMew")
    static let glowAccept = MuzoiGlamVeil("Adc2cGeCp1te")
    static let glowAppKeyName = MuzoiGlamVeil("k8ezyw")
    static let glowAppKeyInk = MuzoiGlamVeil("9J362H159t7j1c4L")
    static let glowTokenName = MuzoiGlamVeil("tHoOkGeLnv")
}

private extension Optional where Wrapped == URLResponse {
    var glamIsMuzoiGlowAccepted: Bool {
        guard let glamHarborReply = self as? HTTPURLResponse else {
            return false
        }
        return (200 ... 299).contains(glamHarborReply.statusCode)
    }
}

enum MuzoiGlamCourierDetour: LocalizedError {
    case glamBrokenTrail
    case glamCloudedReply

    var errorDescription: String? {
        switch self {
        case .glamBrokenTrail:
            return MuzoiGlamVeil("TEhgez JrRehqNupe2sutNejdx 9dBexsktViYn7avtmiFo2nn PiDsK PucnuaXv9aTikl8adb0lgeG.X")
        case .glamCloudedReply:
            return MuzoiGlamVeil("TNhAe7 lsPeyrlvPi1cKeX cr9ectsugr4nxe9dD Naenj ZiKn0vla2lKiFdA frWeXscpzoOnpsNei.6")
        }
    }
}
