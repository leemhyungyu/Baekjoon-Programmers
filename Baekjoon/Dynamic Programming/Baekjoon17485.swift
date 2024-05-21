//
//  Baekjoon17485.swift
//  Solved
//
//  Created by 임현규 on 5/21/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: Array(repeating: 100001, count: 3), count: m), count: n)
    
    for i in 0..<m {
        d[0][i][0] = array[0][i]
        d[0][i][1] = array[0][i]
        d[0][i][2] = array[0][i]
    }

    for x in 1..<n {
        for y in 0..<m {
            if y + 1 < m {
                d[x][y][0] = min(d[x - 1][y + 1][1], d[x - 1][y + 1][2]) + array[x][y]
            }
            
            if y - 1 >= 0 {
                d[x][y][2] = min(d[x - 1][y - 1][0], d[x - 1][y - 1][1]) + array[x][y]
            }
            d[x][y][1] = min(d[x - 1][y][0], d[x - 1][y][2]) + array[x][y]
        }
    }
    
    return d[n - 1].flatMap { $0 }.min()!
}

print(solution(array, n, m))
