//
//  Baekjoon13265.swift
//  Solved
//
//  Created by 임현규 on 2024/05/16.
//

import Foundation

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> String {
    var graph = Array(repeating: [Int](), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var colors = Array(repeating: 0, count: n + 1)
    
    for i in array {
        graph[i[0]] += [i[1]]
        graph[i[1]] += [i[0]]
    }
    
    func bfs(_ start: Int, _ color: Int) -> Bool {
        colors[start] = color
        var queue = [start]
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            
            for i in graph[now] {
                if !visited[i] {
                    visited[i] = true
                    colors[i] = colors[now] == 1 ? 2 : 1
                    queue.append(i)
                }
                
                if visited[i] && colors[i] == colors[now] {
                    return false
                }
            }
        }
        
        return true
    }
    
    for i in 1...n {
        if visited[i] { continue }
        if !bfs(i, 1) { return "impossible" }
    }
    
    return "possible"
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], m = input[1]
    var array = [[Int]]()
    for _ in 0..<m {
        array.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    print(solution(array, n, m))
}

