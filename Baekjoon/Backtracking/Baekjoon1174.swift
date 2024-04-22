//
//  Baekjoon1174.swift
//  Solved
//
//  Created by 임현규 on 2024/04/22.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var result = [Int]()
    
    func reduceNumber(_ firstNumber: Int?, _ now: [Int], _ count: Int) {
        result.append(Int(now.map { String($0) }.joined()) ?? 0)
            
        for i in 0...9 {
            if firstNumber != nil && firstNumber! >= i { continue }
            reduceNumber(i, [i] + now, count + 1)
        }
    }
    
    reduceNumber(nil, [], 0)
    
    return result.count > n ? result.sorted()[n] : -1
}

print(solution(n))
