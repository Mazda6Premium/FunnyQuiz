//
//  Achievement.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/14/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class Achievement {
    var achievement = ""
    
    init(achievement: String) {
        self.achievement = achievement
    }
    
    init(dict: [String: Any]) {
        self.achievement = dict["achievement"] as? String ?? ""
    }
    
    func asDict() -> [String: Any] {
        return [
            "achievement": self.achievement
        ]
    }
}
