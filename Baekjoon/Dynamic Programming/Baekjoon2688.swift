//
//  Baekjoon2688.swift
//  Solved
//
//  Created by 임현규 on 2024/04/15.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 1, count: 10), count: n + 1)
    
    for i in 0...n {
        for j in 0...9 {
            for k in 0...9 {
                if k > j { continue }
                d[i][j] += d[max(0, i - 1)][k]
            }
        }
    }
    
    return d[n].reduce(0) { $0 + $1 }
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(solution(n))
}

