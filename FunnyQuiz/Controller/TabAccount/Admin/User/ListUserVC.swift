//
//  ListUserVC.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/13/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class ListUserVC: BaseViewController {
    
    @IBOutlet weak var lbTotalUser: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayUser = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationController(titleName: "User")
        setupTableView()
        getDataUser()
    }
    
    func getDataUser() {
        startAnimating()
        databaseReference.child("Users").observe(.childAdded) { (data) in
            databaseReference.child("Users").child(data.key).observe(.value) { (snapshot) in
                if let dict = snapshot.value as? [String: Any] {
                    let user = User(dict: dict)
                    self.arrayUser.append(user)
                    self.lbTotalUser.text = "Total user: \(self.arrayUser.count)"
                    self.tableView.reloadData()
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

extension ListUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        cell.lbUsername.text = arrayUser[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
