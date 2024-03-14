//
//  Baekjoon1707.swift
//  
//
//  Created by 임현규 on 2024/03/15.
//

import Foundation

let k = Int(readLine()!)!

for _ in 0..<k {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    let v = input[0], e = input[1]
    var graph: [[Int]] = Array(repeating: [], count: v + 1)
    
    for _ in 0..<e {
        input = readLine()!.split(separator: " ").map { Int($0)! }
        let u = input[0], v = input[1]
        graph[u].append(v)
        graph[v].append(u)
    }
    
    print(solution(graph, v, e))
}

func solution(_ graph: [[Int]], _ v: Int, _ e: Int) -> String {
    var result = false
    var colors = Array(repeating: 0, count: v + 1)
    
    func bfs(_ start: Int, _ color: Int) -> Bool {
        var queue = [start]
        colors[start] = color
       
        while !queue.isEmpty {
            var start = queue.removeLast()
        
            for end in graph[start] {
                if colors[end] == 0 {
                    queue.append(end)
                    colors[end] = colors[start] * -1
                } else if colors[end] == colors[start] {
                    return false
                }
            }
        }
        
        return true
    }
    
    for i in 1...v {
        if colors[i] == 0 {
            result = bfs(i, 1)
            if !result { break }
        }
    }
    
    return result ? "YES" : "NO"
}
