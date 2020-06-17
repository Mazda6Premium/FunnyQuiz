//
//  ForceUpdateVC.swift
//  TEE8ACADEMY
//
//  Created by Nguyễn Thành Trung on 5/1/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class ForceUpdateVC: BaseViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var btnUpdate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        roundCorner(views: [viewPopup], radius: CORNER_VIEW)
        roundCorner(views: [btnUpdate], radius: CORNER_BUTTON)
    }
    
    @IBAction func tapOnUpdate(_ sender: Any) {
        if let url = URL(string: "https://itunes.apple.com/in/app/your-appName/id1519059192") {
            if #available(iOS 10.0, *) {
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
             } else {
                 // Earlier versions
                 if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.openURL(url)
                 }
             }
        }
    }
}
