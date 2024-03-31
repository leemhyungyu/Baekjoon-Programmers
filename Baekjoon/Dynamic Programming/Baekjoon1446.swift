//
//  Baekjoon1446.swift
//  Solved
//
//  Created by 임현규 on 2024/03/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], d = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ d: Int) -> Int {
    var dp = Array(repeating: 0, count: d + 1)
    let array = array.sorted { $0[0] < $1[0] }.filter { $0[1] <= d }
    
    for i in 0...d { dp[i] = i }
    
    for i in 0...d {
        dp[i] = min(dp[max(0, i - 1)] + 1, dp[i])

        for j in array {
            let start = j[0], end = j[1], value = j[2]
            if i == start {
                dp[end] = min(dp[start] + value, dp[end])
            }
        }
    }
    return dp[d]
}

print(solution(array, n, d))
