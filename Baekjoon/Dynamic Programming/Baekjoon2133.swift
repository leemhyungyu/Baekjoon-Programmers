//
//  Baekjoon2133.swift
//  Solved
//
//  Created by 임현규 on 6/9/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: 0, count: 31)
    
    d[0] = 1
    d[2] = 3
    
    if n <= 2 { return d[n] }
    
    for i in 3...n where i % 2 == 0 {
        for j in 2...n where j % 2 == 0 {
            if j == 2 {
                d[i] = d[i - j] * d[2]
            } else if i - j >= 0 {
                d[i] += d[i - j] * 2
            }
        }
    }
    return d[n]
}

print(solution(n))
