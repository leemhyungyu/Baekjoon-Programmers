//
//  Baekjoon14863.swift
//  Solved
//
//  Created by 임현규 on 6/18/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ k: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: k + 1), count: n)
    var result = 0
    
    d[0][array[0][0]] = array[0][1]
    d[0][array[0][2]] = max(d[0][array[0][2]], array[0][3])
    
    for i in 1..<n {
        for j in 1...k {
            if d[i - 1][j] == 0 { continue }
            if j + array[i][0] <= k {
                d[i][j + array[i][0]] = max(d[i][j + array[i][0]], d[i - 1][j] + array[i][1])
            }
            
            if j + array[i][2] <= k {
                d[i][j + array[i][2]] = max(d[i][j + array[i][2]], d[i - 1][j] + array[i][3])
            }
        }
    }
    
    return d[n - 1].max()!
}

print(solution(array, n, k))
