//
//  Baekjoon1245.swift
//  Solved
//
//  Created by 임현규 on 2024/04/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, -1), (1, -1), (-1, 1)]
    var isSet = Array(repeating: Array(repeating: false, count: m), count: n)
    var result = 0
    
    func bfs(_ start: (Int, Int)) -> Bool {
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var queue = [start]
        var isTop = true
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let x = now.0, y = now.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                
                if visited[nx][ny] { continue }
                visited[nx][ny] = true
                
                if array[nx][ny] > array[x][y] {
                    isTop = false
                } else if array[nx][ny] == array[x][y] {
                    queue.append((nx, ny))
                    isSet[nx][ny] = true
                }
            }
        }
        
        return isTop
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            if isSet[i][j] || array[i][j] == 0 { continue }
            if bfs((i, j)) {
                result += 1
            }
        }
    }
    return result
}

print(solution(array, n, m))
