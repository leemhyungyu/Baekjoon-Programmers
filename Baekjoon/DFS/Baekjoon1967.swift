//
//  Baekjoon1967.swift
//  
//
//  Created by 임현규 on 2024/03/22.
//

import Foundation

let n = Int(readLine()!)!
var input = [[Int]]()

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var graph = [Int: [(Int, Int)]]()
    var visited = Array(repeating: false, count: n + 1)
    var maxNode = 0
    var result = 0
    
    for i in array {
        graph[i[0]] = (graph[i[0]] ?? []) + [(i[1], i[2])]
        graph[i[1]] = (graph[i[1]] ?? []) + [(i[0], i[2])]
    }
    
    func dfs(_ start: Int, _ value: Int) {
        visited[start] = true
        
        if result < value {
            result = value
            maxNode = start
        }
        
        for i in graph[start]! {
            if visited[i.0] { continue }
            dfs(i.0, value + i.1)
        }
    }
    
    
    dfs(1, 0)
    result = 0
    visited = Array(repeating: false, count: n + 1)
    dfs(maxNode, 0)
    
    return result
}


if n == 1 {
    print(0)
} else {
    for _ in 0..<n - 1 {
        input.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    print(solution(input, n))
}

