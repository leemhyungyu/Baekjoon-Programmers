//
//  Baekjoon17208.swift
//  Solved
//
//  Created by 임현규 on 6/21/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ k: Int) -> Int {
    var d = Array(repeating: Array(repeating: Array(repeating: 0, count: 301), count: 301), count: 301)
    for i in 1...n {
        for j in 1...m {
            for k in 1...k {
                let burger = array[i - 1][0], potato = array[i - 1][1]
                if j >= burger && k >= potato {
                    d[i][j][k] = max(d[i - 1][j][k], d[i - 1][j - burger][k - potato] + 1)
                } else {
                    d[i][j][k] = d[i - 1][j][k]
                }
            }
        }
    }
    return d[n][m][k]
}

print(solution(array, n, m, k))
