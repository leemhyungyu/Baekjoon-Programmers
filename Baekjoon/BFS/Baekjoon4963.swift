//
//  Baekjoon4963.swift
//  
//
//  Created by 임현규 on 2024/03/18.
//

import Foundation

while true {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    if input == [0, 0] {
        break
    }
    
    let w = input[0], h = input[1]
    var map = [[Int]]()
    
    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    print(solution(map, w, h))
}
func solution(_ map: [[Int]], _ w: Int, _ h: Int) -> Int {
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
    
    
    func bfs(_ start: (Int, Int)) {
        var queue = [start]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            for n in dxdy {
                let nx = x + n.0, ny = y + n.1
                if !(0..<h).contains(nx) || !(0..<w).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if map[nx][ny] == 0 { continue }
                
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 && !visited[i][j] {
                bfs((i, j))
                result += 1
            }
        }
    }
    return result
}
