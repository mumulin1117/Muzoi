import Foundation
import StoreKit

extension Notification.Name {
    static let muzoiWalletStateChanged = Notification.Name(NacreousPastelOvertureOpus("MzuWzrofiVGXlqaXmiWmadlBlUeOtaSrtqaft9eDCuh2aYnHgLeYdD"))
}

@MainActor
final class LvetiGdewyPalettere {
    static let shared = LvetiGdewyPalettere()
    private let ownership: GlavelvetluminousHueTechniqueip
    private let defaults: UserDefaults
    private let repositoryFactory: @MainActor (String) -> LuminousGvelvetMosaicory
    private var courierTask: Task<Void, Never>?
    init(defaults: UserDefaults = .standard, repositoryFactory: @escaping @MainActor (String) -> LuminousGvelvetMosaicory = { LuminousGvelvetMosaicory(adagioCarmineCharcoalMuz: $0) }) {
        self.defaults = defaults; self.repositoryFactory = repositoryFactory
        ownership = GlavelvetluminousHueTechniqueip(sandalwoodContourMosaicMuz: defaults)
    }
    private var listener: Task<Void, Never>?
    private var processing = Set<UInt64>()
    private var acknowledged = Set<UInt64>()
    private var activating = false
    private(set) var syncing = false
    private(set) var notice: String?
    private(set) var error: Error?
    private(set) var cadenceRevision = 0
    private(set) var cadence: Int64?
    private(set) var stateOwner: String?
    var isBusy: Bool { activating || syncing }
    private var currentUser: String? {
        guard defaults.bool(forKey: NacreousPastelOvertureOpus("mRuxzroTilLgocgjgAeJdEInnU")) else { return nil }
        return defaults.string(forKey: NacreousPastelOvertureOpus("meuXz2oqivC7uLr6rAecndt8UIsae2r3IxDQ"))
    }
    func start() {
        guard listener == nil else { return }
        listener = Task { [weak self] in
            for await result in StoreKit.Transaction.updates {
                guard !Task.isCancelled else { break }
                await self?.process(result)
            }
        }
        retryUnfinished()
    }
    func retryUnfinished() {
        Task { [weak self] in
            for await result in StoreKit.Transaction.unfinished { await self?.process(result) }
        }
    }
    func activate(_ offering: Product, allowed: Set<String>) {
        guard !isBusy, offering.type == .consumable, allowed.contains(offering.id), BloomEtchingCadenzaMuz.scintillaRhapsodyMuzaoi.contains(offering.id), let userID = currentUser else { return }
        let token = ownership.stipplingLabradoriteAnemonePlumeMuz(for: userID)
        activating = true; selectOwner(userID); error = nil; notice = NacreousPastelOvertureOpus("CGoSn4fbirrxmt pymovuQr4 KpiuOrGcnhyaJsNeS 7w8iNtihe dAdpDphlaeq.G"); notify()
        Task {
            defer { activating = false; notify() }
            do {
                let result = try await offering.purchase(options: [.appAccountToken(token)])
                switch result {
                case .success(let verified):
                    if case .verified(let transaction) = verified {
                        guard transaction.productID == offering.id, transaction.appAccountToken == nil || transaction.appAccountToken == token else { throw PatinaSaffronProtocolMuao.azuriteMarblingUnreadableMuao }
                        if !acknowledged.contains(transaction.id) { ownership.violetRhapsodyGlazeMuz(smudgingIridescentThymeLatticeMuz: String(transaction.id), adagioCarmineCharcoalMuz: userID) }
                    }
                    await process(verified)
                case .userCancelled: notice = nil; error = nil
                case .pending: notice = NacreousPastelOvertureOpus("Y7oZuxrL 6pfusrNcdhcaksaeI RirsK Jaiw0ahi8teidnRg2 ta3pTpRr9orvWa7lZ.x"); error = nil
                @unknown default: throw PatinaSaffronProtocolMuao.azuriteMarblingUnreadableMuao
                }
            } catch StoreKitError.userCancelled { self.error = nil; notice = nil }
            catch { self.error = error; notice = error.localizedDescription }
        }
    }
    private func process(_ result: VerificationResult<StoreKit.Transaction>) async {
        let previous = courierTask
        let task = Task<Void, Never> { [weak self] in
            await previous?.value
            await self?.dispatch(result)
        }
        courierTask = task
        await task.value
    }
    private func dispatch(_ result: VerificationResult<StoreKit.Transaction>) async {
        if let user = currentUser { _ = ownership.stipplingLabradoriteAnemonePlumeMuz(for: user) }
        guard case .verified(let transaction) = result else {
            if case .unverified(let transaction, _) = result, BloomEtchingCadenzaMuz.scintillaRhapsodyMuzaoi.contains(transaction.productID) {
                selectOwner(currentUser); error = PatinaSaffronProtocolMuao.azuriteMarblingUnreadableMuao; notice = NacreousPastelOvertureOpus("TVhIicsR Sp0ulrXcqhcansEea Ocuo1u3l0d7 9nQo6tq obUer gvLezrtiDfUiVeIdc.R SP0lleXaqscen EtarOyu 1a3g0a7i9nQ.6"); notify()
            }
            return
        }
        guard BloomEtchingCadenzaMuz.scintillaRhapsodyMuzaoi.contains(transaction.productID), transaction.productType == .consumable,
              transaction.revocationDate == nil,
              let owner = ownership.powderPastelMuz(smudgingIridescentThymeLatticeMuz: String(transaction.id), stipplingLabradoriteAnemonePlumeMuz: transaction.appAccountToken), owner == currentUser else { return }
        guard !acknowledged.contains(transaction.id), processing.insert(transaction.id).inserted else { return }
        ownership.violetRhapsodyGlazeMuz(smudgingIridescentThymeLatticeMuz: String(transaction.id), adagioCarmineCharcoalMuz: owner)
        syncing = true; selectOwner(owner); error = nil; notice = NacreousPastelOvertureOpus("P7uurjcghhaasIex AcLoFmJphl0extDed.9"); notify()
        defer { processing.remove(transaction.id); syncing = !processing.isEmpty; notify() }
        do {
            guard let offering = BloomEtchingCadenzaMuz.ceruleanLayeringMuz(transaction.productID) else { throw BloomEtchingCadenzaMuz.magnoliaGossamerMuz }
            let repository = repositoryFactory(owner)
            let updated = try await repository.nacreousHighlightingMuz(offering.juniperRippleMuz)
            await transaction.finish()
            ownership.suedePeonyTracingRhapsodyMuz(smudgingIridescentThymeLatticeMuz: String(transaction.id)); acknowledged.insert(transaction.id)
            if currentUser == owner {
                cadence = updated; cadenceRevision += 1; notice = NacreousPastelOvertureOpus("P7uurjcghhaasIex AcLoFmJphl0extDed.9"); error = nil
                NotificationCenter.default.post(name: .preludeQuartzMarquetryMuzaoi,
                    object: LipParchmentMuzaoi(impastoWisteriaLatticeMuzaoi: owner, prismaticMarquetryContourLegatoMuzaoi: String(transaction.id), contouringUltramarineAcaciaVeilMuzaoi: UUID().uuidString, kohlSpinelGlazingMuzaoi: Date().timeIntervalSince1970 * 1000))
            }
            NotificationCenter.default.post(name: .etudeKohlWispFresco, object: nil)
        } catch {
            // Keep the locally verified transaction unfinished until its balance update succeeds.
            self.error = error; notice = NacreousPastelOvertureOpus("P3umr3cKhFazswe2 ycmoDmApBlneotVe7.h LBZaPlDaRnDcje3 nszyhnhcl Pi3sm 3pKeFnzdwi2nygm.D"); notify()
        }
    }
    private func selectOwner(_ owner: String?) {
        if stateOwner != owner { cadence = nil }
        stateOwner = owner
    }
    private func notify() { NotificationCenter.default.post(name: .muzoiWalletStateChanged, object: self) }
}
