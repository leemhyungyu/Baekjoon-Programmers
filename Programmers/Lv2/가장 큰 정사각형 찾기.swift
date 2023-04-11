//
//  가장 큰 정사각형 찾기.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var graph = board
    var max = 0
    
    for i in 1..<graph.count {
        for j in 1..<graph[i].count {
            if graph[i][j] == 0 { continue }
            graph[i][j] = min(graph[i - 1][j], graph[i - 1][j - 1], graph[i][j - 1]) + 1
        }
    }
    
    for i in graph {
        let temp = i.max()!
        if temp > max {
            max = temp
        }
    }
    
    return max * max
}
