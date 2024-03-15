//
//  Baekjoon10844.swift
//  
//
//  Created by 임현규 on 2024/03/16.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 11), count: n + 1)
    
    for i in 1...9 {
        d[1][i] =  1
    }

    if n == 1 { return d[n].reduce(0) { $0 +  $1 } }
    
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                d[i][j] = d[i - 1][1] % 1000000000
            } else {
                d[i][j] = (d[i - 1][j - 1] + d[i - 1][j + 1]) % 1000000000
            }
        }
    }
    
    return (d[n].reduce(0) { $0 +  $1 }) % 1000000000
}

print(solution(n))
