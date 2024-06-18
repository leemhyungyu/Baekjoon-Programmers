//
//  Baekjoon2698.swift
//  Solved
//
//  Created by 임현규 on 6/18/24.
//

import Foundation

let t = Int(readLine()!)!
var d = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: 101), count: 101)
var max = 2147483647

d[1][0][0] = 1
d[1][0][1] = 1

for i in 2..<101 {
    for j in 0..<101 {
        d[i][j][0] = min(max, d[i - 1][j][0] + d[i - 1][j][1])
        
        if j == 0 {
            d[i][j][1] = min(max, d[i - 1][j][0])
        } else {
            d[i][j][1] = min(max, d[i - 1][j - 1][1] + d[i - 1][j][0])
        }
    }
}

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], k = input[1]
    print(d[n][k].reduce(0) { $0 + $1 })
}
