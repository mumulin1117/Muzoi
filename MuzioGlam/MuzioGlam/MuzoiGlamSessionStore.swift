import Foundation

struct MuzoiGlamProfile: Codable {
    let glamIdentity: String
    let glamEmail: String
    let glamSecret: String
    let glamToken: String
}

final class MuzoiGlamSessionStore {
    static let glamShared = MuzoiGlamSessionStore()

    private enum MuzoiGlamVaultKey {
        static let glamProfiles = "muzoiGlamProfiles"
        static let glamSignedIn = "muzoiLoggedIn"
        static let glamCurrentIdentity = "muzoiCurrentUserID"
        static let glamCurrentEmail = "muzoiCurrentEmail"
        static let glamCurrentToken = "muzoi_UserKey"
        static let glamEULAAccepted = "muzoiEULAAccepted"
    }

    private let glamVault = UserDefaults.standard

    private init() {
        glamSeedReviewProfileIfNeeded()
    }

    var glamIsSignedIn: Bool {
        glamVault.bool(forKey: MuzoiGlamVaultKey.glamSignedIn)
    }

    var glamCurrentIdentity: String? {
        glamVault.string(forKey: MuzoiGlamVaultKey.glamCurrentIdentity)
    }

    var glamCurrentEmail: String? {
        glamVault.string(forKey: MuzoiGlamVaultKey.glamCurrentEmail)
    }

    var glamHasAcceptedEULA: Bool {
        get { glamVault.bool(forKey: MuzoiGlamVaultKey.glamEULAAccepted) }
        set { glamVault.set(newValue, forKey: MuzoiGlamVaultKey.glamEULAAccepted) }
    }

    func glamAuthenticate(
        glamEmail: String,
        glamSecret: String,
        glamCompletion: @escaping (Result<MuzoiGlamProfile, MuzoiGlamAuthFault>) -> Void
    ) {
        let glamNormalizedEmail = glamEmail.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.55) { [weak self] in
            guard let self else { return }
            var glamProfiles = self.glamStoredProfiles()

            if let glamExisting = glamProfiles[glamNormalizedEmail], glamExisting.glamSecret != glamSecret {
                DispatchQueue.main.async { glamCompletion(.failure(.glamSecretMismatch)) }
                return
            }

            let glamProfile: MuzoiGlamProfile
            if let glamExisting = glamProfiles[glamNormalizedEmail] {
                glamProfile = glamExisting
            } else {
                glamProfile = MuzoiGlamProfile(
                    glamIdentity: UUID().uuidString,
                    glamEmail: glamNormalizedEmail,
                    glamSecret: glamSecret,
                    glamToken: UUID().uuidString.replacingOccurrences(of: "-", with: "")
                )
                glamProfiles[glamNormalizedEmail] = glamProfile
                self.glamPersistProfiles(glamProfiles)
            }

            self.glamVault.set(true, forKey: MuzoiGlamVaultKey.glamSignedIn)
            self.glamVault.set(glamProfile.glamIdentity, forKey: MuzoiGlamVaultKey.glamCurrentIdentity)
            self.glamVault.set(glamProfile.glamEmail, forKey: MuzoiGlamVaultKey.glamCurrentEmail)
            self.glamVault.set(glamProfile.glamToken, forKey: MuzoiGlamVaultKey.glamCurrentToken)
            DispatchQueue.main.async { glamCompletion(.success(glamProfile)) }
        }
    }

    func glamSignOut() {
        glamVault.set(false, forKey: MuzoiGlamVaultKey.glamSignedIn)
    }

    private func glamSeedReviewProfileIfNeeded() {
        var glamProfiles = glamStoredProfiles()
        let glamReviewEmail = "muzoi@gmail.com"
        guard glamProfiles[glamReviewEmail] == nil else { return }

        glamProfiles[glamReviewEmail] = MuzoiGlamProfile(
            glamIdentity: "muzoi-review-profile",
            glamEmail: glamReviewEmail,
            glamSecret: "111111",
            glamToken: "muzoi-review-token"
        )
        glamPersistProfiles(glamProfiles)
    }

    private func glamStoredProfiles() -> [String: MuzoiGlamProfile] {
        guard
            let glamData = glamVault.data(forKey: MuzoiGlamVaultKey.glamProfiles),
            let glamProfiles = try? JSONDecoder().decode([String: MuzoiGlamProfile].self, from: glamData)
        else {
            return [:]
        }
        return glamProfiles
    }

    private func glamPersistProfiles(_ glamProfiles: [String: MuzoiGlamProfile]) {
        guard let glamData = try? JSONEncoder().encode(glamProfiles) else { return }
        glamVault.set(glamData, forKey: MuzoiGlamVaultKey.glamProfiles)
    }
}

enum MuzoiGlamAuthFault: LocalizedError {
    case glamSecretMismatch

    var errorDescription: String? {
        switch self {
        case .glamSecretMismatch:
            return "The password does not match this account."
        }
    }
}
