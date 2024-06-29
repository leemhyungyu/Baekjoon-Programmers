//
//  Baekjoon5427.swift
//  Solved
//
//  Created by 임현규 on 6/29/24.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ array: [[String]], _ w: Int, _ h: Int) -> String {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var fireTime = Array(repeating: Array(repeating: 0, count: w), count: h)
    
    var result = 0
    
    func bfs(_ start: (Int, Int)) -> Int {
        var queue = [(start, 1)]
        visited[start.0][start.1] = true
        var index = 0
        
        while index < queue.count {
            let now = queue[index]
            let pos = now.0, nowCount = now.1
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                
                let nx = x + i.0, ny = y + i.1
                if !(0..<h).contains(nx) || !(0..<w).contains(ny) {
                    return nowCount
                }

                if visited[nx][ny] { continue }
                
                
                if array[nx][ny] != "#" && (fireTime[nx][ny] > nowCount + 1 || fireTime[nx][ny] == 0) {
                    queue.append(((nx, ny), nowCount + 1))
                    visited[nx][ny] = true
                }
            }
            
            index += 1
        }
        
        return 0
    }
    
    func fire() {
        var queue = [(Int, Int, Int)]()
        var index = 0
        
        for i in 0..<h {
            for j in 0..<w {
                if array[i][j] == "*" {
                    queue.append((i, j, 1))
                    fireTime[i][j] = 1
                }
            }
        }
        
        while index < queue.count {
            let now = queue[index]
            
            let x = now.0, y = now.1, time = now.2
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<h).contains(nx) || !(0..<w).contains(ny) { continue }
                if array[nx][ny] != "#" && fireTime[nx][ny] == 0 {
                    fireTime[nx][ny] = time + 1
                    queue.append((nx, ny, time + 1))
                }
            }
            
            index += 1
        }
    }
    
    fire()
        
    for i in 0..<h {
        for j in 0..<w {
            if array[i][j] == "@" {
                result = bfs((i, j))
            }
        }
    }
    
    return result == 0 ? "IMPOSSIBLE" : String(result)
}

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let w = input[0], h = input[1]
    var array = [[String]]()
    for _ in 0..<h {
        array.append(readLine()!.map { String($0) })
    }
    print(solution(array, w, h))
}
