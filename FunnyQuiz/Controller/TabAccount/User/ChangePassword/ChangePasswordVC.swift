//
//  ChangePasswordVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/13/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase

protocol ChangePasswordVCDelegate {
    func dismissView()
}

class ChangePasswordVC: BaseViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var tfOldPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmNewPassword: UITextField!
    @IBOutlet weak var btConfirm: UIButton!
    @IBOutlet weak var btCancel: UIButton!
    
    var delegate : ChangePasswordVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        roundCorner(views: [viewPopup], radius: CORNER_VIEW)
        roundCorner(views: [btConfirm, btCancel], radius: CORNER_BUTTON)
    }
    
    @IBAction func tapOnConfirm(_ sender: Any) {
        startAnimating()
        if tfOldPassword.text == "" || tfNewPassword.text == "" || tfConfirmNewPassword.text == "" {
            showToast(message: "Please enter all information")
            stopAnimating()
        } else {
            if let currentUser = Auth.auth().currentUser, let userData = SessionData.shared.userData {
                let password = userData.password
                if tfOldPassword.text == password {
                    if tfNewPassword.text! == tfConfirmNewPassword.text! {
                        currentUser.updatePassword(to: tfNewPassword.text!) { (error) in
                            if error != nil {
                                self.showToast(message: error!.localizedDescription)
                                self.stopAnimating()
                            } else {
                                databaseReference.child("Users").child(userData.id).updateChildValues(["password": self.tfNewPassword.text!])
                                
                                self.showToast(message: "Change password successfully")
                                self.stopAnimating()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    self.delegate?.dismissView()
                                    self.dismiss(animated: true, completion: nil)
                                }
                            }
                        }
                    } else {
                        self.showToast(message: "Confirm new password is not match")
                        stopAnimating()
                    }
                } else {
                    self.showToast(message: "Your old password is incorrect")
                    stopAnimating()
                }
            }
        }
    }
    
    @IBAction func tapOnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.delegate?.dismissView()
    }
}
