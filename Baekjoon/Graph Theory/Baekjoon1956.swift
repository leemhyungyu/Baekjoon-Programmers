//
//  Baekjoon1956.swift
//  Solved
//
//  Created by 임현규 on 5/30/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let v = input[0], e = input[1]
var array = [[Int]]()

for _ in 0..<e {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ v: Int, _ e: Int) -> Int {
    var graph = Array(repeating: Array(repeating: Int.max, count: v), count: v)
    var result = Int.max
    
    for i in array {
        let a = i[0] - 1, b = i[1] - 1, c = i[2]
        graph[a][b] = c
    }
    
    for k in 0..<v {
        for i in 0..<v {
            for j in 0..<v {
                if graph[i][k] == Int.max || graph[k][j] == Int.max { continue }
                
                if i == j {
                    result = min(result, (graph[i][k] + graph[k][j]))
                }
                
                if graph[i][j] > graph[i][k] + graph[k][j] {
                    graph[i][j] = graph[i][k] + graph[k][j]
                }
            }
        }
    }
    
    return result == Int.max ? -1 : result
}

print(solution(array, v, e))
