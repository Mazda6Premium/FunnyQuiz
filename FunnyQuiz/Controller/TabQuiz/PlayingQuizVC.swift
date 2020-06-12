//
//  PlayingQuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftEntryKit

class PlayingQuizVC: BaseViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lbNumberQuestion: UILabel!
    @IBOutlet weak var viewQuestion: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var viewC: UIView!
    @IBOutlet weak var viewD: UIView!
    @IBOutlet weak var btCheck: UIButton!
    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var imgD: UIImageView!
    
    @IBOutlet weak var topConstr: NSLayoutConstraint!
    
    var category = ""
    var arrayQuiz = [Quiz]()
    var index = 0
    var answer = 0
    
    var lblDescription = ""
    var titlePopUp = ""
    var imagePopUp = ""
    var nameButton = ""
    var backgroundColor : UIColor!
    var descriptionColor : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        setupNavigationController(titleName: category)
        getQuizData { (arrayQuiz) in
            self.bindData(arrayQuiz: arrayQuiz)
        }
    }
    
    func checkScreenType() {
        switch UIDevice.current.screenType {
        case .iPhones_X_XS: // done
            topConstr.constant = 30
        case .iPhone_11Pro: // done
            topConstr.constant = 30
        case .iPhone_XSMax_ProMax: // done
            topConstr.constant = 110
        case .iPhone_XR_11: // done
            topConstr.constant = 110
        default: // plus 
            topConstr.constant = 20
        }
    }
    
    func bindData(arrayQuiz: [Quiz]) {
        let quiz = arrayQuiz[index]
        lbQuestion.text = quiz.question
        lbNumberQuestion.text = "\(index + 1)/\(arrayQuiz.count)"
        if let url1 = URL(string: quiz.img1) {
            imgA.sd_setImage(with: url1, completed: nil)
        }
        if let url2 = URL(string: quiz.img2) {
            imgB.sd_setImage(with: url2, completed: nil)
        }
        if let url3 = URL(string: quiz.img3) {
            imgC.sd_setImage(with: url3, completed: nil)
        }
        if let url4 = URL(string: quiz.img4) {
            imgD.sd_setImage(with: url4, completed: nil)
        }
        
        progressView.progress = Float((index + 1) / arrayQuiz.count)
    }
    
    func setupUI() {
        roundCorner(views: [viewA, viewB, viewC, viewD], radius: CORNER_VIEW)
        roundCorner(views: [btCheck], radius: CORNER_BUTTON)
        btCheck.alpha = 0.6
        btCheck.isUserInteractionEnabled = false
        checkScreenType()
        
        let tapA = UITapGestureRecognizer(target: self, action: #selector(tapViewA))
        viewA.addGestureRecognizer(tapA)
        let tapB = UITapGestureRecognizer(target: self, action: #selector(tapViewB))
        viewB.addGestureRecognizer(tapB)
        let tapC = UITapGestureRecognizer(target: self, action: #selector(tapViewC))
        viewC.addGestureRecognizer(tapC)
        let tapD = UITapGestureRecognizer(target: self, action: #selector(tapViewD))
        viewD.addGestureRecognizer(tapD)
    }
    
    func getQuizData(completion: ((_ arrayQuiz: [Quiz]) -> Void)? = nil) {
        startAnimating()
        databaseReference.child("Quiz").child(category).observe(.childAdded) { (data) in
            databaseReference.child("Quiz").child(self.category).child(data.key).observe(.value) { (snapshot) in
                if let dict = snapshot.value as? [String: Any] {
                    let quiz = Quiz(fromDict: dict)
                    self.arrayQuiz.append(quiz)
                    completion?(self.arrayQuiz)
                    self.stopAnimating()
                }
            }
        }
    }
    
    @objc func tapViewA() {
        answer = 1
        setColor(chooseView: viewA, otherViews: [viewB, viewC, viewD])
        
    }
    
    @objc func tapViewB() {
        answer = 2
        setColor(chooseView: viewB, otherViews: [viewA, viewC, viewD])
    }
    
    @objc func tapViewC() {
        answer = 3
        setColor(chooseView: viewC, otherViews: [viewB, viewA, viewD])
    }
    
    @objc func tapViewD() {
        answer = 4
        setColor(chooseView: viewD, otherViews: [viewB, viewC, viewA])
    }
    
    func setColor(chooseView: UIView, otherViews: [UIView]) {
        btCheck.alpha = 1
        btCheck.isUserInteractionEnabled = true
        chooseView.backgroundColor = CHOOSE_COLOR
        otherViews.forEach { (otherView) in
            otherView.backgroundColor = SUBMAIN_COLOR
        }
        
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
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
            
            font: UIFont(name: "AvenirNext-Regular", size: 30)!,
            color: .init(.black),
            alignment: .center,
            displayMode: .light,
            numberOfLines: 1
            
        )
        
        let title = EKProperty.LabelContent(text: titlePopUp, style: titleStyle)
        
        let descriptonStyle =  EKProperty.LabelStyle(
            
            font: UIFont(name: "AvenirNext-DemiBold", size: 18)!,
            color: .init(descriptionColor),
            alignment: .center,
            displayMode: .light,
            numberOfLines: 2
            
        )
        
        let description = EKProperty.LabelContent(text: lblDescription, style: descriptonStyle)
        
        let titleButton = EKProperty.LabelContent(
            
            text: nameButton,
            style: .init(font: UIFont(name: "AvenirNext-DemiBold", size: 17)!,
                         color: .white,
                         alignment: .center,
                         displayMode: .light,
                         numberOfLines: 1)
            
        )
        
        let image = EKProperty.ImageContent(
            
            imageName: imagePopUp,
            animation: .none,
            displayMode: .light,
            size: CGSize(width: 75, height: 75),
            contentMode: .scaleAspectFill,
            tint: .black,
            makesRound: true,
            accessibilityIdentifier: .none
            
        )
        
        let themeImage = EKPopUpMessage.ThemeImage(image: image, position: .topToTop(offset: 30))
        
        let button = EKProperty.ButtonContent(
            
            label: titleButton,
            backgroundColor: .init(.orange),
            highlightedBackgroundColor: .clear
            
        )
        
        let popUpMessage = EKPopUpMessage(themeImage: themeImage, title: title, description: description, button: button) {
            
            SwiftEntryKit.dismiss()
      
        }
        
        let popUpView = EKPopUpMessageView(with: popUpMessage)
        SwiftEntryKit.display(entry: popUpView, using: attributes)
    }
    
    @IBAction func tapOnCheck(_ sender: Any) {
        
        lblDescription = "Bạn chưa trả lời đúng.Thử thêm lần nữa nào."
        titlePopUp = "Cố gắng lên."
        imagePopUp = "logo"
        backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        descriptionColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameButton = "Thử lại"
        
        setUpPopView()
    }
}
