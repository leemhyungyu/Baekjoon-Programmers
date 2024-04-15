//
//  Baekjoon10835.swift
//  Solved
//
//  Created by 임현규 on 2024/04/15.
//

import Foundation

let n = Int(readLine()!)!
let left = readLine()!.split(separator: " ").map { Int($0)! }
let right = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ left: [Int], _ right :[Int],  _ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
    var result = 0
    
    d[0][0] = 0
    for i in 0..<n {
        for j in 0..<n {
            let leftCard = left[i], rightCard = right[j]
            if d[i][j] != -1 {
                d[i + 1][j + 1] = max(d[i + 1][j + 1], d[i][j])
                d[i + 1][j] = max(d[i + 1][j], d[i][j])
                    
                if leftCard > rightCard {
                    d[i][j + 1] = max(d[i][j + 1], d[i][j] + rightCard)
                }
            }
        }
    }
    
    result = d[n].max()!

    for i in 0...n {
        result = max(result, d[i][n])
    }
    
    return result
}

print(solution(left, right, n))
