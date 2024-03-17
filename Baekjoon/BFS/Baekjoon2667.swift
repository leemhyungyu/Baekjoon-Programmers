//
//  Baekjoon2667.swift
//  
//
//  Created by 임현규 on 2024/03/18.
//

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}

func solution(_ graph: [[Int]], _ n: Int) {
    var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var count = 0
    var result = [Int]()
    
    func bfs(_ start: (Int, Int)) -> Int {
        var count = 1
        var queue = [start]
        visited[start.0][start.1] = true
       
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<n).contains(ny) { continue }
                if graph[nx][ny] == 1 && !visited[nx][ny] {
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                    count += 1
                }
            }
        }
        return count
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[i].count {
            if graph[i][j] == 1 && !visited[i][j] {
                result.append(bfs((i, j)))
                count += 1
            }
        }
    }
    
    print(count)
    result.sorted { $0 < $1 }.forEach { print($0) }
}

solution(graph, n)
