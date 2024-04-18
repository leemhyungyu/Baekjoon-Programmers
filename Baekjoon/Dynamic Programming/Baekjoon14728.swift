//
//  Baekjoon14728.swift
//  Solved
//
//  Created by 임현규 on 2024/04/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], t = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ t: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 10001), count: 101)
    
    for i in 1...n {
        let time = array[i - 1][0], score = array[i - 1][1]
        
        for j in 0...t {
            if j < time {
                d[i][j] = d[i - 1][j]
            } else {
                d[i][j] = max(d[i - 1][j], d[i - 1][j - time] + score)
            }
        }
    }
    
    return d[n][t]
}

print(solution(array, n, t))
