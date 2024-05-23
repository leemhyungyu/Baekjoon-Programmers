//
//  Baekjoon10282.swift
//  Solved
//
//  Created by 임현규 on 5/23/24.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ array: [[Int]], _ n: Int, _ d: Int, _ c: Int) -> [Int] {
    var graph = Array(repeating: [(Int, Int)](), count: n)
    
    for i in array {
        let a = i[0] - 1, b = i[1] - 1, s = i[2]
        graph[b] += [(a, s)]
    }

    func dijkstra(_ start: Int) -> [Int] {
        var costs = Array(repeating: 10000001, count: n)
        costs[start] = 0
        var queue = [(start, 0)]
        var index = 0
        while index < queue.count {
            let now = queue[index]
            let nowNode = now.0, nowCost = now.1
            
            if nowCost > costs[nowNode] {
                index += 1
                continue
            }
            
            for i in graph[nowNode] {
                let nextNode = i.0, cost = i.1
                let nextCost = cost + nowCost
                
                if nextCost < costs[nextNode] {
                    costs[nextNode] = nextCost
                    queue.append((nextNode, nextCost))
                }
            }
            
            index += 1
        }
        
        return costs
    }
    
    let result = dijkstra(c - 1).filter { $0 != 10000001 }

    return [result.count, result.max()!]
}

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], d = input[1], c = input[2]
    var array = [[Int]]()

    for _ in 0..<d {
        array.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    print(solution(array, n, d, c).map { String($0) }.joined(separator: " "))
}
