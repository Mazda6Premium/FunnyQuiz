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
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    var imgPicker1 = UIImagePickerController()
    var imgPicker2 = UIImagePickerController()
    var imgPicker3 = UIImagePickerController()
    var imgPicker4 = UIImagePickerController()
    
    var i1: UIImage?
    var i2: UIImage?
    var i3: UIImage?
    var i4: UIImage?
    
    var arrayCategory = ["Animal", "Job", "Sport", "Vehicle", "Weapon", "Camping", "Kid", "Science", "Cinema", "School", "Restaurant", "Social Media"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "Quiz")
        setupUI()
    }
    
    func setupUI() {
        roundCorner(views: [view1, view2, view3, view4], radius: CORNER_VIEW)
        roundCorner(views: [btPost], radius: CORNER_BUTTON)
        addBorder(views: [view1, view2, view3, view4], width: 2, color: SUBMAIN_COLOR.cgColor)
        
        let tapGes1 = UITapGestureRecognizer(target: self, action: #selector(tapImg1))
        view1.addGestureRecognizer(tapGes1)
        let tapGes2 = UITapGestureRecognizer(target: self, action: #selector(tapImg2))
        view2.addGestureRecognizer(tapGes2)
        let tapGes3 = UITapGestureRecognizer(target: self, action: #selector(tapImg3))
        view3.addGestureRecognizer(tapGes3)
        let tapGes4 = UITapGestureRecognizer(target: self, action: #selector(tapImg4))
        view4.addGestureRecognizer(tapGes4)
        
        tfCategory.delegate = self
    }
    
    func openPhotoLibrary(imagePicker: UIImagePickerController) {
        let photoLibraryAction = UIAlertAction(title: NSLocalizedString("Thư viện Ảnh", comment: ""), style: .default, handler: { _ in
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let takePhotoAction = UIAlertAction(title: NSLocalizedString("Chụp ảnh", comment: ""), style: .default, handler: { _ in
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera;
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Huỷ", comment: ""), style: .cancel, handler: { _ in
        })
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true) { () -> Void in
        }
    }
    
    @objc func tapImg1() {
        openPhotoLibrary(imagePicker: imgPicker1)
    }
    
    @objc func tapImg2() {
        openPhotoLibrary(imagePicker: imgPicker2)
    }
    
    @objc func tapImg3() {
        openPhotoLibrary(imagePicker: imgPicker3)
    }
    
    @objc func tapImg4() {
        openPhotoLibrary(imagePicker: imgPicker4)
    }
    
    @IBAction func tapOnPost(_ sender: Any) {
        self.view.endEditing(true)
        startAnimating()
        if tfCategory.text == "" || tfQuestion.text == "" || tfIndex.text == "" || tfAnswer.text == "" || i1 == nil || i2 == nil || i3 == nil || i4 == nil {
            showToast(message: "Please enter all information")
            stopAnimating()
        } else {
            uploadImage(imgQuiz: i1) { [weak self] (url1) in
                self?.uploadImage(imgQuiz: self?.i2) { [weak self] (url2) in
                    self?.uploadImage(imgQuiz: self?.i3) { [weak self] (url3) in
                        self?.uploadImage(imgQuiz: self?.i4) { [weak self] (url4) in
                            let quiz = Quiz(category: self!.tfCategory.text!, question: self!.tfQuestion.text!, index: Int(self!.tfIndex.text!)!, answer: Int(self!.tfAnswer.text!)!, img1: url1, img2: url2, img3: url3, img4: url4)
                            let key = databaseReference.childByAutoId().key!
                            databaseReference.child("Quiz").child(key).setValue(quiz.asDict())
                            
                            self?.showToast(message: "Post successfully")
                            self?.stopAnimating()
                            _ = Timer.scheduledTimer(timeInterval: 3, target: self!, selector: #selector(self?.clearData), userInfo: nil, repeats: true)
                        }
                    }
                }
            }
        }
    }
    
    @objc func clearData() {
        tfQuestion.text = ""
        tfIndex.text = ""
        tfAnswer.text = ""
        
        i1 = nil
        i2 = nil
        i3 = nil
        i4 = nil
        
        img1.image = UIImage(named: "ic_placeholder")
        img2.image = UIImage(named: "ic_placeholder")
        img3.image = UIImage(named: "ic_placeholder")
        img4.image = UIImage(named: "ic_placeholder")
    }
    
    func uploadImage(imgQuiz: UIImage?, completion: ((_ url: String) -> Void)? = nil) {
        guard let image = imgQuiz, let data = image.jpegData(compressionQuality: 0.5) else {return}
        let imageName = Date().millisecondsSince1970
        let imageStorage = storageReference.child("ImageQuiz").child(tfCategory.text!).child("\(imageName)")
        imageStorage.putData(data, metadata: nil) { (metadata, error) in
            if error != nil {
                self.showToast(message: "Something went wrong, please try again later")
                self.stopAnimating()
                return
            }
            imageStorage.downloadURL(completion: { (url, error) in
                guard let imageUrl = url else {
                    self.showToast(message: "Something went wrong, please try again later")
                    self.stopAnimating()
                    return
                }
                completion?("\(imageUrl)")
            })
        }
    }
    
}

extension NewQuizVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        switch picker {
        case imgPicker1:
            i1 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            img1.image = i1
            
        case imgPicker2:
            i2 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            img2.image = i2
            
        case imgPicker3:
            i3 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            img3.image = i3
            
        case imgPicker4:
            i4 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            img4.image = i4
            
        default:
            break
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension NewQuizVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        ActionSheetStringPicker(title: "Choose category", rows: arrayCategory, initialSelection: 0, doneBlock: { (picker, index, value) in
            if let category = value as? String {
                self.tfCategory.text = category
            }
        }, cancel: nil, origin: tfCategory).show()
        
        return false
    }
}
