//
//  Baekjoon14923.swift
//  Solved
//
//  Created by 임현규 on 2024/05/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
let h = readLine()!.split(separator: " ").map { Int($0)! }
let e = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ h: [Int], _ e: [Int]) -> Int {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
    var result = 0
    
    func bfs(start: (Int, Int)) -> Int {
        var queue = [(start, 0, 0)]
        visited[start.0][start.1][0] = true
        var index = 0
        while index < queue.count {
            let now = queue[index]
            let pos = now.0, cost = now.1, isBroken = now.2
            let x = pos.0, y = pos.1

            if x == e[0] - 1 && y == e[1] - 1 {
                return cost
            }
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if array[nx][ny] == 0 && !visited[nx][ny][isBroken] {
                    visited[nx][ny][isBroken] = true
                    queue.append(((nx, ny), cost + 1, isBroken))
                } else if array[nx][ny] == 1 && isBroken == 0 {
                    if visited[nx][ny][1] == false {
                        visited[nx][ny][1] = true
                        queue.append(((nx, ny), cost + 1, 1))
                    }
                }
            }
            
            index += 1
        }
        
        return -1
    }

    return bfs(start: (h[0] - 1, h[1] - 1))
}

print(solution(array, n, m, h, e))
