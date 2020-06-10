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
    
    var arrayAdmin = [Menu(title: "Admin Dashboard", image: "admin"),
                        Menu(title: "Achievement", image: "achievement"),
                        Menu(title: "Rating FunnyQuiz", image: "rating"),
                        Menu(title: "Feedback", image: "mail"),
                        Menu(title: "Change password", image: "changepw"),
                        Menu(title: "Log out", image: "logout")]
    
    var arrayUser = [Menu(title: "Achievement", image: "achievement"),
                        Menu(title: "Rating FunnyQuiz", image: "rating"),
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
            } else {
                arrayMenu = arrayUser
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
    }
    
    

}

