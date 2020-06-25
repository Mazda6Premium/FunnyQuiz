//
//  QuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/10/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase

struct QuizMenu {
    var category = ""
    var image = ""
    
    init(category: String, image: String) {
        self.category = category
        self.image = image
    }
}

class QuizVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayQuizMenu = [QuizMenu(category: "Animal", image: "ic_animal"),
                         QuizMenu(category: "Job", image: "ic_job"),
                         QuizMenu(category: "Sport", image: "ic_sport"),
                         QuizMenu(category: "Vehicle", image: "ic_vehicle"),
                         QuizMenu(category: "Weapon", image: "ic_weapon"),
                         QuizMenu(category: "Camping", image: "ic_camping"),
                         QuizMenu(category: "Kid", image: "ic_kid"),
                         QuizMenu(category: "Science", image: "ic_science"),
                         QuizMenu(category: "Cinema", image: "ic_cinema"),
                         QuizMenu(category: "School", image: "ic_school"),
                         QuizMenu(category: "Restaurant", image: "ic_restaurant"),
                         QuizMenu(category: "Social Media", image: "ic_socialmedia")]
    
    var userData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
        getDataBuyQuiz()
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
                    self.userData = user
                    self.collectionView.reloadData()
                    self.stopAnimating()
                }
            }
        }
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
        
        if let user = userData {
            if !user.buyQuizzes {
                switch indexPath.row {
                case 0, 1:
                    cell.viewDim.isHidden = true
                    cell.viewShopping.isHidden = true
                default:
                    cell.viewDim.isHidden = false
                    cell.viewShopping.isHidden = false
                }
            } else {
                cell.viewDim.isHidden = true
                cell.viewShopping.isHidden = true
            }
        }
        
        cell.viewShopping.tag = indexPath.row
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapOnShopping))
        cell.viewShopping.addGestureRecognizer(tapGes)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 30) / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let user = userData {
            if !user.buyQuizzes {
                switch indexPath.row {
                case 0, 1:
                    let vc = PlayingQuizVC(nibName: "PlayingQuizVC", bundle: nil)
                    vc.category = arrayQuizMenu[indexPath.row].category
                    vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: true)
                default:
                    let vc = ShoppingVC(nibName: "ShoppingVC", bundle: nil)
                    vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let vc = PlayingQuizVC(nibName: "PlayingQuizVC", bundle: nil)
                vc.category = arrayQuizMenu[indexPath.row].category
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc func tapOnShopping() {
        let vc = ShoppingVC(nibName: "ShoppingVC", bundle: nil)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
