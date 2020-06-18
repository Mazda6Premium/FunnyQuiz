//
//  ForgotPasswordVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/18/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: BaseViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btSend: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        roundCorner(views: [viewPopup], radius: CORNER_VIEW)
        roundCorner(views: [btSend], radius: CORNER_BUTTON)
    }
    
    @IBAction func tapOnSend(_ sender: Any) {
        if tfEmail.text == "" {
            showToast(message: "Please enter your email")
        } else {
            Auth.auth().sendPasswordReset(withEmail: "nttrung254@gmail.com") { (error) in
                if error != nil {
                    self.showToast(message: error!.localizedDescription)
                } else {
                    self.tfEmail.text = ""
                    self.showToast(message: "Email has sent. Please check your email address")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

