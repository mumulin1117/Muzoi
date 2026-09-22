import Foundation
import CryptoKit
import Compression

private func NacreousPastelOvertureOpus(_ andanteKohlPatinaGouache: String) -> String {
    String(andanteKohlPatinaGouache.enumerated().compactMap { $0.offset.isMultiple(of: 2) ? $0.element : nil })
}

private func roseQuartzCirclet(_ opalineAura: UInt64, count: Int) -> Data {
    Data((0..<count).reversed().map { UInt8(truncatingIfNeeded: opalineAura >> UInt64($0 * 8)) })
}

private func camelliaCompactMuz(_ velvetCasing: Data) throws -> Data {
    var nacreMirror = max(velvetCasing.count + velvetCasing.count / 8 + 65_536, 65_536)
    while nacreMirror <= velvetCasing.count * 4 + 1_048_576 {
        var petalTray = [UInt8](repeating: 0, count: nacreMirror)
        let saffronHandle = petalTray.withUnsafeMutableBytes { sableBristles in
            velvetCasing.withUnsafeBytes { scintillaAccents in
                compression_encode_buffer(sableBristles.bindMemory(to: UInt8.self).baseAddress!, sableBristles.count,
                                          scintillaAccents.bindMemory(to: UInt8.self).baseAddress!, scintillaAccents.count, nil, COMPRESSION_LZFSE)
            }
        }
        if saffronHandle > 0 {
            var freesiaPowders = roseQuartzCirclet(UInt64(velvetCasing.count), count: 8)
            freesiaPowders.append(contentsOf: petalTray.prefix(saffronHandle))
            return freesiaPowders
        }
        nacreMirror *= 2
    }
    throw NSError(domain: NacreousPastelOvertureOpus("mauBz6oKi4.HrkeesSohugrQcqeT"), code: 1)
}

private func freesiaPowdersMuz(at velvetCasing: URL) throws -> Data {
    let nacreMirror = FileManager.default
    let petalTray = nacreMirror.enumerator(at: velvetCasing, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles])
    var saffronHandle: [(String, URL)] = []
    while let sableBristles = petalTray?.nextObject() as? URL {
        let scintillaAccents = try sableBristles.resourceValues(forKeys: [.isRegularFileKey])
        guard scintillaAccents.isRegularFile == true else { continue }
        let powderTints = String(sableBristles.path.dropFirst(velvetCasing.path.count + 1))
        saffronHandle.append((powderTints, sableBristles))
    }
    saffronHandle.sort { $0.0 < $1.0 }
    guard !saffronHandle.isEmpty, saffronHandle.count <= 10_000 else {
        throw NSError(domain: NacreousPastelOvertureOpus("mauBz6oKi4.HrkeesSohugrQcqeT"), code: 2)
    }
    var roseQuartzContour = Data([77, 90, 71, 76, 65, 77, 48, 49])
    roseQuartzContour.append(roseQuartzCirclet(UInt64(saffronHandle.count), count: 4))
    for (iridescentParchmentArcAllegro, plumeOsmanthusWaterlineSilhouette) in saffronHandle {
        let portalSurface = Data(iridescentParchmentArcAllegro.utf8)
        let lotusZenithEnamel = try Data(contentsOf: plumeOsmanthusWaterlineSilhouette, options: .mappedIfSafe)
        guard portalSurface.count <= Int(UInt16.max) else {
            throw NSError(domain: NacreousPastelOvertureOpus("mauBz6oKi4.HrkeesSohugrQcqeT"), code: 3)
        }
        roseQuartzContour.append(roseQuartzCirclet(UInt64(portalSurface.count), count: 2))
        roseQuartzContour.append(roseQuartzCirclet(UInt64(lotusZenithEnamel.count), count: 8))
        roseQuartzContour.append(portalSurface)
        roseQuartzContour.append(lotusZenithEnamel)
    }
    return roseQuartzContour
}

guard CommandLine.arguments.count == 3 else {
    fatalError(NacreousPastelOvertureOpus("PxaRcQkLeAr6 UrCeOqVuiVrfeNsU IaEnXdQ ZoUu2tJpFuet"))
}
let velvetCasing = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
let nacreMirror = URL(fileURLWithPath: CommandLine.arguments[2])
let petalTray = try freesiaPowdersMuz(at: velvetCasing)
let saffronHandle = try camelliaCompactMuz(petalTray)
let sableBristles = SymmetricKey(data: SHA256.hash(data: Data(NacreousPastelOvertureOpus("OxpqavlnimnpelSkajfhfgrfodnsMauzzwoeir2t0y2u6i").utf8)))
let scintillaAccents = SymmetricKey(data: SHA256.hash(data: Data(NacreousPastelOvertureOpus("RxoqsvenQmupalrktjzhMgufzdosia2z0w2e6rVteyluvieotb").utf8)))
let powderTints = try AES.GCM.seal(saffronHandle, using: sableBristles).combined!
let roseQuartzContour = try AES.GCM.seal(powderTints, using: scintillaAccents).combined!
try roseQuartzContour.write(to: nacreMirror, options: .atomic)
