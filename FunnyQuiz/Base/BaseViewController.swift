//
//  BaseViewController.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import Toast_Swift
import SwiftEntryKit



class BaseViewController: UIViewController {
    
    let viewIndicator = UIView()
    var loadingIndicator: NVActivityIndicatorView?
    
    var lblDescription = ""
    var titlePopUp = ""
    var imagePopUp = ""
    var nameButton = ""
    var backgroundColor : UIColor!
    var descriptionColor : UIColor!
    
    var nextQuestion: (() -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupIndicator()
    }
    
    func setupIndicator() {
        viewIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        roundCorner(views: [viewIndicator], radius: CORNER_VIEW_LOADING)
        view.addSubview(viewIndicator)
        viewIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewIndicator.widthAnchor.constraint(equalToConstant: 60).isActive = true
        viewIndicator.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewIndicator.isHidden = true
        
        let frame = CGRect(x: 15, y: 15, width: 30, height: 30)
        loadingIndicator = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.lineScale, color: .white, padding: 0)
        viewIndicator.addSubview(loadingIndicator!)
    }
    
    func startAnimating() {
        viewIndicator.isHidden = false
        loadingIndicator?.startAnimating()
    }
    
    func stopAnimating() {
        loadingIndicator?.stopAnimating()
        viewIndicator.isHidden = true
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
    
    func showToast(message: String, duration: Double = 3, position: ToastPosition = ToastPosition.bottom) {
        var style = ToastStyle()
        style.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        style.messageColor = .white
        style.messageFont = UIFont.boldSystemFont(ofSize: 16)
        self.view.makeToast(message, duration: duration, position: position, style: style)
    }
    
    func addShadow(views: [UIView]) {
        views.forEach { (view) in
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            view.layer.shadowColor = #colorLiteral(red: 0, green: 0.003921568627, blue: 0.007843137255, alpha: 1)
            view.clipsToBounds = false
        }
    }
    
    func setUpPopView() {
        var attributes = EKAttributes.bottomFloat
        attributes.border = .value(color: .brown, width: 1)
        attributes.roundCorners = .all(radius: 25)
        attributes.displayDuration = .infinity
        attributes.displayMode = .dark
        attributes.entryBackground = .color(color: .init(backgroundColor))
        attributes.screenBackground = .visualEffect(style: .init(light: .extraLight, dark: .dark))
        attributes.position = .bottom
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .disabled
        attributes.entranceAnimation = .init(translate: .init(duration: 0.24), scale: .none, fade: .none)
        attributes.exitAnimation = .init(translate: .init(duration: 0.24), scale: .none, fade: .none)
        attributes.shadow = .active(with: .init(color: .init(.darkGray), opacity: 0.5, radius: 10, offset: CGSize(width: 2, height: 2)))
        
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 0.8)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.offset(value: 20)
        attributes.positionConstraints.maxSize  = .init(width: widthConstraint, height: heightConstraint)
        
        let titleStyle = EKProperty.LabelStyle(
            
            font: UIFont(name: "Quicksand-Bold", size: 24)!,
            color: .init(SUBMAIN_COLOR),
            alignment: .center,
            displayMode: .light,
            numberOfLines: 1
            
        )
        
        let title = EKProperty.LabelContent(text: titlePopUp, style: titleStyle)
        
        let descriptonStyle =  EKProperty.LabelStyle(
            
            font: UIFont(name: "Quicksand-Bold", size: 16)!,
            color: .init(descriptionColor),
            alignment: .center,
            displayMode: .light,
            numberOfLines: 2
            
        )
        
        let description = EKProperty.LabelContent(text: lblDescription, style: descriptonStyle)
        
        let titleButton = EKProperty.LabelContent(
            
            text: nameButton,
            style: .init(font: UIFont(name: "Quicksand-Bold", size: 16)!,
                         color: .white,
                         alignment: .center,
                         displayMode: .light,
                         numberOfLines: 1)
            
        )
        
        let image = EKProperty.ImageContent(
            
            imageName: imagePopUp,
            animation: .none,
            displayMode: .light,
            size: CGSize(width: 80, height: 80),
            contentMode: .scaleAspectFit,
            tint: .black,
            makesRound: true,
            accessibilityIdentifier: .none
            
        )
        
        let themeImage = EKPopUpMessage.ThemeImage(image: image, position: .topToTop(offset: 30))
        
        let button = EKProperty.ButtonContent(
            
            label: titleButton,
            backgroundColor: .init(#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)),
            highlightedBackgroundColor: .clear
            
        )
        
        let popUpMessage = EKPopUpMessage(themeImage: themeImage, title: title, description: description, button: button) {
            if self.titlePopUp == "Congratulations!" {
                SwiftEntryKit.dismiss()
                self.navigationController?.popViewController(animated: true)
            } else if self.titlePopUp == "Correct answer!" {
                self.nextQuestion?()
                SwiftEntryKit.dismiss()
            } else {
                SwiftEntryKit.dismiss()
            }
        }
        
        let popUpView = EKPopUpMessageView(with: popUpMessage)
        SwiftEntryKit.display(entry: popUpView, using: attributes)
    }
    
    func showCompletePopup(category: String)  {
        lblDescription = "You have completed all \(category) quiz"
        titlePopUp = "Congratulations!"
        imagePopUp = "ic_complete"
        backgroundColor = MAIN_COLOR
        descriptionColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameButton = "Finish"
        
        setUpPopView()
    }
    
    func showSuccessPopup(completion: (() -> Void)? = nil)  {
        lblDescription = "Excellent! You choose right"
        titlePopUp = "Correct answer!"
        imagePopUp = "ic_true"
        backgroundColor = MAIN_COLOR
        descriptionColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameButton = "Next question"
        
        setUpPopView()
        completion?()
    }
    
    func showFailPopup() {
        lblDescription = "Keep fighting to get right answer"
        titlePopUp = "Wrong answer!"
        imagePopUp = "ic_false"
        backgroundColor = MAIN_COLOR
        descriptionColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameButton = "Try again"
        
        setUpPopView()
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        let touch: UITouch? = touches.first
        if touch?.view?.tag == 10 {
            dismiss(animated: true, completion: nil)
        }
    }
}
