//
//  Baekjoon2482.swift
//  Solved
//
//  Created by 임현규 on 2024/05/02.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

func solution(_ n: Int, _ k: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

    for i in 0...n {
        d[i][1] = i
        d[i][0] = 1
    }
        
    for i in 2...n {
        for j in 1...k {
            d[i][j] = (d[i - 2][j - 1] + d[i - 1][j]) % 100000003
        }
    }
        
    return (d[n - 3][k - 1] + d[n - 1][k]) % 100000003
}

print(solution(n, k))
