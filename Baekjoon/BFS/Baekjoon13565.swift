//
//  Baekjoon13565.swift
//  Solved
//
//  Created by 임현규 on 2024/03/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.map { Int(String($0))! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> String {
    var array = array
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    func bfs(_ start: (Int, Int)) {
        var queue = [start]
        
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            array[x][y] = 2
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] != 0 { continue }
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    for i in 0..<m {
        if array[0][i] == 0 && !visited[0][i] {
            bfs((0, i))
        }
    }
    
    return array[n - 1].filter { $0 == 2 }.isEmpty ? "NO" : "YES"
}

print(solution(array, n, m))
