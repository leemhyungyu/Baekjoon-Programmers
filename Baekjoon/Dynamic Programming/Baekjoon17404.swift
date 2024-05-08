//
//  Baekjoon17404.swift
//  Solved
//
//  Created by 임현규 on 2024/05/08.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var result = Int.max
    
    for k in 0..<3 {
        var d = Array(repeating: Array(repeating: 1000001, count: 3), count: n)
        d[0][k] = array[0][k]
        
        for i in 1..<n {
            d[i][0] = min(d[i - 1][1], d[i - 1][2]) + array[i][0]
            d[i][1] = min(d[i - 1][0], d[i - 1][2]) + array[i][1]
            d[i][2] = min(d[i - 1][0], d[i - 1][1]) + array[i][2]
        }
        
        for j in 0..<3 where k != j {
            result = min(d[n - 1][j], result)
        }
    }
    
    return result
}

print(solution(array, n))
