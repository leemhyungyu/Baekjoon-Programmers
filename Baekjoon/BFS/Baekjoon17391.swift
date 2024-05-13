//
//  Baekjoon17391.swift
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
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    func bfs(start: (Int, Int)) -> Int {
        var queue = [(start, 0)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, count = now.1
            let x = pos.0, y = pos.1
            
            if x == n - 1 && y == m - 1 {
                return count
            }
            
            for dx in 1...array[x][y] {
                let nx = dx + x, ny = y
                if !(0..<n).contains(nx) { continue }
                if visited[nx][ny] { continue }
                queue.append(((nx, ny), count + 1))
                visited[nx][ny] = true
            }
            
            for dy in 1...array[x][y] {
                let ny = dy + y, nx = x
                if !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                queue.append(((nx, ny), count + 1))
                visited[nx][ny] = true
            }
        }
        
        return 0
    }
    
    return bfs(start: (0, 0))
}

print(solution(array, n, m))
