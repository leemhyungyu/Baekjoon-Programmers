//
//  Baekjoon13302.swift
//  Solved
//
//  Created by 임현규 on 2024/05/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [Int]()
if m != 0 {
    array = readLine()!.split(separator: " ").map { Int($0)! }
}

func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: Int.max, count: 110), count: 110)
    d[0][0] = 0
    
    for i in 0...n {
        for j in 0...40 {
            if d[i][j] == Int.max { continue }
            if j >= 3 { d[i + 1][j - 3] = min(d[i + 1][j - 3], d[i][j]) }
            if array.contains(i + 1) { d[i + 1][j] = min(d[i][j], d[i + 1][j]) }
            
            // 1일권 구매
            d[i + 1][j] = min(d[i][j] + 10000, d[i + 1][j])
            
            // 3일권 구매
            d[i + 1][j + 1] = min(d[i][j] + 25000, d[i + 1][j + 1])
            d[i + 2][j + 1] = min(d[i][j] + 25000, d[i + 2][j + 1])
            d[i + 3][j + 1] = min(d[i][j] + 25000, d[i + 3][j + 1])
            
            // 5일권 구매
            d[i + 1][j + 2] = min(d[i][j] + 37000, d[i + 1][j + 2])
            d[i + 2][j + 2] = min(d[i][j] + 37000, d[i + 2][j + 2])
            d[i + 3][j + 2] = min(d[i][j] + 37000, d[i + 3][j + 2])
            d[i + 4][j + 2] = min(d[i][j] + 37000, d[i + 4][j + 2])
            d[i + 5][j + 2] = min(d[i][j] + 37000, d[i + 5][j + 2])
        }
    }
    
    return d[n].min()!
}

print(solution(array, n, m))
