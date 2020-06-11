//
//  QuizVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/10/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

struct QuizMenu {
    var title = ""
    var image = ""
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class QuizVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayQuizMenu = [QuizMenu(title: "Animal", image: "ic_animal"),
                         QuizMenu(title: "Job", image: "ic_job"),
                         QuizMenu(title: "Sport", image: "ic_sport"),
                         QuizMenu(title: "Vehicle", image: "ic_vehicle"),
                         QuizMenu(title: "Weapon", image: "ic_weapon"),
                         QuizMenu(title: "Camping", image: "ic_camping"),
                         QuizMenu(title: "Kid", image: "ic_kid"),
                         QuizMenu(title: "Science", image: "ic_science"),
                         QuizMenu(title: "Cinema", image: "ic_cinema"),
                         QuizMenu(title: "School", image: "ic_school"),
                         QuizMenu(title: "Restaurant", image: "ic_restaurant"),
                         QuizMenu(title: "Social Media", image: "ic_socialmedia")]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let nib = UINib(nibName: "QuizColCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "quizColCell")
    }
}

extension QuizVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayQuizMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizColCell", for: indexPath) as! QuizColCell
        let menu = arrayQuizMenu[indexPath.row]
        cell.lbQuizMenu.text = menu.title
        cell.imgQuizMenu.image = UIImage(named: menu.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 30) / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PlayingQuizVC(nibName: "PlayingQuizVC", bundle: nil)
        vc.category = arrayQuizMenu[indexPath.row].title
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
