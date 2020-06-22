//
//  QuizColCell.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class QuizColCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgQuizMenu: UIImageView!
    @IBOutlet weak var lbQuizMenu: UILabel!
    @IBOutlet weak var btPrice: UIButton!
    @IBOutlet weak var viewDim: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCell.layer.cornerRadius = CORNER_VIEW
        viewCell.clipsToBounds = true
        
        btPrice.layer.cornerRadius = CORNER_BUTTON
        btPrice.clipsToBounds = true
    }

}
