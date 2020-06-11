//
//  AccountVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/10/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import FirebaseAuth

struct Menu {
    var title = ""
    var image = ""
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class AccountVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var arrayMenu = [Menu]()
    var admin = false
    
    var arrayAdmin = [Menu(title: "Quiz", image: "quiz"),
                        Menu(title: "Pair", image: "pair"),
                        Menu(title: "User", image: "user"),
                        Menu(title: "Revenue", image: "money"),
                        Menu(title: "Rating", image: "rating"),
                        Menu(title: "Log out", image: "logout")]
    
    var arrayUser = [Menu(title: "Achievement", image: "achievement"),
                        Menu(title: "Rating", image: "rating"),
                        Menu(title: "Feedback", image: "mail"),
                        Menu(title: "Other app", image: "app"),
                        Menu(title: "Change password", image: "changepw"),
                        Menu(title: "Log out", image: "logout")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
    }
    
    func setupUI() {
        
        // CHECK ID LOGIN
        if let currentUserId = Auth.auth().currentUser?.uid {
            if currentUserId == ADMIN_ID {
                arrayMenu = arrayAdmin
                admin = true
                collectionView.reloadData()
            } else {
                arrayMenu = arrayUser
                admin = false
                collectionView.reloadData()
            }
        }
    }
    
    func setupCollectionView() {
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         
         let nib = UINib(nibName: "QuizColCell", bundle: nil)
         collectionView.register(nib, forCellWithReuseIdentifier: "quizColCell")
     }
}

extension AccountVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizColCell", for: indexPath) as! QuizColCell
        let menu = arrayMenu[indexPath.row]
        cell.lbQuizMenu.text = menu.title
        cell.imgQuizMenu.image = UIImage(named: menu.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 30) / 2
        
        return CGSize(width: size, height: size)
    }
}


