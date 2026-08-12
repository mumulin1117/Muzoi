import Foundation

enum MuzoibrowLaminateVeil {
    static func glamRevealStroke(_ glamVeiledStroke: String) -> String {
        var glamPlainScalars = String.UnicodeScalarView()
        glamPlainScalars.reserveCapacity(glamVeiledStroke.unicodeScalars.count / 2 + 1)

        var glamShouldKeep = true
        for glamScalar in glamVeiledStroke.unicodeScalars {
            if glamShouldKeep {
                glamPlainScalars.append(glamScalar)
            }
            glamShouldKeep.toggle()
        }

        return String(glamPlainScalars)
    }
}

@inline(__always)
func MuzoiGlamVeil(_ glamVeiledStroke: String) -> String {
    MuzoibrowLaminateVeil.glamRevealStroke(glamVeiledStroke)
}
