//
//  RegisterVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: BaseViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var btRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "Register")
        setupUI()
    }
    
    func setupUI() {
        roundCorner(views: [btRegister], radius: CORNER_BUTTON)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        view.endEditing(true)
        self.startAnimating()
        if tfEmail.text == "" || tfPassword.text == "" || tfConfirmPassword.text == "" {
            showToast(message: "You have to fill all information")
            stopAnimating()
        } else {
            if !tfEmail.text!.isValidEmail {
                tfEmail.textColor = .red
                showToast(message: "Invalid email format")
                stopAnimating()
            } else {
                if tfPassword.text!.count > 6 {
                    tfPassword.textColor = .red
                    showToast(message: "Password must be at least 6 characters")
                    stopAnimating()
                } else {
                    if tfPassword.text != tfConfirmPassword.text {
                        tfConfirmPassword.textColor = .red
                        showToast(message: "Confirm password not match")
                        stopAnimating()
                    } else {
                        self.registerUser(email: tfEmail.text!, password: tfPassword.text!)
                    }
                }
            }
        }
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                self.showToast(message: "Something went wrong, please try again later")
                self.stopAnimating()
            } else {
                if let id = authData?.user.uid {
                    let user = User(email: email, id: id, password: password)
                    databaseReference.child("Users").child(id).setValue(user.asDictionary())
                    self.stopAnimating()
                    self.showToast(message: "Register account successfully")
                    _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.gotoMainScreen), userInfo: nil, repeats: true)
                } else {
                    self.showToast(message: "Something went wrong, please try again later")
                    self.stopAnimating()
                }
            }
        }
    }
    
    @objc func gotoMainScreen() {
        let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "tabbarVC")
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
