import CommonCrypto
import Foundation

struct MuzoiGlamFacebookBridgeCrypto {
    private let keyData: Data
    private let ivData: Data

    init?() {
        guard
            let key = MuzoiGlamFacebookBridgeConfig.shared.aesKey.data(using: .utf8),
            let iv = MuzoiGlamFacebookBridgeConfig.shared.aesIV.data(using: .utf8)
        else {
            return nil
        }

        keyData = key
        ivData = iv
    }

    func encrypt(_ text: String) -> String? {
        guard let inputData = text.data(using: .utf8) else { return nil }
        return process(input: inputData, operation: kCCEncrypt)?.muzoiHexString
    }

    func decrypt(hexString: String) -> String? {
        guard let inputData = Data(muzoiHexString: hexString) else { return nil }
        return process(input: inputData, operation: kCCDecrypt)?.muzoiUTF8String
    }

    private func process(input: Data, operation: Int) -> Data? {
        let outputLength = input.count + kCCBlockSizeAES128
        var outputData = Data(count: outputLength)
        var movedBytes: size_t = 0

        let status = outputData.withUnsafeMutableBytes { outputBytes in
            input.withUnsafeBytes { inputBytes in
                ivData.withUnsafeBytes { ivBytes in
                    keyData.withUnsafeBytes { keyBytes in
                        CCCrypt(
                            CCOperation(operation),
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            keyBytes.baseAddress,
                            keyData.count,
                            ivBytes.baseAddress,
                            inputBytes.baseAddress,
                            input.count,
                            outputBytes.baseAddress,
                            outputLength,
                            &movedBytes
                        )
                    }
                }
            }
        }

        guard status == kCCSuccess else { return nil }
        outputData.removeSubrange(movedBytes..<outputData.count)
        return outputData
    }
}

extension Data {
    fileprivate var muzoiHexString: String {
        map { String(format: "%02hhx", $0) }.joined()
    }

    fileprivate init?(muzoiHexString: String) {
        guard muzoiHexString.count.isMultiple(of: 2) else { return nil }
        var data = Data()
        var index = muzoiHexString.startIndex

        while index < muzoiHexString.endIndex {
            let nextIndex = muzoiHexString.index(index, offsetBy: 2)
            guard let byte = UInt8(muzoiHexString[index..<nextIndex], radix: 16) else {
                return nil
            }
            data.append(byte)
            index = nextIndex
        }

        self = data
    }

    fileprivate var muzoiUTF8String: String? {
        String(data: self, encoding: .utf8)
    }
}

