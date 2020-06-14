//
//  RandomNumber.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/14/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class RandomNumber {

    var numbers: [Int] = []

    func generateNumbers(repetitions: Int, maxValue: Int) -> [Int] {
        guard maxValue >= repetitions else {
            fatalError("maxValue must be >= repetitions for the numbers to be unique")
        }

        numbers = []

        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = random(maxValue: maxValue)
            } while numbers.contains(n)
            numbers.append(n)
        }

        return numbers
    }

    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue + 1)))
    }

}
