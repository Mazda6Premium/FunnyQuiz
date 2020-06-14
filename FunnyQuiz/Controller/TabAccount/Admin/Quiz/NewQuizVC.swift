//
//  NewQuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Firebase
import ActionSheetPicker_3_0

class NewQuizVC: BaseViewController {
    
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var tfQuestion: UITextField!
    @IBOutlet weak var tfIndex: UITextField!
    @IBOutlet weak var tfAnswer: UITextField!
    @IBOutlet weak var btPost: UIButton!
    
    @IBOutlet weak var tfImg1: UITextField!
    @IBOutlet weak var tfImg2: UITextField!
    @IBOutlet weak var tfImg3: UITextField!
    @IBOutlet weak var tfImg4: UITextField!
    
    var indexQuestion = 0
    var timer = Timer()
    
    var arrayCategory = ["Animal", "Job", "Sport", "Vehicle", "Weapon", "Camping", "Kid", "Science", "Cinema", "School", "Restaurant", "Social Media"]
    var arrayImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "Quiz")
        setupUI()
    }
    
    func randomAnswer() {
        let randomNum = Int.random(in: 1..<5)
        tfAnswer.text = "\(randomNum)"
    }
    
    func randomImage() {
        randomAnswer()
        let imageQuiz = AnimalQuiz()
        self.arrayImage = imageQuiz.arrayImage
        
        // RANDOM WITHOUT DUPLICATE NUMBER
        let randomNumber = RandomNumber()
        let numbers = randomNumber.generateNumbers(repetitions: 3, maxValue: arrayImage.count - 1)
        
        // ASSIGN ANSWER
        if tfQuestion.text == "" {
            showToast(message: "Please enter question")
            stopAnimating()
        } else {
            if tfAnswer.text == "1" {
                if let indexObject = self.arrayImage.firstIndex(where: {$0.contains(tfQuestion.text!.lowercased().replacingOccurrences(of: " ", with: "%20"))}) {
                    tfImg1.text = arrayImage[indexObject]
                }
                tfImg2.text = arrayImage[numbers[0]]
                tfImg3.text = arrayImage[numbers[1]]
                tfImg4.text = arrayImage[numbers[2]]
                
            } else if tfAnswer.text == "2" {
                if let indexObject = self.arrayImage.firstIndex(where: {$0.contains(tfQuestion.text!.lowercased().replacingOccurrences(of: " ", with: "%20"))}) {
                    tfImg2.text = arrayImage[indexObject]

                }
                tfImg1.text = arrayImage[numbers[0]]
                tfImg3.text = arrayImage[numbers[1]]
                tfImg4.text = arrayImage[numbers[2]]
                
            } else if tfAnswer.text == "3" {
                if let indexObject = self.arrayImage.firstIndex(where: {$0.contains(tfQuestion.text!.lowercased().replacingOccurrences(of: " ", with: "%20"))}) {
                    tfImg3.text = arrayImage[indexObject]
                }
                tfImg1.text = arrayImage[numbers[0]]
                tfImg2.text = arrayImage[numbers[1]]
                tfImg4.text = arrayImage[numbers[2]]
                
            } else {
                if let indexObject = self.arrayImage.firstIndex(where: {$0.contains(tfQuestion.text!.lowercased().replacingOccurrences(of: " ", with: "%20"))}) {
                    tfImg4.text = arrayImage[indexObject]
                }
                
                tfImg1.text = arrayImage[numbers[0]]
                tfImg2.text = arrayImage[numbers[1]]
                tfImg3.text = arrayImage[numbers[2]]
            }
        }
        
    }
    
    func setupUI() {
        tfCategory.delegate = self
        roundCorner(views: [btPost], radius: CORNER_BUTTON)
        tfIndex.delegate = self
    }
    
    @IBAction func tapOnPost(_ sender: Any) {
        self.view.endEditing(true)
        startAnimating()
        randomImage()
        if tfIndex.text == "" {
            indexQuestion += 1
            tfIndex.text = "\(indexQuestion)"
        }
        
        if tfCategory.text == "" || tfQuestion.text == "" || tfIndex.text == "" || tfAnswer.text == "" || tfImg1.text == "" || tfImg2.text == "" || tfImg3.text == "" || tfImg4.text == "" {
            showToast(message: "Please enter all information")
            stopAnimating()
        } else {
            let quiz = Quiz(category: self.tfCategory.text!, question: self.tfQuestion.text!, index: Int(self.tfIndex.text!)!, answer: Int(self.tfAnswer.text!)!, img1: tfImg1.text!, img2: tfImg2.text!, img3: tfImg3.text!, img4: tfImg4.text!)
             let key = databaseReference.childByAutoId().key!
             databaseReference.child("Quiz").child(self.tfCategory.text!).child(key).setValue(quiz.asDict())
             
             self.showToast(message: "Post successfully")
             self.stopAnimating()
             timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.clearData), userInfo: nil, repeats: true)
        }
    }
    
    @objc func clearData() {
        tfQuestion.text = ""
        tfIndex.text = ""
        tfAnswer.text = ""
        
        tfImg1.text = ""
        tfImg2.text = ""
        tfImg3.text = ""
        tfImg4.text = ""
        
        timer.invalidate()
    }
}

extension NewQuizVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfCategory {
            ActionSheetStringPicker(title: "Choose category", rows: arrayCategory, initialSelection: 0, doneBlock: { (picker, index, value) in
                if let category = value as? String {
                    self.tfCategory.text = category
                }
            }, cancel: nil, origin: tfCategory).show()
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == tfIndex {
            self.indexQuestion = Int(tfIndex.text!)!
        }
    }
}

