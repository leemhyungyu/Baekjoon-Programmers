//
//  Baekjoon16507.swift
//  Solved
//
//  Created by 임현규 on 2024/04/25.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1], q = input[2]
var array = [[Int]]()
var vertex = [[Int]]()
for _ in 0..<r {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for _ in 0..<q {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    vertex.append(input)
}

func solution(_ array: [[Int]], _ vertex: [[Int]], _ r: Int, _ c: Int, _ q: Int) -> [Int] {
    var d = Array(repeating: Array(repeating: 0, count: c + 1), count: r + 1)
    var result = [Int]()
    
    d[1][1] = array[0][0]
    for i in 1...r {
        for j in 1...c {
            d[i][j] = d[i - 1][j] + d[i][j - 1] - d[i - 1][j - 1] + array[i - 1][j - 1]
        }
    }
    
    for i in vertex {
        let r1 = i[0], c1 = i[1], r2 = i[2], c2 = i[3]
        result.append((d[r2][c2] - d[r2][c1 - 1] - d[r1 - 1][c2] + d[r1 - 1][c1 - 1]) / ((r2 - r1 + 1) * (c2 - c1 + 1)))
    }
    
    return result
}

solution(array, vertex, r, c, q).forEach { print($0) }
