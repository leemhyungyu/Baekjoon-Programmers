//
//  Baekjoon5569.swift
//  Solved
//
//  Created by 임현규 on 6/2/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let w = input[0], h = input[1]

func solution(_ w: Int, _ h: Int) -> Int {
    var d = Array(repeating: Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: 2), count: w), count: h)
    let mod = 100000
    
    for i in 0..<h {
        d[i][0][0][0] = 1
    }
    
    for i in 0..<w {
        d[0][i][1][0] = 1
    }
    
    for i in 1..<h {
        for j in 1..<w {
             d[i][j][0][0] = (d[i - 1][j][0][1] + d[i - 1][j][0][0]) % mod
             d[i][j][0][1] = d[i - 1][j][1][0] % mod
             d[i][j][1][0] = (d[i][j - 1][1][0] + d[i][j - 1][1][1]) % mod
             d[i][j][1][1] = d[i][j - 1][0][0] % mod
        }
    }
    
    return d[h - 1][w - 1].flatMap { $0 }.reduce(0) { $0 + $1 } % mod
}

print(solution(w, h))
