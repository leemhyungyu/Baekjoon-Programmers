//
//  Baekjoon2591.swift
//  Solved
//
//  Created by 임현규 on 2024/04/22.
//

import Foundation

let cards = readLine()!.map { Int(String($0))! }

func solution(_ cards: [Int]) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 2), count: cards.count)
    d[0][0] = 1
    
    for i in 1..<cards.count {
        let number = Int(String(cards[i - 1]) + String(cards[i]))!
        if cards[i] == 0 {
            d[i][1] = d[i - 1][0]
            continue
        }
        
        if number <= 34 { d[i][1] = d[i - 1][0] }
        d[i][0] = d[i - 1][0] + d[i - 1][1]
    }
        
    return d[cards.count - 1][0] + d[cards.count - 1][1]
}

print(solution(cards))
