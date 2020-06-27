//
//  ShowPopupLoginVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/27/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class ShowPopupLoginVC: BaseViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var btLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        roundCorner(views: [viewPopup], radius: CORNER_VIEW)
        roundCorner(views: [btLogin], radius: CORNER_BUTTON)
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        gotoMainScreen()
    }
    
    func gotoMainScreen() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "naviVC")
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
}
