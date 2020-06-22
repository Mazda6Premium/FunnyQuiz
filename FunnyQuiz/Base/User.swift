//
//  User.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class Quizzes {
    var category = ""
    
    init(category: String) {
        self.category = category
    }
    
    init(fromDict: [String: Any]) {
        self.category = fromDict["category"] as? String ?? ""
    }
    
    func asDict() -> [String: Any] {
        return [
            "category": self.category
        ]
    }
}

class User {
    var email = ""
    var id = ""
    var password = ""
    var quizzes = [Quizzes]()
    
    init(email: String, id: String, password: String, quizzes: [Quizzes]) {
        self.email = email
        self.id = id
        self.password = password
        self.quizzes = quizzes
    }
    
    init(quizzes: [Quizzes]) {
        self.quizzes = quizzes
    }
    
    init(dict: [String: Any]) {
        self.email = dict["email"] as? String ?? ""
        self.id = dict["id"] as? String ?? ""
        self.password = dict["password"] as? String ?? ""
        if let data = dict["quizzes"] as? [[String: Any]] {
            self.quizzes = data.map({Quizzes(fromDict: $0)})
        }
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "email": self.email,
            "password": self.password,
            "id": self.id,
            "quizzes": self.quizzes.map({$0.asDict()})
        ]
    }
    
    func asDictQuizzes() -> [String: Any] {
        return [
            "quizzes": self.quizzes.map({$0.asDict()})
        ]
    }
}
