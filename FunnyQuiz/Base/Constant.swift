//
//  Constant.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/7/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation
import Firebase
import UIKit

let MAIN_COLOR = #colorLiteral(red: 0.6509803922, green: 0.3647058824, blue: 0.337254902, alpha: 1)
let SUBMAIN_COLOR = #colorLiteral(red: 0.4509803922, green: 0.231372549, blue: 0.1843137255, alpha: 1)
let CHOOSE_COLOR = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)

let CORNER_VIEW: CGFloat = 10
let CORNER_BUTTON: CGFloat = 10
let CORNER_VIEW_LOADING: CGFloat = 8

let databaseReference = Database.database().reference()
let storageReference = Storage.storage().reference()
let userDefaults = UserDefaults.standard

let ADMIN_ID = "DaCGHSe1rEgsxU4hCXXMYULF5zS2"

let KEY_BUY_QUIZZES = "BUY_QUIZZES"

