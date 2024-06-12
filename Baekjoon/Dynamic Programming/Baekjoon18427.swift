//
//  Baekjoon18427.swift
//  Solved
//
//  Created by 임현규 on 6/12/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], h = input[2]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ h: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: h + 1), count: n)
    let mod = 10007
    for i in 0..<n {
        for j in array[i] {
            d[i][j] = 1
        }
    }
    
    for i in 1..<n {
        for j in 1...h {
            d[i][j] += d[i - 1][j] % mod
            for k in array[i] {
                if j - k >= 0 {
                    d[i][j] += (d[i - 1][j - k]) % mod
                }
            }
        }
    }
    
    return d[n - 1][h] % mod
}

print(solution(array, n, m, h))
