//
//  Baekjoon11724.swift
//  
//
//  Created by 임현규 on 2024/03/15.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var graph: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0] - 1, v = input[1] - 1
    graph[u].append(v)
    graph[v].append(u)
}

func solution(_ graph: [[Int]], _ n: Int) -> Int {
    var result = 0
    var visited = Array(repeating: false, count: n)
    
    func bfs(_ start: Int) {
        var count = 1
        var queue = [start]
        visited[start] = true
        
        while !queue.isEmpty {
            let ns = queue.removeLast()
            
            for i in graph[ns] {
                if !visited[i] {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            bfs(i)
            result += 1
        }
    }
    
    return result
}

print(solution(graph, n))
