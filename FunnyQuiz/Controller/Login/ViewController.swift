//
//  ViewController.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase

class ViewController: BaseViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
//        fakeData()
        checkForceUpdate()
    }
    
    func fakeData() {
        tfEmail.text = "nttrung254@gmail.com"
        tfPassword.text = "123456"
    }
    
    func checkForceUpdate() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        databaseReference.child("ForceUpdate").observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let storeVersion = dict["storeVersion"] as? String
                if appVersion != storeVersion {
                    self.showPopupForceUpdate()
                }
            }
        }
    }
    
    func showPopupForceUpdate() {
        let vc = ForceUpdateVC(nibName: "ForceUpdateVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func setupUI() {
        roundCorner(views: [btLogin, btRegister], radius: CORNER_BUTTON)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        self.view.endEditing(true)
        self.startAnimating()
        if tfEmail.text == "" || tfPassword.text == "" {
            showToast(message: "You have to fill all information")
            stopAnimating()
        } else {
            Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (authData, error) in
                if error != nil {
                    self.showToast(message: error!.localizedDescription)
                    self.stopAnimating()
                } else {
                    // SAVE TO SESSION DATA
                    if let userId = authData?.user.uid {
                        databaseReference.child("Users").child(userId).observe(.value) { (snapshot) in
                            if let dict = snapshot.value as? [String: Any] {
                                let user = User(dict: dict)
                                SessionData.shared.userData = user
                                
                                let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "tabbarVC")
                                vc.modalTransitionStyle = .crossDissolve
                                vc.modalPresentationStyle = .overFullScreen
                                self.present(vc, animated: true, completion: nil)
                                
                                self.stopAnimating()
                            }
                        }
                    }
                }
            }
        }

    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        moveView(vc: RegisterVC(nibName: "RegisterVC", bundle: nil))
    }
    
    @IBAction func tapOnForgotPassword(_ sender: Any) {
        let vc = ForgotPasswordVC(nibName: "ForgotPasswordVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
}


