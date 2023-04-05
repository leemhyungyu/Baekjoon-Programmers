//
//  피로도.swift
//  
//
//  Created by 임현규 on 2023/04/06.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var result = 0
    
    for i in 0..<dungeons.count {
        result = [bfs(dungeons, i, k, dungeons.count), result].max()!
    }
    
    return result
}
    
func bfs(_ graph: [[Int]], _ start: Int, _ k: Int, _ n: Int) -> Int {
    
    var result = 0
    var queue: [(Int, [Int])] = [(k - graph[start][1], [start])] // 현재 피로도, 루트

    while !queue.isEmpty {
        let element = queue.removeFirst()
        
        var nowK = element.0, route = element.1
        
        for i in 0..<n {
            if nowK >= graph[i][0] && !route.contains(i) {
                queue.append((nowK - graph[i][1], route + [i]))
            } else {
                result = [route.count, result].max()!
            }
        }
    }
    
    return result
}
