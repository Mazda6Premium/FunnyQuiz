//
//  QuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/10/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import StoreKit
import Firebase

struct QuizMenu {
    var category = ""
    var image = ""
    var isBuy = true
    
    init(category: String, image: String, isBuy: Bool) {
        self.category = category
        self.image = image
        self.isBuy = isBuy
    }
}

class QuizVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayQuizMenu = [QuizMenu(category: "Animal", image: "ic_animal", isBuy: true),
                         QuizMenu(category: "Job", image: "ic_job", isBuy: true),
                         QuizMenu(category: "Sport", image: "ic_sport", isBuy: true),
                         QuizMenu(category: "Vehicle", image: "ic_vehicle", isBuy: true),
                         QuizMenu(category: "Weapon", image: "ic_weapon", isBuy: true),
                         QuizMenu(category: "Camping", image: "ic_camping", isBuy: true),
                         QuizMenu(category: "Kid", image: "ic_kid", isBuy: true),
                         QuizMenu(category: "Science", image: "ic_science", isBuy: true),
                         QuizMenu(category: "Cinema", image: "ic_cinema", isBuy: true),
                         QuizMenu(category: "School", image: "ic_school", isBuy: true),
                         QuizMenu(category: "Restaurant", image: "ic_restaurant", isBuy: true),
                         QuizMenu(category: "Social Media", image: "ic_socialmedia", isBuy: true)]
    
    var arrayQuizzes = [Quizzes]()
    var myProduct: SKProduct?
    
    var itemQuizCategory = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
        getDataBuyQuiz()
        fetchProducts()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let nib = UINib(nibName: "QuizColCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "quizColCell")
    }
    
    func getDataBuyQuiz() {
        startAnimating()
        if let user = Auth.auth().currentUser {
            databaseReference.child("Users").child(user.uid).observe(.value) { (snapshot) in
                if let dict = snapshot.value as? [String: Any] {
                    let user = User(dict: dict)
                    self.arrayQuizzes = user.quizzes
                    
                    // SO SANH 2 ARRAY
                    self.arrayQuizzes.forEach { (data) in
                        if let indexObject = self.arrayQuizMenu.firstIndex(where: {$0.category == data.category}) {
                            self.arrayQuizMenu[indexObject].isBuy = false
                        }
                    }
                    
                    self.collectionView.reloadData()
                    self.stopAnimating()
                }
            }
        }
    }
    
    func fetchProducts() {
        // Fighting.FunnyQuiz.BuyQuiz
        let request = SKProductsRequest(productIdentifiers: ["Fighting.FunnyQuiz.BuyQuiz"])
        request.delegate = self
        request.start()
    }
}

extension QuizVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayQuizMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizColCell", for: indexPath) as! QuizColCell
        let menu = arrayQuizMenu[indexPath.row]
        cell.lbQuizMenu.text = menu.category
        cell.imgQuizMenu.image = UIImage(named: menu.image)
        
        cell.viewDim.isHidden = !menu.isBuy
        cell.btPrice.isHidden = !menu.isBuy
        
        cell.btPrice.tag = indexPath.row
        cell.btPrice.addTarget(self, action: #selector(tapOnBuyQuiz), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 30) / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = arrayQuizMenu[indexPath.row]
        if !menu.isBuy && !menu.isBuy {
            let vc = PlayingQuizVC(nibName: "PlayingQuizVC", bundle: nil)
            vc.category = arrayQuizMenu[indexPath.row].category
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func tapOnBuyQuiz(sender: UIButton) {
        DispatchQueue.main.async {
            self.startAnimating()
        }
        
        itemQuizCategory = arrayQuizMenu[sender.tag].category
        
        guard let myProduct = self.myProduct else {return}
        
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            stopAnimating()
        }
    }
}

extension QuizVC: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
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
                let newItem = Quizzes(category: itemQuizCategory)
                self.arrayQuizzes.append(newItem)
                if let currentUser = Auth.auth().currentUser {
                    let user = User(quizzes: arrayQuizzes)
                    databaseReference.child("Users").child(currentUser.uid).updateChildValues(user.asDictQuizzes())
                }
                
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                
                break
                
            case .failed, .deferred:
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                
                break
            
            default:
                SKPaymentQueue.default().finishTransaction(tran)
                SKPaymentQueue.default().remove(self)
                
                break
            }
        }
    }
}
