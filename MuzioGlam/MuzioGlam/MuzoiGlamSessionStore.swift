import Foundation

struct MuzoiGlamEntryPalette {
    let glamAvantInkStyle: String
    let glamArtfulFaceMorph: String
    let glamBeautyRadianceNet: String
}

final class MuzoiGlamIdentityLoom {
    static let glamShared = MuzoiGlamIdentityLoom()

    private let glamEntryEndpoint = MuzoiGlamVeil("/ZcXfCqVtBlNcMbAcSzD/FrGxHrJjKhLnQrWqE")

    private enum MuzoiGlamKeepsakeKey {
        static let glamEntryMark = MuzoiGlamVeil("mSuozLo3ixL9opg8g5eNdLISnG")
        static let glamCurrentSignature = MuzoiGlamVeil("mDuwz3o6ieCtuirOrPe3nNtiU8s1e4rfIODX")
        static let glamCurrentMailbox = MuzoiGlamVeil("mNuSzxooiSCWuFrUr2eInmt9EfmHadiul5")
        static let glamCurrentToken = MuzoiGlamVeil("mCuezYoXiz_SUmsAerrtKsetyp")
        static let glamEULAAccepted = MuzoiGlamVeil("mvugzwogiOE2U0LrABAycqc0e1pztXe1dw")
    }

    private let glamKeepsake = UserDefaults.standard

    private init() {}

    var glamHasEntry: Bool {
        glamKeepsake.bool(forKey: MuzoiGlamKeepsakeKey.glamEntryMark)
    }

    var glamCurrentSignature: String? {
        glamKeepsake.string(forKey: MuzoiGlamKeepsakeKey.glamCurrentSignature)
    }

    var glamCurrentMailbox: String? {
        glamKeepsake.string(forKey: MuzoiGlamKeepsakeKey.glamCurrentMailbox)
    }

    var glamAcceptedCovenant: Bool {
        get { glamKeepsake.bool(forKey: MuzoiGlamKeepsakeKey.glamEULAAccepted) }
        set { glamKeepsake.set(newValue, forKey: MuzoiGlamKeepsakeKey.glamEULAAccepted) }
    }

    func glamUnlock(
        glamArtfulFaceMorph: String,
        glamBlendingGlowpath: String,
        glamResolution: @escaping (Result<MuzoiGlamEntryPalette, MuzoiGlamEntryDetour>) -> Void
    ) {
        let glamNormalizedArtfulFace = glamArtfulFaceMorph.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        let glamEntryParcel: [String: Any] = [
            MuzoiGlamVeil("aZrXtCfVuBlNFMaAcSeDMFoGrHpJhK"): glamNormalizedArtfulFace,
            MuzoiGlamVeil("bZlXeCnVdBiNnMgAGSlDoFwGpHaJtKhL"): glamBlendingGlowpath,
            MuzoiGlamVeil("vZiXsCuVaBlNMMaAkSeDuFpGPHuJlKsLeQ"): MuzoiGlamVeil("9P3W2Y1Z9M7d1L4X")
        ]

        MuzoiGlamPigmentCourier.glamCarryPalette(
            glamTrail: glamEntryEndpoint,
            glamPigmentParcel: glamEntryParcel,
            glamArrival: { [weak self] glamObject in
                guard let self else { return }
                guard
                    let glamRawData = self.glamEntryRawData(from: glamObject),
                    let glamEntryPalette = self.glamDecodeEntryPalette(
                        glamRawData,
                        glamArtfulFaceMorph: glamNormalizedArtfulFace
                    )
                else {
                    glamResolution(.failure(.glamUnreadableReply))
                    return
                }

                self.glamSealEntryPalette(glamEntryPalette)
                glamResolution(.success(glamEntryPalette))
            },
            glamDetour: { _ in
                glamResolution(.failure(.glamServiceUnavailable))
            }
        )
    }

    func glamSealEntry() {
        glamKeepsake.set(false, forKey: MuzoiGlamKeepsakeKey.glamEntryMark)
    }

    private func glamEntryRawData(from glamObject: Any?) -> [String: Any]? {
        guard let glamParcel = glamObject as? [String: Any] else { return nil }
        return glamParcel[MuzoiGlamVeil("dZaXtCaV")] as? [String: Any]
    }

    private func glamDecodeEntryPalette(
        _ glamData: [String: Any],
        glamArtfulFaceMorph: String
    ) -> MuzoiGlamEntryPalette? {
        guard
            let glamAvantInkStyle = glamTextValue(glamData[MuzoiGlamVeil("aZvXaCnVtBINnMkASStDyFlGeH")]),
            let glamBeautyRadianceNet = glamTextValue(glamData[MuzoiGlamVeil("bZeXaCuVtByNRMaAdSiDaFnGcHeJNKeLtQ")])
        else { return nil }

        return MuzoiGlamEntryPalette(
            glamAvantInkStyle: glamAvantInkStyle,
            glamArtfulFaceMorph: glamArtfulFaceMorph,
            glamBeautyRadianceNet: glamBeautyRadianceNet
        )
    }

    private func glamSealEntryPalette(_ glamEntryPalette: MuzoiGlamEntryPalette) {
        glamKeepsake.set(true, forKey: MuzoiGlamKeepsakeKey.glamEntryMark)
        glamKeepsake.set(glamEntryPalette.glamAvantInkStyle, forKey: MuzoiGlamKeepsakeKey.glamCurrentSignature)
        glamKeepsake.set(glamEntryPalette.glamArtfulFaceMorph, forKey: MuzoiGlamKeepsakeKey.glamCurrentMailbox)
        glamKeepsake.set(glamEntryPalette.glamBeautyRadianceNet, forKey: MuzoiGlamKeepsakeKey.glamCurrentToken)
        MuzoiGlamPigmentCourier.glamAccessUsenow = glamEntryPalette.glamBeautyRadianceNet
    }

    private func glamTextValue(_ glamValue: Any?) -> String? {
        if let glamText = glamValue as? String {
            let glamTrimmedText = glamText.trimmingCharacters(in: .whitespacesAndNewlines)
            if !glamTrimmedText.isEmpty { return glamTrimmedText }
        }
        if let glamNumber = glamValue as? NSNumber { return glamNumber.stringValue }
        return nil
    }
}

enum MuzoiGlamEntryDetour: LocalizedError {
    case glamUnreadableReply
    case glamServiceUnavailable

    var errorDescription: String? {
        switch self {
        case .glamUnreadableReply:
            return MuzoiGlamVeil("UZnXaCbVlBeN MtAoS DrFeGaHdJ KaLcQcWoEuRnTtY UdIeOtPaZiXlCsV.B NPMlAeSaDsFeG HtJrKyL QaWgEaRiTnY.U")
        case .glamServiceUnavailable:
            return MuzoiGlamVeil("LZoXgCiVnB NsMeArSvDiFcGeH JiKsL QuWnEaRvTaYiUlIaObPlZeX.C VPBlNeMaAsSeD FtGrHyJ KaLgQaWiEnR.T")
        }
    }
}
