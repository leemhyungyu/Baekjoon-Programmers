//
//  Baekjoon3980.swift
//  Solved
//
//  Created by 임현규 on 2024/04/16.
//

import Foundation

let c = Int(readLine()!)!

func solution(_ array: [[Int]]) -> Int {
    var result = 0
    var position = Array(repeating: false, count: 11)
        
    func backTraking(_ now: Int, _ sum: Int) {
        if now == 11 {
            result = max(result, sum)
            return
        }
        
        
        for i in 0..<array[now].count {
            if array[now][i] == 0 { continue }
            if position[i] { continue }
            position[i] = true
            backTraking(now + 1, sum + array[now][i])
            position[i] = false
        }
    }
    
    backTraking(0, 0)
    return result
}

for _ in 0..<c {
    var array = [[Int]]()
    
    for _ in 0..<11 {
        array.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    print(solution(array))
}
