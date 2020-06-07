//
//  ViewController.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        moveView(vc: RegisterVC(nibName: "RegisterVC", bundle: nil))
    }
    
    @IBAction func tapOnForgotPassword(_ sender: Any) {
    }
}

