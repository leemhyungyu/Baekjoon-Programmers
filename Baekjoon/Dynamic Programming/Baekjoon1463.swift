//
//  Baekjoon1463.swift
//  
//
//  Created by 임현규 on 2024/03/12.
//

import Foundation

let n = Int(readLine()!)!

print(solution(n))

func solution(_ x: Int) -> Int {
    var dp = Array(repeating: 0, count: 1000001)
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    
    if x < 4 { return dp[x] }
    
    for i in 4...x {
        if i % 3 == 0 && i % 2 == 0 {
            dp[i] = min(dp[i / 3], dp[i / 2]) + 1
        } else if i % 3 == 0 {
            dp[i] = min(dp[i / 3], dp[i - 1]) + 1
        } else if i % 2 == 0 {
            dp[i] = min(dp[i / 2], dp[i - 1]) + 1
        } else {
            dp[i] = dp[i - 1] + 1
        }
    }
    
    return dp[x]
}
