//
//  PlayingQuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import SDWebImage

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
    var totalQuestion: Float = 0
    
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
                
        btCheck.alpha = 0.6
        btCheck.isUserInteractionEnabled = false
        viewA.backgroundColor = SUBMAIN_COLOR
        viewB.backgroundColor = SUBMAIN_COLOR
        viewC.backgroundColor = SUBMAIN_COLOR
        viewD.backgroundColor = SUBMAIN_COLOR
        
        self.progressView.progress = Float(self.index + 1) / self.totalQuestion

    }
    
    func setupUI() {
        roundCorner(views: [viewA, viewB, viewC, viewD], radius: CORNER_VIEW)
        roundCorner(views: [viewQuestion], radius: 70)
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
        
        databaseReference.child("Quiz").child(category).observe(.value, with: { (snapshot) in
            // TODO: hide spinner here
            if snapshot.exists() {
                self.totalQuestion =  Float(snapshot.childrenCount)
                self.progressView.progress = Float(self.index + 1) / self.totalQuestion
            }
        })
        
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
    
    @IBAction func tapOnCheck(_ sender: Any) {
        if answer == arrayQuiz[index].answer {
            showSuccessPopup {
                self.index += 1
                if self.index <= self.arrayQuiz.count - 1 {
                    self.nextQuestion = {
                        self.bindData(arrayQuiz: self.arrayQuiz)
                    }
                } else {
                    self.showCompletePopup(category: self.category)
                }
            }
        } else {
            showFailPopup()
        }
    }
}
