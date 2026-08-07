import Foundation

enum MuzoiGlamPortalRoute: String {
    case glamSparkExpert = "pages/AIexpert/index?"
    case glamMuseArchive = "pages/repository/index?current="
    case glamAromaDetail = "pages/AromatherapyDetails/index?dynamicId="
    case glamMomentDetail = "pages/DynamicDetails/index?dynamicId="
    case glamStoryDetail = "pages/VideoDetails/index?dynamicId="
    case glamPublishMoment = "pages/issue/index?"
    case glamPublishShowcase = "pages/postVideos/index?"
    case glamProfileDetail = "pages/homepage/index?userId="
    case glamReportForm = "pages/report/index?"
    case glamProfileEditor = "pages/information/index?"
    case glamMuseEditor = "pages/EditData/index?"
    case glamAudienceList = "pages/attentionList/index?type="
    case glamRadianceReserve = "pages/wallet/index?"
    case glamSettings = "pages/SetUp/index?"
    case glamTerms = "pages/Agreement/index?type=1"
    case glamPrivacy = "pages/Agreement/index?type=2"
    case glamPrivateCanvas = "pages/privateChat/index?userId="
    case glamRoot = ""

    static var glamSessionToken: String? {
        get {
            UserDefaults.standard.string(forKey: "muzoi_UserKey")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "muzoi_UserKey")
        }
    }

    func glamComposeAddress(glamQuery: String) -> String {
        let glamGateway = "http://x7k9m2q8v4n6r1t5z3p0.shop/#"
        guard self != .glamRoot else { return glamGateway }

        let glamToken = Self.glamSessionToken ?? ""
        let glamApplicationKey = "93219714"
        return String(
            format: "%@%@%@&token=%@&appID=%@",
            glamGateway,
            rawValue,
            glamQuery,
            glamToken,
            glamApplicationKey
        )
    }
}
