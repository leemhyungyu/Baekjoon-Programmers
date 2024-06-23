//
//  Baekjoon1749.swift
//  Solved
//
//  Created by 임현규 on 6/23/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var sum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var result = -Int.max
    
    for i in 1...n {
        for j in 1...m {
            sum[i][j] = sum[i - 1][j] + sum[i][j - 1] + array[i - 1][j - 1] - sum[i - 1][j - 1]
        }
    }
    
    for i in 1...n {
        for j in 1...m {
            for k in i...n {
                for z in j...m {
                    result = max(result, sum[k][z] - sum[k][j - 1] - sum[i - 1][z] + sum[i - 1][j - 1])
                }
            }
        }
    }
    
    return result
}

print(solution(array, n, m))
