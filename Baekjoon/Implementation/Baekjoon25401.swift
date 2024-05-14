//
//  Baekjoon25401.swift
//  Solved
//
//  Created by 임현규 on 2024/05/14.
//

import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ cards: [Int], _ n: Int) -> Int {
    var result = Int.max
    for i in 0..<n {
        for j in i + 1..<n {
            let gap = (cards[j] - cards[i]) / (j - i)
            if (cards[j] - cards[i]) % (j - i) != 0 { continue }
            var count = 0, targetNumber = cards[i] - gap * i
                        
            for k in 0..<n {
                if cards[k] != targetNumber { count += 1 }
                targetNumber += gap
            }
            
            result = min(result, count)
        }
    }
    
    return result
}

print(solution(cards, n))
