//
//  Baekjoon4811.swift
//  Solved
//
//  Created by 임현규 on 2024/04/09.
//

import Foundation

func solution(_ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var result = 0
    
    for i in 1...n {
        for j in 0...n {
            if i < j { continue }
            if j == 0 {
                d[i][j] = 1
            } else {
                d[i][j] = d[i - 1][j] + d[i][j - 1]
            }
        }
    }
    
    return d[n][n]
}

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    print(solution(n))
}
