//
//  Baekjoon14938.swift
//  Solved
//
//  Created by 임현규 on 2024/05/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], r = input[2]
let items = readLine()!.split(separator: " ").map { Int($0)! }
var graph = [[Int]]()
for _ in 0..<r {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ graph: [[Int]], _ items: [Int], _ n: Int, _ m: Int, _ r: Int) -> Int {
    var distances = Array(repeating: [(Int, Int)](), count: n)
    var result = 0
    for i in graph {
        distances[i[0] - 1] += [(i[1] - 1, i[2])]
        distances[i[1] - 1] += [(i[0] - 1, i[2])]
    }

    for i in 0..<n {
        result = max(dijkstra(i, &distances).reduce(0) { $0 + $1 }, result)
    }

    return result
}

func dijkstra(_ start: Int, _ distances: inout [[(Int, Int)]]) -> [Int] {
    var costs = Array(repeating: 0, count: n)
    costs[start] = items[start]
    var queue: [(Int, Int, Int)] = [(start, costs[start], 0)]
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        let nowNode = now.0, nowCost = now.1, nowDistance = now.2
    
        if nowCost < costs[nowNode] { continue }
        
        for next in distances[nowNode] {
            let nextNode = next.0, nextDistance = next.1, nextCost = items[nextNode]
            if nextDistance + nowDistance <= m && costs[nextNode] <= nextCost {
                costs[nextNode] = nextCost
                queue.append((nextNode, nextCost, nowDistance + nextDistance))
            }
        }
        
        index += 1
    }
    
    return costs
}

print(solution(graph, items, n, m, r))
