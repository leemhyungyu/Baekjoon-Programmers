//
//  Baekjoon14940.swift
//  Solved
//
//  Created by 임현규 on 2024/03/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [[Int]] {
    var result = 0
    var array = array
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    func bfs(_ start: (Int, Int)) {
        var queue = [start]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            let x = temp.0, y = temp.1
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] == 0 { continue }
                array[nx][ny] = array[x][y] + 1
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] == 2 && !visited[i][j] {
                array[i][j] = 0
                bfs((i, j))
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] != 0 && !visited[i][j] {
                array[i][j] = -1
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            print(array[i][j], terminator: " ")
        }
        
        print()
    }
    
    return array
}

solution(array, n, m)
