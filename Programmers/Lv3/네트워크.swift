//
//  네트워크.swift
//  
//
//  Created by 임현규 on 2023/04/12.
//

import Foundation


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var count = 0
    
    func bfs(_ start: (Int, Int), _ graph: [[Int]], _ n: Int) {

        var queue = [(start.0, start.1)]

        while !queue.isEmpty {

            let pos = queue.removeFirst()
            
            visited[pos.0][pos.1] = true
            
            for i in 0..<n{
                if !visited[i][pos.0] {
                    if graph[i][pos.0] == 1 {
                        visited[i][pos.0] = true
                        visited[pos.0][i] = true
                        queue.append((i, pos.0))
                    }
                }
            }
        }
    }
    
    for i in 0..<computers.count {
        for j in 0..<computers[i].count {
            if computers[i][j] == 1 {
                if !visited[i][j] {
                    bfs((i, j), computers, n)
                    count += 1
                }
            }
        }
    }
    
    return count
}
