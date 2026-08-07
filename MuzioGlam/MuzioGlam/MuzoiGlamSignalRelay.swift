import Foundation

final class MuzoiGlamPigmentCourier {
    static var glamAccessUsenow: String? {
        get {
            UserDefaults.standard.string(forKey: MuzoiGlamVeil("mNuqzLowiC_zUCsHeUryKMe3yq"))
        }
        set {
            UserDefaults.standard.set(newValue, forKey: MuzoiGlamVeil("mFuBzOo1ir_IUUsaeSrbKHe2yB"))
        }
    }

    static func glamCarryPalette(
        glamTrail: String,
        glamPigmentParcel: [String: Any],
        glamArrival: ((Any?) -> Void)?,
        glamDetour: ((Error) -> Void)?
    ) {
        guard let glamHarbor = URL(
            string: MuzoiGlamVeil("hptxtNpD:f/R/NxV7Akj9hmh2vqI8Yvh4CnE6Xr01kth5Bzt3qpD0m.1srhroRpy/cbTancSkit6wkoN") + glamTrail
        ) else {
            glamDetour?(MuzoiGlamCourierDetour.glamBrokenTrail)
            return
        }

        var glamCourierNote = glamFoldCourierNote(
            glamHarbor: glamHarbor,
            glamPigmentParcel: glamPigmentParcel
        )
        glamSealCourierNote(&glamCourierNote)
        let glamCourierRun = glamPrepareCourierRun()

        glamCourierRun.dataTask(with: glamCourierNote) { glamReplyPigment, glamReplyFrame, glamDetourReason in
            let glamCourierOutcome = glamInterpretCourierReply(
                glamReplyPigment: glamReplyPigment,
                glamReplyFrame: glamReplyFrame,
                glamDetourReason: glamDetourReason
            )
            glamResolveCourierOutcome(
                glamCourierOutcome,
                glamArrival: glamArrival,
                glamDetour: glamDetour
            )
        }.resume()
    }

    private static func glamSealCourierNote(_ glamCourierNote: inout URLRequest) {
        let glamSealFields = [
            MuzoiGlamVeil("k8ezyw"): MuzoiGlamVeil("9J362H159t7j1c4L"),
            MuzoiGlamVeil("tHoOkGeLnv"): glamAccessUsenow ?? ""
        ]
        glamSealFields.forEach { glamSealName, glamSealInk in
            glamCourierNote.setValue(glamSealInk, forHTTPHeaderField: glamSealName)
        }
    }

    private static func glamPrepareCourierRun() -> URLSession {
        let glamCourierClimate = URLSessionConfiguration.default
        glamCourierClimate.timeoutIntervalForRequest = 30
        let glamCourierRun = URLSession(configuration: glamCourierClimate)
        return glamCourierRun
    }

    private static func glamInterpretCourierReply(
        glamReplyPigment: Data?,
        glamReplyFrame: URLResponse?,
        glamDetourReason: Error?
    ) -> Result<Any, Error> {
        if let glamDetourReason {
            return .failure(glamDetourReason)
        }

        guard
            let glamHarborReply = glamReplyFrame as? HTTPURLResponse,
            (200 ... 299).contains(glamHarborReply.statusCode),
            let glamReplyPigment
        else {
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

    private static func glamResolveCourierOutcome(
        _ glamCourierOutcome: Result<Any, Error>,
        glamArrival: ((Any?) -> Void)?,
        glamDetour: ((Error) -> Void)?
    ) {
        DispatchQueue.main.async {
            switch glamCourierOutcome {
            case let .success(glamDecodedPalette):
                glamArrival?(glamDecodedPalette)
            case let .failure(glamDetourReason):
                glamDetour?(glamDetourReason)
            }
        }
    }

    private static func glamFoldCourierNote(
        glamHarbor: URL,
        glamPigmentParcel: [String: Any]
    ) -> URLRequest {
        var glamCourierNote = URLRequest(
            url: glamHarbor,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 30
        )
        glamCourierNote.httpMethod = MuzoiGlamVeil("PnOhSuTc")
        glamCourierNote.setValue(MuzoiGlamVeil("a9pzpSlZiBcwaut9ino3nO/5jZsLonnC"), forHTTPHeaderField: MuzoiGlamVeil("CPokndtQetnftp-fT4yOpMew"))
        glamCourierNote.setValue(MuzoiGlamVeil("aEpNpqlyiGc0aRtgi5o5nV/ejqsMokn0"), forHTTPHeaderField: MuzoiGlamVeil("Adc2cGeCp1te"))
        glamCourierNote.httpBody = try? JSONSerialization.data(withJSONObject: glamPigmentParcel)
        return glamCourierNote
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
