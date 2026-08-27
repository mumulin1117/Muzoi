import UIKit

final class MuzoiGlamFacebookLoginParameterKeys: NSObject {
    let deviceID: String

    let password: String

    init(deviceID: String,  password: String) {
        self.deviceID = deviceID
      
        self.password = password
    }
}

final class MuzoiGlamFacebookReceiptParameterKeys: NSObject {
    let payload: String
    let transactionID: String
    let callbackResult: String

    init(payload: String, transactionID: String, callbackResult: String) {
        self.payload = payload
        self.transactionID = transactionID
        self.callbackResult = callbackResult
    }
}

final class MuzoiGlamFacebookBridgeConfig: NSObject {
    static let shared = MuzoiGlamFacebookBridgeConfig()

    var isDebugMode = true

    var productionBaseURL = "https://opi.38bfw18s.link"
    var productionAppID = "43563487"
    var productionAESKey = "x7spocmvant5j96u"
    var productionAESIV = "kn0jqo9zxpli0set"

    var launchRequestTimeInterval: TimeInterval = 0



 

    var launchBackgroundImage = "MuzoiLaunchBackground"
    var mainBackgroundImage = "MuzoiGlamKeepsakeKey45"
    var loginButtonBackgroundImage = "glamKeepsaker"
    
    var loginButtonWidth: CGFloat = 335
    var loginButtonHeight: CGFloat = 47
   

    var launchDetailPath = "/opi/v1/glamInvalidadianceo"
    var loginPath = "/opi/v1/glamcalarl"
    var reportTimePath = "/opi/v1/glamactionTitlet"
    var verifyReceiptPath = "/opi/v1/glamlashiftnvasp"

    var loginParameterKeys = MuzoiGlamFacebookLoginParameterKeys(
        deviceID: "glamArrivaln",
       
        password: "foilGlimmerEndpointd"
    )

    var reportTimeParameterKey = "glamShouldKeepo"

    var verifyReceiptParameterKeys = MuzoiGlamFacebookReceiptParameterKeys(
        payload: "MuzoiGlamVeilp",
        transactionID: "MuzoiGlamVeilt",
        callbackResult: "MuzoiGlamVeilc"
    )



    var presentHostAppRootHandler: ((UIWindow?) -> Void)?

    var baseURL: String { productionBaseURL }
    var appID: String { isDebugMode ? "44332211" : productionAppID }
    var aesKey: String { isDebugMode ? "518486he8pzgbjsk" : productionAESKey }
    var aesIV: String { isDebugMode ? "614436p28qzhkjsl" : productionAESIV }

    func presentHostAppRoot() {
        presentHostAppRootHandler?(MuzoiGlamFacebookLaunchController.mainWindow)
    }
}

