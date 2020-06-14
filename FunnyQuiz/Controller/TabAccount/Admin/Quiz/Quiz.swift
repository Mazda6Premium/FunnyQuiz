//
//  Quiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class Quiz {
    var category = ""
    var question = ""
    var index = 0
    var answer = 0
    var img1 = ""
    var img2 = ""
    var img3 = ""
    var img4 = ""
    
    init(category: String, question: String, index: Int, answer: Int, img1: String, img2: String, img3: String, img4: String) {
        self.category = category
        self.question = question
        self.index = index
        self.answer = answer
        self.img1 = img1
        self.img2 = img2
        self.img3 = img3
        self.img4 = img4
    }
    
    func asDict() -> [String: Any] {
        return [
            "category": self.category,
            "question": self.question,
            "index": self.index,
            "answer": self.answer,
            "img1": self.img1,
            "img2": self.img2,
            "img3": self.img3,
            "img4": self.img4
        ]
    }
    
    init(fromDict: [String: Any]) {
        self.category = fromDict["category"] as? String ?? ""
        self.question = fromDict["question"] as? String ?? ""
        self.index = fromDict["index"] as? Int ?? 0
        self.answer = fromDict["answer"] as? Int ?? 0
        self.img1 = fromDict["img1"] as? String ?? ""
        self.img2 = fromDict["img2"] as? String ?? ""
        self.img3 = fromDict["img3"] as? String ?? ""
        self.img4 = fromDict["img4"] as? String ?? ""
    }
}

