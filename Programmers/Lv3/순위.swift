//
//  순위.swift
//  Solved
//
//  Created by 임현규 on 6/12/24.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var upGraph = Array(repeating: [Int](), count: n)
    var downGraph = Array(repeating: [Int](), count: n)
    var answer = 0
    for result in results {
        let a = result[0] - 1, b = result[1] - 1
        upGraph[b] += [a]
        downGraph[a] += [b]
    }
    
    func dfs(_ now: Int, _ graph: [[Int]]) {
        visited[now] = true
        
        for i in graph[now] {
            if visited[i] { continue }
            dfs(i, graph)
        }
    
    }
    
    for i in 0..<n {
        visited = Array(repeating: false, count: n)
        dfs(i, upGraph)
        dfs(i, downGraph)
        if visited.filter { !$0 }.isEmpty { answer += 1 }
    }
    
    return answer
}
