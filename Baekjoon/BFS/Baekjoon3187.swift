//
//  Baekjoon3187.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1]
var array = [[String]]()
for _ in 0..<r {
    array.append(readLine()!.map { String($0) })
}
func solution(_ array: [[String]], _ r: Int, _ c: Int) -> [Int] {
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    var wolfCount = 0, sheepCount = 0
    
    func bfs(_ start: (Int, Int)) -> [Int] {
        var queue = [start]
        var wolf = 0, sheep = 0
        
        if array[start.0][start.1] == "v" {
            wolf += 1
        } else {
            sheep += 1
        }
        
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeLast()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] == "#" { continue }
                if array[nx][ny] == "v" { wolf += 1}
                if array[nx][ny] == "k" { sheep += 1}
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
        
        return [sheep > wolf ? sheep : 0, sheep > wolf ? 0: wolf] // 양, 늑대
    }
    
    for i in 0..<r {
        for j in 0..<c {
            if array[i][j] == "." || array[i][j] == "#" || visited[i][j] { continue }
            let result = bfs((i, j))
            sheepCount += result[0]
            wolfCount += result[1]
        }
    }
    
    return [sheepCount, wolfCount]
}

solution(array, r, c).forEach { print($0, terminator: " ") }
