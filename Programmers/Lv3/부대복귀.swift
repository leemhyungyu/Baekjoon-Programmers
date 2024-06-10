//
//  부대복귀.swift
//  Solved
//
//  Created by 임현규 on 6/10/24.
//

import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var result = [Int]()
    var graph = Array(repeating: [Int](), count: n)
    
    for road in roads {
        let a = road[0] - 1, b = road[1] - 1
        graph[a] += [b]
        graph[b] += [a]
    }
    
    let costs = dijkstra(destination - 1, n, &graph)
    
    return sources.map { costs[$0 - 1] }.map { $0 == Int.max ? -1 : $0 }
}

func dijkstra(_ start: Int, _ n: Int, _ graph: inout [[Int]]) -> [Int] {
    var costs = Array(repeating: Int.max, count: n)
    var queue = [(start, 0)]
    var index = 0
    costs[start] = 0
    
    while index < queue.count {
        let now = queue[index]
        let nowNode = now.0, nowCost = now.1
        
        if nowCost > costs[nowNode] { continue }
        
        for i in graph[nowNode] {
            let nextNode = i, nextCost = nowCost + 1
            
            if nextCost < costs[nextNode] {
                costs[nextNode] = nextCost
                queue.append((nextNode, nextCost))
            }
        }
        
        index += 1
    }
    
    return costs
}
