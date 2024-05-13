//
//  Baekjoon27211.swift
//  Solved
//
//  Created by 임현규 on 2024/05/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var result = 0

    func bfs(start: (Int, Int)) {
        var queue = [start]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let x = now.0, y = now.1
            for i in dxdy {
                var nx = x + i.0, ny = y + i.1
                
                if nx < 0 { nx = n - 1 }
                if nx > n - 1 { nx = 0 }
                if ny < 0 { ny = m - 1 }
                if ny > m  - 1 { ny = 0 }
                
                if visited[nx][ny] { continue }
                if array[nx][ny] == 1 { continue }
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] == 0 && !visited[i][j] {
                bfs(start: (i, j))
                result += 1
            }
        }
    }
    return result
}

print(solution(array, n, m))
