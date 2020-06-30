//
//  ShoppingVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/25/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import StoreKit
import Firebase

protocol ShoppingVCDelegate {
    func buyQuizzesSuccess()
}

class ShoppingVC: BaseViewController {
    
    @IBOutlet weak var viewApp: UIView!
    @IBOutlet weak var btBuyNow: UIButton!
    
    var myProduct: SKProduct?
    var delegate: ShoppingVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchProducts()
    }
    
    func setupView() {
        roundCorner(views: [viewApp], radius: CORNER_VIEW)
        roundCorner(views: [btBuyNow], radius: CORNER_BUTTON)
        setupNavigationController(titleName: "Shopping")
    }
    
    func fetchProducts() {
        // Fighting.FunnyQuiz.BuyQuizzes
        let request = SKProductsRequest(productIdentifiers: ["Fighting.FunnyQuiz.BuyQuizzes"])
        request.delegate = self
        request.start()
    }
    
    @IBAction func tapOnBuy(_ sender: Any) {
        DispatchQueue.main.async {
            self.startAnimating()
        }
        
        guard let myProduct = self.myProduct else {return}
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
    }
}

extension ShoppingVC: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            myProduct = product
            print(product.productIdentifier)
            print(product.priceLocale)
            print(product.price)
            print(product.localizedTitle)
            print(product.localizedDescription)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for tran in transactions {
            switch tran.transactionState {
            case .purchasing:
                break
                
            case .purchased:
                // SAVE IN USERDEFAULTS
                userDefaults.set(true, forKey: KEY_BUY_QUIZZES)
                
                // SAVE IN DATABASE
                databaseReference.child("BuyInApp").childByAutoId().setValue(["buyInApp": true])
                
                delegate?.buyQuizzesSuccess()
                
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                DispatchQueue.main.async {
                    self.stopAnimating()
                }
                break
                
            case .restored:
                // SAVE IN USERDEFAULTS
                userDefaults.set(true, forKey: KEY_BUY_QUIZZES)
                
                delegate?.buyQuizzesSuccess()
                
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                DispatchQueue.main.async {
                    self.stopAnimating()
                }
                break
                
            case .failed, .deferred:
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                DispatchQueue.main.async {
                    self.stopAnimating()
                }
                break
                
            default:
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                DispatchQueue.main.async {
                    self.stopAnimating()
                }
                break
            }
        }
    }
}

