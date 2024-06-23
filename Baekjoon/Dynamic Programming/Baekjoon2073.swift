//
//  Baekjoon2073.swift
//  Solved
//
//  Created by 임현규 on 6/23/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let d = input[0], p = input[1]
var array = [[Int]]()

for _ in 0..<p {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ d: Int, _ p: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: d + 1), count: p)
    
    dp[0][array[0][0]] = array[0][1]
        
    for i in 1..<p {
        let l = array[i][0], c = array[i][1]
    
        dp[i][l] = max(dp[i][l], c)
        
        for j in 1...d {
            dp[i][j] = max(dp[i][j], dp[i - 1][j])
            if l + j > d { continue }
            dp[i][l + j] = max(dp[i - 1][l + j], min(dp[i - 1][j], c))
        }
    }
    
    return dp[p - 1][d]
}

print(solution(array, d, p))
