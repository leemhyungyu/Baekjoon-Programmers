//
//  Baekjoon1915.swift
//  Solved
//
//  Created by 임현규 on 7/15/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.map { Int(String($0))! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var length = 0
    
    for i in 1...n {
        for j in 1...m {
            d[i][j] = array[i - 1][j - 1]
        }
    }

    for i in 1...n {
        for j in 1...m {
            if array[i - 1][j - 1] == 1 {
                d[i][j] = min(d[i - 1][j], d[i][j - 1], d[i - 1][j - 1]) + 1
            }
        }
    }
    
    length = d.flatMap { $0 }.max()!
    
    return length * length
}

print(solution(array, n, m))
