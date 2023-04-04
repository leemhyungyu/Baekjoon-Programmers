//
//  [Lv2] 전력망을 둘로 나누기.swift
//  
//
//  Created by 임현규 on 2023/04/05.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var result = 100000
    
    for i in wires {
        let first = i[0], second = i[1]
        graph[first][second] = 1
        graph[second][first] = 1
    }
    
    for i in wires {
        let first = i[0], second = i[1]
        graph[first][second] = 0
        graph[second][first] = 0
        result = [result, bfs(n, graph,first)].min()!
        
        graph[first][second] = 1
        graph[second][first] = 1
    }
    
    return result
}

// 해당 트리의 노드의 개수를 반환하는 함수
func bfs(_ n: Int, _ graph: [[Int]], _ targetNumber: Int) -> Int {
    
    var visited = Array(repeating: false, count: n + 1)
    var queue = [targetNumber]
    var count = 1
    visited[targetNumber] = true
    
    while !queue.isEmpty {
        let number = queue.removeFirst()
        
        for i in 0...n {
            
            if graph[number][i] == 1 && !visited[i] {
                count += 1
                visited[number] = true
                queue.append(i)
            }
        }
    }
    
    return abs(count - (n - count))
}
