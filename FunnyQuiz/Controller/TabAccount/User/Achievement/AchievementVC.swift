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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

}

extension AchievementVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
