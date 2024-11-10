//
//  합승 택시 요금.swift
//  Solved
//
//  Created by 임현규 on 11/10/24.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var route = Array(repeating: [(Int, Int)](), count: n)
    var result = Int.max
    
    for fare in fares {
        route[fare[0] - 1].append((fare[1] - 1, fare[2]))
        route[fare[1] - 1].append((fare[0] - 1, fare[2]))
    }
    
    var costs = dijkstra(s - 1, n, route)
    
    for i in 0..<n {
        var newCosts = dijkstra(i, n, route)
        result = min(result, costs[i] + newCosts[a - 1] + newCosts[b - 1])
    }
    
    return result
}

func dijkstra(_ start: Int, _ n: Int, _ route: [[(Int, Int)]]) -> [Int] {
    var costs = Array(repeating: 100001 * 200, count: n)
    var index = 0
    var q = [(start, 0)]
    costs[start] = 0
    
    while q.count > index {
        let now = q[index]
        let node = now.0, cost = now.1
        
        if cost > costs[node] {
            index += 1
            continue
        }
        
        // 현재 node에서 갈 수 있는 노드와 비용
        for next in route[node] {
            let nextNode = next.0, nextCost = next.1
            
            // nextNode까지의 거리가 현재 node을 통해서 가는게 더 비용이 저렴한 경우
            if costs[nextNode] > cost + nextCost {
                costs[nextNode] = cost + nextCost
                q.append((nextNode, costs[nextNode]))
            }
        }
        
        index += 1
    }
    
    return costs
}
