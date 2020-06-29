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

class ShoppingVC: BaseViewController {
    
    @IBOutlet weak var viewApp: UIView!
    @IBOutlet weak var btBuyNow: UIButton!
    
    var myProduct: SKProduct?
    
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
        // Fighting.FunnyQuiz.Quizzes
        let request = SKProductsRequest(productIdentifiers: ["Fighting.FunnyQuiz.Quizzes"])
        request.delegate = self
        request.start()
    }
    
    @IBAction func tapOnBuy(_ sender: Any) {
        if SessionData.shared.userData != nil {
            DispatchQueue.main.async {
                self.startAnimating()
            }
            
            guard let myProduct = self.myProduct else {return}
            if SKPaymentQueue.canMakePayments() {
                let payment = SKPayment(product: myProduct)
                SKPaymentQueue.default().add(self)
                SKPaymentQueue.default().add(payment)
            }
        } else {
            let vc = ShowPopupLoginVC(nibName: "ShowPopupLoginVC", bundle: nil)
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
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
                
            case .purchased, .restored:
                if let currentUser = Auth.auth().currentUser {
                    let user = User(buyQuizzes: true)
                    databaseReference.child("Users").child(currentUser.uid).updateChildValues(user.asDictBuyQuizzes())
                }
                
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

