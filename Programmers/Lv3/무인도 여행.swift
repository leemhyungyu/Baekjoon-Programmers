//
//  무인도 여행.swift
//  
//
//  Created by 임현규 on 2023/05/03.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    

    var visited = Array(repeating: Array(repeating: false, count: maps.last!.count), count: maps.count)
    
    var graph = [[String]]()
    
    for i in maps {
        graph.append(i.map { String($0) })
    }
    
    var dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)] // 하, 우, 상, 좌
    
    var value = 0
    var result = [Int]()
    
    func dfs(_ pos: (Int, Int)) {
        
        for i in dxdy {
            var nx = pos.0 + i.0
            var ny = pos.1 + i.1
            
            if (0..<maps.count).contains(nx) && (0..<maps.last!.count).contains(ny) && !visited[nx][ny] && graph[nx][ny] != "X" {
                value += Int(graph[nx][ny])!
                visited[nx][ny] = true
                dfs((nx, ny))
            }
        }
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph.last!.count {
            if graph[i][j] != "X" && !visited[i][j] {
                visited[i][j] = true
                value = Int(graph[i][j])!
                dfs((i, j))
                result.append(value)
            }
        }
    }

    return result.isEmpty ? [-1] : result.sorted { $0 < $1 }
}
