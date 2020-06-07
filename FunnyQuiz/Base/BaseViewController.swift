//
//  BaseViewController.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController: UIViewController {
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func setupNavigationController(titleName: String) {
        self.title = titleName
        
        let imgButton = UIImage(named: "ic_back")!
        let backButton = UIBarButtonItem(image: imgButton, style: .plain, target: self, action: #selector(backView))
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func moveView(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func changeBackgroundColor(views: [UIView], color : UIColor) {
        views.forEach { (view) in
            view.backgroundColor = color
        }
    }
    
    func roundCorner(views: [UIView], radius: CGFloat) {
        views.forEach { (view) in
            view.layer.masksToBounds = true
            view.layer.cornerRadius = radius
        }
    }
    
    func addBorder(views: [UIView], width: CGFloat, color: CGColor) {
        views.forEach { (view) in
            view.layer.borderWidth = width
            view.layer.borderColor = color
        }
    }
    
//    func showToast(message: String, duration: Double = 3) {
//        var style = ToastStyle()
//        style.backgroundColor = #colorLiteral(red: 0, green: 0.4980392157, blue: 0.6470588235, alpha: 1)
//        style.messageColor = .white
//        style.messageFont = UIFont.boldSystemFont(ofSize: 16)
//        self.view.makeToast(message, duration: duration, position: .bottom, style: style)
//    }
    
    func addShadow(views: [UIView]) {
        views.forEach { (view) in
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            view.layer.shadowColor = #colorLiteral(red: 0, green: 0.003921568627, blue: 0.007843137255, alpha: 1)
            view.clipsToBounds = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        let touch: UITouch? = touches.first
        if touch?.view?.tag == 10 {
            dismiss(animated: true, completion: nil)
        }
    }
}