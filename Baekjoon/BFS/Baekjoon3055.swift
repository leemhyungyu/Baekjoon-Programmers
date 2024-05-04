//
//  Baekjoon3055.swift
//  Solved
//
//  Created by 임현규 on 2024/05/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1]
var array = [[String]]()

for _ in 0..<r {
    array.append(readLine()!.map { String($0) })
}


func solution(_ array: inout [[String]], _ r: Int, _ c: Int) -> String {
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    func bfs(_ start: (Int, Int), _ array: [[String]]) -> Int {
        var queue = [(start, 0, array)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, min = now.1, nowArray = spreadWater(now.2)
            let x = pos.0, y = pos.1
            
            if nowArray[x][y] == "D" { return min }
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
                if visited[nx][ny] { continue }
                
                if nowArray[nx][ny] == "." || nowArray[nx][ny] == "D" {
                    queue.append(((nx, ny), min + 1, nowArray))
                    visited[nx][ny] = true
                }
            }
        }
        
        return 0
    }
    
    func spreadWater(_ array: [[String]]) -> [[String]] {
        var queue = [(Int, Int)]()
        var array = array
        
        for i in 0..<r {
            for j in 0..<c {
                if array[i][j] == "*" {
                    queue.append((i, j))
                }
            }
        }
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let x = now.0, y = now.1
            
            for i in dxdy {
                let nx = i.0 + x, ny = i.1 + y
                if !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
                if array[nx][ny] != "." { continue }
                array[nx][ny] = "*"
            }
        }
        
        return array
    }
    
    for i in 0..<r {
        for j in 0..<c {
            if array[i][j] == "S" {
                result = bfs((i, j), array)
            }
        }
    }
        
    return result != 0 ? String(result) : "KAKTUS"
}

print(solution(&array, r, c))
