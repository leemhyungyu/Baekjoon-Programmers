//
//  Baekjoon2146.swift
//  
//
//  Created by 임현규 on 2024/03/20.
//

import Foundation

let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! } )
}

func solution(_ map: [[Int]], _ n: Int) -> Int {
    var map = map
    var result = Int.max
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var number = 1
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    

    func findBridge(_ map: [[Int]], _ start: (Int, Int)) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var result = Int.max
        var number = map[start.0][start.1]
        var map = map
        var queue = [start]
        map[start.0][start.1] = 1
        visited[start.0][start.1] = true

        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                
                if !(0..<n).contains(nx) || !(0..<n).contains(ny) { continue }
                if visited[nx][ny] { continue }
                
                if map[nx][ny] == 0 {
                    map[nx][ny] = map[x][y] + 1
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                } else if map[nx][ny] != number {
                    result = min(result, map[x][y])
                }
            }
        }
        
        return result
    }
    
    func numbering(_ start: (Int, Int), _ number: Int) {
        var queue = [start]
        visited[start.0][start.1] = true
        map[start.0][start.1] = number
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                
                if !(0..<n).contains(nx) || !(0..<n).contains(ny) { continue }
                if visited[nx][ny] { continue }
                
                if map[nx][ny] == 1 {
                    map[nx][ny] = number
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] != 0 && !visited[i][j] {
                numbering((i, j), number)
                number += 1
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] != 0 {
                result = min(findBridge(map, (i, j)), result)
            }
        }
    }
    
    return result - 1
}

print(solution(map, n))
