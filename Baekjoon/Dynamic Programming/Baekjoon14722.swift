//
//  Baekjoon14722.swift
//  Solved
//
//  Created by 임현규 on 6/20/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    let dxdy = [(1, 0), (0, 1)]
    var d = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n + 1), count: n + 1)
    
    for i in 1...n {
        for j in 1...n {
            if array[i - 1][j - 1] == 0 {
                d[i][j][0] = max(d[i - 1][j][2] + 1, d[i][j - 1][2] + 1)
            } else {
                d[i][j][0] = max(d[i - 1][j][0], d[i][j - 1][0])
            }
            
            if array[i - 1][j - 1] == 1 && d[i][j][0] > d[i][j][1] {
                d[i][j][1] = d[i][j][0] + 1
            } else {
                d[i][j][1] = max(d[i - 1][j][1], d[i][j - 1][1])
            }
            
            if array[i - 1][j - 1] == 2 && d[i][j][1] > d[i][j][2] {
                d[i][j][2] = d[i][j][1] + 1
            } else {
                d[i][j][2] = max(d[i - 1][j][2], d[i][j - 1][2])
            }
        }
    }
    
    return d[n][n].max()!
}

print(solution(array, n))
