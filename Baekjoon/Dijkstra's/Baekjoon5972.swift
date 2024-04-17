//
//  Baekjoon5972.swift
//  Solved
//
//  Created by 임현규 on 2024/04/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: inout [[Int]], _ n: Int, _ m: Int) -> Int {
    var graph = [Int: [(Int, Int)]]()
    
    for i in array {
        graph[i[0]] = (graph[i[0]] ?? []) + [(i[1], i[2])]
        graph[i[1]] = (graph[i[1]] ?? []) + [(i[0], i[2])]
    }

    return dijkstra(1, &graph)[n]
}

func dijkstra(_ start: Int, _ graph: inout [Int: [(Int, Int)]]) -> [Int] {
    var queue = [(0, start)]
    var costs = Array(repeating: Int.max, count: n + 1)
    costs[start] = 0
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        let nowCost = now.0, nowNode = now.1
        
        if costs[nowNode] < nowCost { continue }
        for (nextNode, nextCost) in graph[nowNode] ?? [] {
            let cost = nextCost + nowCost
            if cost < costs[nextNode] {
                costs[nextNode] = cost
                queue.append((cost, nextNode))
            }
        }
    }
    return costs
}

print(solution(&array, n, m))
