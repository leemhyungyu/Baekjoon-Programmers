//
//  Baekjoon2157.swift
//  Solved
//
//  Created by 임현규 on 6/17/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[2]
var array = [(Int, Int, Int)]()

for _ in 0..<k {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((input[0], input[1], input[2]))
}

func solution(_ array: [(Int, Int, Int)], _ n: Int, _ m: Int, _ k: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    
    for i in array where i.0 < i.1 {
        let a = i.0, b = i.1, c = i.2
        graph[a][b] = max(graph[a][b], c)
    }
    
    for i in 2...n {
        d[i][2] = graph[1][i]
    }
    
    for i in 1...n {
        for j in 2...m {
            for k in 1..<i {
                if graph[k][i] == 0 || d[k][j - 1] == 0 { continue }
                d[i][j] = max(d[i][j], d[k][j - 1] + graph[k][i])
            }
        }
    }
    
    return d[n].max()!
}

print(solution(array, n, m, k))
