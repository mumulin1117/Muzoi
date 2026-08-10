import Foundation

enum MuzoiGlamScenePassage {
    case glamSparkStudio
    case glamTechniqueArchive
    case glamAromaCanvas
    case glamMomentCanvas
    case glamMotionCanvas
    case glamComposeMoment
    case glamComposeShowcase
    case glamMuseCanvas
    case glamFlagCanvas
    case glamInboxCanvas
    case glamEditCanvas
    case glamAudienceCanvas
    case glamRadianceCanvas
    case glamSettingsCanvas
    case glamTermsCanvas
    case glamPrivacyCanvas
    case glamWhisperCanvas
    case glamGatewayRoot

    func glamTraceAddress(glamTrailMark: String) -> String {
        let glamPassagePaint = MuzoiGlamPassageRoutebook.glamPaint(for: self)
        guard glamPassagePaint.needsEtching else {
            return MuzoiGlamPassageAtelier.glowPrismGate
        }

        return MuzoiGlamPassageEtching(
            glamPaint: glamPassagePaint,
            glamTrailMark: glamTrailMark,
            glamRibbon: MuzoiGlamPigmentCourier.glamAccessUsenow ?? ""
        ).glamFinishedAddress
    }
}

private struct MuzoiGlamPassagePaint {
    let glamSceneMark: String
    let needsEtching: Bool
}

private struct MuzoiGlamPassageEtching {
    let glamPaint: MuzoiGlamPassagePaint
    let glamTrailMark: String
    let glamRibbon: String

    var glamFinishedAddress: String {
        String(
            format: MuzoiGlamPassageAtelier.glowEtchingPattern,
            MuzoiGlamPassageAtelier.glowPrismGate,
            glamPaint.glamSceneMark,
            glamTrailMark,
            glamRibbon,
            MuzoiGlamPassageAtelier.glowAtelierSeal
        )
    }
}

private enum MuzoiGlamPassageAtelier {
    static let glowPrismGate = MuzoiGlamVeil("hFtXtmpE:0/q/4xh7Ukw9Vmi27qL8dv746nC6HrS1ZtV5Iz33wp00M.TsghGojpD/G#U")
    static let glowAtelierSeal = MuzoiGlamVeil("9l3Y2D179L7B1E4B")
    static let glowEtchingPattern = MuzoiGlamVeil("%4@e%0@e%h@Z&stxoOkjeRnG=D%I@r&caWpTpVIfDd=l%r@M")
}

private enum MuzoiGlamPassageRoutebook {
    static func glamPaint(for glamPassage: MuzoiGlamScenePassage) -> MuzoiGlamPassagePaint {
        if glamPassage == .glamGatewayRoot {
            return MuzoiGlamPassagePaint(glamSceneMark: "", needsEtching: false)
        }

        return MuzoiGlamPassagePaint(
            glamSceneMark: glamRouteMarks[glamPassage] ?? "",
            needsEtching: true
        )
    }

    private static let glamRouteMarks: [MuzoiGlamScenePassage: String] = [
        .glamSparkStudio: MuzoiGlamVeil("pgaNgfeWsu/AAjIweBxcpPexrctN/tiJnVdxe7xB?Q"),
        .glamTechniqueArchive: MuzoiGlamVeil("pJaYgTeYsb/0rQe8p3oessi0tgohrMy4/aiDnrdVeBx5?gc5u5rbrselnstY=o"),
        .glamAromaCanvas: MuzoiGlamVeil("praCg6eGs2/zA0rKo9mxaRtHhVefr8aopKyFDMeQtWa6ifljsY/SiXn2dxeUxe?FdByEnuapmUi0cRIzdN=D"),
        .glamMomentCanvas: MuzoiGlamVeil("piaRggemsW/tDjyEneabmMi2ctD0eityaZiClLsp/1iLnvd7eAxB?bdsyHnmalmhiLcVICdq=k"),
        .glamMotionCanvas: MuzoiGlamVeil("pQaggxersj/WVHipdXejouDMeAtaaXi6lDs9/aiCnXdBeWx9?2dQyGnFaAmpiBc0I0dm=O"),
        .glamComposeMoment: MuzoiGlamVeil("pRaUgleOsu/4irsIssure5/RiKn3dweHxH?O"),
        .glamComposeShowcase: MuzoiGlamVeil("pOapgxegsB/QpFoSsStIVCicdOedohsB/diknYdneTxK?6"),
        .glamMuseCanvas: MuzoiGlamVeil("pVaNgZeysn/Qhlo2mQebppang8er/Hi9nadjevxA?vuvsmesrIImd8=f"),
        .glamFlagCanvas: MuzoiGlamVeil("piaQgmeysy/4rQedpoo7rPtC/Sihncdbeoxy?X"),
        .glamInboxCanvas: MuzoiGlamVeil("ptaagyeAsW/PiJnzfaosrGmtaTt4ipognJ/DiUnodBePxT?a"),
        .glamEditCanvas: MuzoiGlamVeil("pjaxgzefs1/kEMdGiJtCDrawtxa9/ziQnmdVelxM?B"),
        .glamAudienceCanvas: MuzoiGlamVeil("pfang7eWsJ/AahtBtTe0ndtTigoqnKLtiusktp/liVn3dWeExC?ktAyGpceR=s"),
        .glamRadianceCanvas: MuzoiGlamVeil("pVa4gTeiso/WwOaIlzlveQtc/aiPnrdEeYxf?s"),
        .glamSettingsCanvas: MuzoiGlamVeil("pLa8gVeAsb/qSMeztxUOpq/QiUnBdke8xr?I"),
        .glamTermsCanvas: MuzoiGlamVeil("pWa9gjeKsm/HAagDrvene7m5eOn5tN/fiZn0dcerx2?htUyHpMe3=o1U"),
        .glamPrivacyCanvas: MuzoiGlamVeil("pba4gkehs6/ZAugarcelegm6eYnvtL/fipnidieCx4?rtuyHpfeX=c2r"),
        .glamWhisperCanvas: MuzoiGlamVeil("pJa6gJepsr/xpSr2iEvlaxtueBCihCa2tF/bixn8dCeIxH?ouwsAehrhIxdL=x")
    ]
}
