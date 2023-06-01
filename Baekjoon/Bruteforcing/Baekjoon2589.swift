//
//  Baekjoon2589.swift
//  
//
//  Created by 임현규 on 2023/06/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let height = input[0], width = input[1]
var array = [[String]]()
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var visited = Array(repeating: Array(repeating: false, count: width), count: height)
var result = 0

for _ in 0..<height {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]]) -> Int {
    for i in 0..<height {
        for j in 0..<width {
            visited = Array(repeating: Array(repeating: false, count: width), count: height)
            
            if array[i][j] == "L" {
                result = max(result, bfs(i, j, 0))
            }
        }
    }
    
    return result
}

func bfs(_ x: Int, _ y: Int, _ length: Int) -> Int {
    
    var length = length
    var queue = [(x, y, length)]
    visited[x][y] = true
    
    while !queue.isEmpty {
        
        let element = queue.removeFirst()

        length = max(element.2, length)
        
        for i in dxdy {
            let nx = i.0 + element.0
            let ny = i.1 + element.1
            
            if (0..<height).contains(nx) && (0..<width).contains(ny) && !visited[nx][ny] {
                
                if array[nx][ny] == "L" {
                    visited[nx][ny] = true
                    queue.append((nx, ny, element.2 + 1))
                }
            }
        }
    }
    
    return length
}

print(solution(array))
