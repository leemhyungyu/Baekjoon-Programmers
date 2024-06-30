//
//  Baekjoon17845.swift
//  Solved
//
//  Created by 임현규 on 6/30/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: n + 1), count: m)
    
    if array[0][1] < n {
        d[0][array[0][1]] = array[0][0]
    }

    for i in 1..<m {
        let priority = array[i][0], time = array[i][1]
        
        for j in 0...n  {
            if j >= time {
                d[i][j] = max(d[i - 1][j], d[i - 1][j - time] + priority)
            } else {
                d[i][j] = d[i - 1][j]
            }
        }
    }
        
    return d[m - 1].max()!
}

print(solution(array, n, m))
