//
//  RevenueVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/14/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class RevenueVC: BaseViewController {
    
    @IBOutlet weak var viewEstimate: UIView!
    @IBOutlet weak var viewCalculate: UIView!
    
    @IBOutlet weak var viewA1: UIView!
    @IBOutlet weak var viewA2: UIView!
    @IBOutlet weak var viewA3: UIView!
    @IBOutlet weak var lbA1: UILabel!
    @IBOutlet weak var lbA3: UILabel!
    
    @IBOutlet weak var viewB1: UIView!
    @IBOutlet weak var viewB2: UIView!
    @IBOutlet weak var viewB3: UIView!
    @IBOutlet weak var tfB1: UITextField!
    @IBOutlet weak var lbB3: UILabel!
    @IBOutlet weak var btCalculate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "Revenue")
        setupUI()
        getDataUser()
    }
    
    func setupUI() {
        roundCorner(views: [viewEstimate, viewCalculate], radius: CORNER_VIEW)
        roundCorner(views: [viewA1, viewA2, viewA3, viewB1, viewB2, viewB3], radius: CORNER_VIEW)
        roundCorner(views: [btCalculate], radius: CORNER_BUTTON)
    }
    
    func getDataUser() {
        databaseReference.child("Users").observe(.value, with: { (snapshot) in
            self.startAnimating()
            // TODO: hide spinner here
            if snapshot.exists() {
                self.lbA1.text = "User install: \(snapshot.childrenCount - 3)"
                let revenue = Int64((snapshot.childrenCount - 3) * 17500)
                self.lbA3.text = self.formatCurrencyInt64(revenue)
                self.stopAnimating()
            }
        })
    }
    
    func formatCurrencyInt64(_ money: Int64) -> String {
        let numFormatter = NumberFormatter()
        let CURRENCY_GROUP_SEPARATOR = ","
        let CURRENCY_DECIMAL_SEPARATOR = "."
        numFormatter.numberStyle = .decimal
        numFormatter.groupingSeparator = CURRENCY_GROUP_SEPARATOR
        numFormatter.decimalSeparator = CURRENCY_DECIMAL_SEPARATOR
        
        let text = "Total revenue: \(numFormatter.string(from: NSNumber.init(value: money))!) vnd"
        return text
    }
    
    @IBAction func tapOnCalculate(_ sender: Any) {
        self.view.endEditing(true)
        startAnimating()
        if tfB1.text == "" {
            showToast(message: "Please enter the number of user install app")
            stopAnimating()
        } else {
            let userInstall = Int64(tfB1.text!)!
            let revenue = userInstall * 17500
            lbB3.text = formatCurrencyInt64(revenue)
            stopAnimating()
        }
    }
}
