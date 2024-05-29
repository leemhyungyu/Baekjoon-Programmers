//
//  Baekjoon1563.swift
//  Solved
//
//  Created by 임현규 on 5/29/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: n)
    let mod = 1000000
    
    d[0][0][0] = 1
    d[0][1][0] = 1
    d[0][0][1] = 1
    
    for i in 1..<n {
        d[i][0][0] = (d[i - 1][0][0] + d[i - 1][0][1] + d[i - 1][0][2]) % mod
        d[i][0][1] = d[i - 1][0][0] % mod
        d[i][0][2] = d[i - 1][0][1] % mod
        d[i][1][0] = (d[i - 1][0][0] + d[i - 1][0][1] + d[i - 1][0][2] + d[i - 1][1][0] + d[i - 1][1][1] + d[i - 1][1][2]) % mod
        d[i][1][1] = d[i - 1][1][0] % mod
        d[i][1][2] = d[i - 1][1][1] % mod
    }
    
    return (d[n - 1].flatMap { $0 }.reduce(0) { $0 + $1 }) % mod
}

print(solution(n))
