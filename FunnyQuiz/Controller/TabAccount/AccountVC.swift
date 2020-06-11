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
    
    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var viewC: UIView!
    @IBOutlet weak var viewD: UIView!
    @IBOutlet weak var viewE: UIView!
    @IBOutlet weak var viewF: UIView!
    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var imgD: UIImageView!
    @IBOutlet weak var imgE: UIImageView!
    @IBOutlet weak var imgF: UIImageView!
    
    @IBOutlet weak var lbA: UILabel!
    @IBOutlet weak var lbB: UILabel!
    @IBOutlet weak var lbC: UILabel!
    @IBOutlet weak var lbD: UILabel!
    @IBOutlet weak var lbE: UILabel!
    @IBOutlet weak var lbF: UILabel!
    
    var arrayMenu = [Menu]()
    var admin = false
    
    var arrayAdmin = [Menu(title: "Quiz", image: "admin"),
                        Menu(title: "Pair", image: "achievement"),
                        Menu(title: "User", image: "rating"),
                        Menu(title: "Revenue", image: "mail"),
                        Menu(title: "Rating", image: "changepw"),
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
    }
    
    func setupUI() {
        roundCorner(views: [viewA, viewB, viewC, viewD, viewE, viewF], radius: CORNER_VIEW)
        
        // CHECK ID LOGIN
        if let currentUserId = Auth.auth().currentUser?.uid {
            if currentUserId == ADMIN_ID {
                arrayMenu = arrayAdmin
                admin = true
            } else {
                arrayMenu = arrayUser
                admin = false
            }
            
            imgA.image = UIImage(named: arrayMenu[0].image)
            imgB.image = UIImage(named: arrayMenu[1].image)
            imgC.image = UIImage(named: arrayMenu[2].image)
            imgD.image = UIImage(named: arrayMenu[3].image)
            imgE.image = UIImage(named: arrayMenu[4].image)
            imgF.image = UIImage(named: arrayMenu[5].image)
            
            lbA.text = arrayMenu[0].title
            lbB.text = arrayMenu[1].title
            lbC.text = arrayMenu[2].title
            lbD.text = arrayMenu[3].title
            lbE.text = arrayMenu[4].title
            lbF.text = arrayMenu[5].title
            
        }
        
        let tapA = UITapGestureRecognizer(target: self, action: #selector(tapViewA))
        viewA.addGestureRecognizer(tapA)
        let tapB = UITapGestureRecognizer(target: self, action: #selector(tapViewB))
        viewB.addGestureRecognizer(tapB)
        let tapC = UITapGestureRecognizer(target: self, action: #selector(tapViewC))
        viewC.addGestureRecognizer(tapC)
        let tapD = UITapGestureRecognizer(target: self, action: #selector(tapViewD))
        viewD.addGestureRecognizer(tapD)
        let tapE = UITapGestureRecognizer(target: self, action: #selector(tapViewE))
        viewE.addGestureRecognizer(tapE)
        let tapF = UITapGestureRecognizer(target: self, action: #selector(tapViewF))
        viewF.addGestureRecognizer(tapF)
    }
    
    @objc func tapViewA() {
        UIView.animate(withDuration: 0.3) {
            self.viewA.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewA.alpha = 1
            }
        }
        
        if admin {
            let vc = NewQuizVC(nibName: "NewQuizVC", bundle: nil)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            
        }
    }
    
    @objc func tapViewB() {
        UIView.animate(withDuration: 0.3) {
            self.viewB.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewB.alpha = 1
            }
        }
    }
    
    @objc func tapViewC() {
        UIView.animate(withDuration: 0.3) {
            self.viewC.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewC.alpha = 1
            }
        }
    }
    
    @objc func tapViewD() {
        UIView.animate(withDuration: 0.3) {
            self.viewD.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewD.alpha = 1
            }
        }
    }
    
    @objc func tapViewE() {
        UIView.animate(withDuration: 0.3) {
            self.viewE.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewE.alpha = 1
            }
        }
    }
    
    @objc func tapViewF() {
        UIView.animate(withDuration: 0.3) {
            self.viewF.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewF.alpha = 1
            }
        }
    }
}

