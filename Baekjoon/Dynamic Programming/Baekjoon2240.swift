//
//  Baekjoon2240.swift
//  Solved
//
//  Created by 임현규 on 2024/04/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let t = input[0], w = input[1]
var array = [Int]()
for _ in 0..<t {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ t: Int, _ w: Int) -> Int {
    var d = Array(repeating: Array(repeating: Array(repeating: 0, count: w + 2), count: 3), count: t + 1)
        
    for i in 1...t {
        for j in 1...w + 1 {
            if array[i - 1] == 1 {
                d[i][1][j] = max(d[i - 1][2][j - 1] + 1, d[i - 1][1][j] + 1)
                d[i][2][j] = max(d[i - 1][1][j - 1], d[i - 1][2][j])
            } else {
                if i == 1 && j == 1 { continue }
                d[i][1][j] = max(d[i - 1][1][j], d[i - 1][2][j - 1])
                d[i][2][j] = max(d[i - 1][2][j] + 1, d[i - 1][1][j - 1] + 1)
            }
        }
    }
    return d[t].map { $0.max()! }.max()!
}

print(solution(array, t, w))
