//
//  Baekjoon24480.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], r = input[2]
var edges: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    edges[input[0]].append(input[1])
    edges[input[1]].append(input[0])
}

for i in 1...n {
    edges[i] = edges[i].sorted { $0 > $1 }
}

func solution(_ edges: [[Int]]) {
    var route = Array(repeating: 0, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var depth = 1
    
    func dfs(_ start: Int) {
        visited[start] = true
        route[start] = depth
        
        for i in edges[start] {
            if visited[i] { continue }
            depth += 1
            dfs(i)
        }
    }

    dfs(r)
    
    route[1...n].forEach { print($0) }
}

solution(edges)
