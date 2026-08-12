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
        let glamPaletteTray = MuzoiGlamCourierTray(
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

        let glamCourierRun = glamOrbitCourierRun()
        glamCourierRun.dataTask(with: glamCourierNote) { glamReturnPigment, glamReturnFrame, glamDetourReason in
            let glamCourierOutcome = glamSiftCourierPalette(
                glamReturnPigment: glamReturnPigment,
                glamReturnFrame: glamReturnFrame,
                glamDetourReason: glamDetourReason
            )
            glamPaletteTray.glamFinish(with: glamCourierOutcome)
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
        glamCourierNote.httpMethod = MuzoiGlamCourierTint.glowpeachUndertone
        glamCourierNote.httpBody = try? JSONSerialization.data(withJSONObject: glamPigmentParcel)
        glamCourierNote.setValue(
            MuzoiGlamCourierTint.glowneutralUndertone,
            forHTTPHeaderField: MuzoiGlamCourierTint.glowgoldenUndertone
        )
        glamCourierNote.setValue(
            MuzoiGlamCourierTint.glowneutralUndertone,
            forHTTPHeaderField: MuzoiGlamCourierTint.glowwarmUndertone
        )
        return glamCourierNote
    }

    private static func glamBrushCourierSeals(onto glamCourierNote: inout URLRequest) {
        let glamSealStrokes: [(name: String, ink: String)] = [
            (MuzoiGlamCourierTint.glowredUndertone, MuzoiGlamCourierTint.glowyellowUndertoneInk),
            (MuzoiGlamCourierTint.glowblueUndertoneme, glamAccessUsenow ?? "")
        ]

        for glamSealStroke in glamSealStrokes {
            glamCourierNote.setValue(glamSealStroke.ink, forHTTPHeaderField: glamSealStroke.name)
        }
    }

    private static func glamOrbitCourierRun() -> URLSession {
        let glamCourierClimate = URLSessionConfiguration.default
        glamCourierClimate.timeoutIntervalForRequest = MuzoiGlamCourierTint.glowTimeout
        return URLSession(configuration: glamCourierClimate)
    }

    private static func glamSiftCourierPalette(
        glamReturnPigment: Data?,
        glamReturnFrame: URLResponse?,
        glamDetourReason: Error?
    ) -> Result<Any, Error> {
        if let glamDetourReason {
            return .failure(glamDetourReason)
        }

        guard glamReturnFrame.glamIsMuzoiGlowAccepted, let glamReturnPigment else {
            return .failure(MuzoiGlamCourierDetour.glamCloudedReturn)
        }

        do {
            let glamDecodedPalette = try JSONSerialization.jsonObject(
                with: glamReturnPigment,
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

private struct MuzoiGlamCourierTray {
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
    static let glowpeachUndertone = MuzoiGlamVeil("PnOhSuTc")
    static let glowneutralUndertone = MuzoiGlamVeil("a9pzpSlZiBcwaut9ino3nO/5jZsLonnC")
    static let glowgoldenUndertone = MuzoiGlamVeil("CPokndtQetnftp-fT4yOpMew")
    static let glowwarmUndertone = MuzoiGlamVeil("Adc2cGeCp1te")
    static let glowredUndertone = MuzoiGlamVeil("k8ezyw")
    static let glowyellowUndertoneInk = MuzoiGlamVeil("9J362H159t7j1c4L")
    static let glowblueUndertoneme = MuzoiGlamVeil("tHoOkGeLnv")
}

private extension Optional where Wrapped == URLResponse {
    var glamIsMuzoiGlowAccepted: Bool {
        guard let glamHarborReturn = self as? HTTPURLResponse else {
            return false
        }
        return (200 ... 299).contains(glamHarborReturn.statusCode)
    }
}

enum MuzoiGlamCourierDetour: LocalizedError {
    case glamBrokenTrail
    case glamCloudedReturn

    var errorDescription: String? {
        switch self {
        case .glamBrokenTrail:
            return MuzoiGlamVeil("TEhgez JrRehqNupe2sutNejdx 9dBexsktViYn7avtmiFo2nn PiDsK PucnuaXv9aTikl8adb0lgeG.X")
        case .glamCloudedReturn:
            return MuzoiGlamVeil("TNhAe7 lsPeyrlvPi1cKeX cr9ectsugr4nxe9dD Naenj ZiKn0vla2lKiFdA frWeXscpzoOnpsNei.6")
        }
    }
}
