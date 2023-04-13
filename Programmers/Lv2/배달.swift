//
//  배달.swift
//  
//
//  Created by 임현규 on 2023/04/13.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    var queue = [1]
    var adj = Array(repeating: [(Int, Int)](), count: N + 1)
    var distance = Array(repeating: Int.max, count: N + 1)
    
    distance[1] = 0

    for i in road {
        adj[i[0]].append((i[1], i[2]))
        adj[i[1]].append((i[0], i[2]))
    }

    while !queue.isEmpty {
        let start = queue.removeLast()
        
        for i in adj[start] {
            if distance[start] + i.1 < distance[i.0] {
                distance[i.0] = distance[start] + i.1
                queue.insert(i.0, at: 0)
            }
        }
    }
    
    return distance.filter { $0 <= k }.count
}
