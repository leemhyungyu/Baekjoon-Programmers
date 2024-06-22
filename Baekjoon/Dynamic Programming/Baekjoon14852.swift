//
//  Baekjoon14852.swift
//  Solved
//
//  Created by 임현규 on 6/22/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: 0, count: 1000001)
    var sum = Array(repeating: 0, count: 1000001)
    
    let mod = 1000000007
    d[1] = 2
    d[2] = 7
    sum[0] = 2
    sum[1] = 6
    sum[2] = 20
    
    for i in 3...1000000 {
        d[i] = (d[i - 2] * 3 + d[i - 1] * 2 + sum[i - 3]) % mod
        sum[i] = (sum[i - 1] + d[i] * 2) % mod
    }
    
    return d[n] % mod
}

print(solution(n))
