//
//  AchievementVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/14/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class AchievementVC: BaseViewController {
    
    @IBOutlet weak var lbNoAchievement: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayAchievement = [Achievement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "Achievement")
        setupTableView()
        getDataAchievement()
    }
    
    func getDataAchievement() {
        if let id = SessionData.shared.userData?.id {
            databaseReference.child("Achievement").child(id).observe(.value) { (data) in
                self.startAnimating()
                if data.exists() {
                    self.lbNoAchievement.isHidden = true
                    self.tableView.isHidden = false
                    databaseReference.child("Achievement").child(id).observe(.childAdded) { (snapshot) in
                        databaseReference.child("Achievement").child(id).child(snapshot.key).observe(.value) { (response) in
                            if let dict = response.value as? [String: Any] {
                                let achievement = Achievement(dict: dict)
                                self.arrayAchievement.append(achievement)
                                self.tableView.reloadData()
                                self.stopAnimating()
                            }
                        }
                    }
                } else {
                    self.tableView.isHidden = true
                    self.lbNoAchievement.isHidden = false
                    self.stopAnimating()
                }
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let nib = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "userCell")
    }
}

extension AchievementVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAchievement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        let achievement = arrayAchievement[indexPath.row]
        cell.lbUsername.text = achievement.achievement
        cell.imgUser.image = UIImage(named: "ic_complete")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
