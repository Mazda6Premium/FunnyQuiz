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
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var viewC: UIView!
    @IBOutlet weak var viewD: UIView!
    @IBOutlet weak var btCheck: UIButton!
    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var imgD: UIImageView!
    
    var category = ""
    var arrayQuiz = [Quiz]()
    var index = 0
    var answer = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupNavigationController(titleName: category)
        getQuizData { (arrayQuiz) in
            self.bindData(arrayQuiz: arrayQuiz)
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
    }

}
