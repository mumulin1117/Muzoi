import StoreKit
import UIKit

final class MuzoiGlamFacebookBridgePurchase: NSObject {
    static let shared = MuzoiGlamFacebookBridgePurchase()

    var transactionID: String?
    private var purchaseCompletion: ((Result<Void, Error>) -> Void)?
    private var productRequest: SKProductsRequest?
    private var receiptRefreshRequest: SKReceiptRefreshRequest?
    private var receiptRefreshCompletion: ((Result<Data, Error>) -> Void)?

    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func startPurchase(productID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [
                NSLocalizedDescriptionKey: MuzoiGlamFacebookBridgeConstants.paymentDisabledTitle
            ])))
            return
        }

        transactionID = nil
        purchaseCompletion = completion
        productRequest?.cancel()

        let request = SKProductsRequest(productIdentifiers: [productID])
        request.delegate = self
        productRequest = request
        request.start()
    }

    func obtainLocalReceipt() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else { return nil }
        guard let receiptData = try? Data(contentsOf: url), !receiptData.isEmpty else { return nil }
        return receiptData
    }

    private func refreshReceiptIfNeeded(completion: @escaping (Result<Data, Error>) -> Void) {
        if let receipt = obtainLocalReceipt() {
            completion(.success(receipt))
            return
        }

        receiptRefreshRequest?.cancel()
        receiptRefreshCompletion = completion
        let request = SKReceiptRefreshRequest(receiptProperties: nil)
        request.delegate = self
        receiptRefreshRequest = request
        request.start()
    }
}

extension MuzoiGlamFacebookBridgePurchase: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let product = response.products.first else {
            purchaseCompletion?(.failure(NSError(domain: "", code: -2, userInfo: [
                NSLocalizedDescriptionKey: MuzoiGlamFacebookBridgeConstants.invalidProductTitle
            ])))
            purchaseCompletion = nil
            return
        }

        productRequest = nil
        SKPaymentQueue.default().add(SKPayment(product: product))
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        if request === receiptRefreshRequest {
            receiptRefreshCompletion?(.failure(error))
            receiptRefreshCompletion = nil
            receiptRefreshRequest = nil
            return
        }

        purchaseCompletion?(.failure(error))
        purchaseCompletion = nil
        productRequest = nil
    }

    func requestDidFinish(_ request: SKRequest) {
        guard request === receiptRefreshRequest else { return }
        if let receiptData = obtainLocalReceipt() {
            receiptRefreshCompletion?(.success(receiptData))
        } else {
            receiptRefreshCompletion?(.failure(NSError(domain: "", code: -4, userInfo: [
                NSLocalizedDescriptionKey: MuzoiGlamFacebookBridgeConstants.purchaseFailureTitle
            ])))
        }
        receiptRefreshCompletion = nil
        receiptRefreshRequest = nil
    }
}

extension MuzoiGlamFacebookBridgePurchase: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                transactionID = transaction.transactionIdentifier
                refreshReceiptIfNeeded { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            SKPaymentQueue.default().finishTransaction(transaction)
                            self.purchaseCompletion?(.success(()))
                        case .failure(let error):
                            self.purchaseCompletion?(.failure(error))
                        }
                        self.purchaseCompletion = nil
                    }
                }
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                let error = (transaction.error as? SKError)?.code == .paymentCancelled
                    ? NSError(domain: "", code: -999, userInfo: [
                        NSLocalizedDescriptionKey: MuzoiGlamFacebookBridgeConstants.cancelPaymentTitle
                    ])
                    : (transaction.error ?? NSError(domain: "", code: -3, userInfo: [
                        NSLocalizedDescriptionKey: MuzoiGlamFacebookBridgeConstants.paymentFailedTitle
                    ]))
                DispatchQueue.main.async {
                    self.purchaseCompletion?(.failure(error))
                    self.purchaseCompletion = nil
                }
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
}

