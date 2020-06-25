//
//  User.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class User {
    var email = ""
    var id = ""
    var password = ""
    var buyQuizzes = false
    
    init(email: String, id: String, password: String, buyQuizzes: Bool) {
        self.email = email
        self.id = id
        self.password = password
        self.buyQuizzes = buyQuizzes
    }
    
    init(dict: [String: Any]) {
        self.email = dict["email"] as? String ?? ""
        self.id = dict["id"] as? String ?? ""
        self.password = dict["password"] as? String ?? ""
        self.buyQuizzes = dict["buyQuizzes"] as? Bool ?? false
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "email": self.email,
            "password": self.password,
            "id": self.id,
            "buyQuizzes": self.buyQuizzes
        ]
    }
    
    init(buyQuizzes: Bool) {
        self.buyQuizzes = buyQuizzes
    }
    
    func asDictBuyQuizzes() -> [String: Any] {
        return [
            "buyQuizzes": self.buyQuizzes
        ]
    }
}
