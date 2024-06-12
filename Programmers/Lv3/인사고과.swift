//
//  인사고과.swift
//  Solved
//
//  Created by 임현규 on 6/12/24.
//

import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let target = scores[0]
    let scores = scores.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] }
    var maxScore = 0
    var result = 1
    
    for score in scores {
        if target[0] < score[0] && target[1] < score[1] { return -1 }
        
        if score[1] >= maxScore {
            maxScore = score[1]
            if target[0] + target[1] < score[0] + score[1] { result += 1 }
        }
    }
    
    return result
}
