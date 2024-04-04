//
//  Baekjoon3184.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1]
var array = [[String]]()
for _ in 0..<r {
    array.append(readLine()!.map { String($0) })
}

func solution(_ r: Int, _ c: Int, _ array: [[String]]) -> [Int] {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    
    func bfs(_ start: (Int, Int)) -> (Int, Int) {
        var queue = [start]
        var wolfCount = 0, sheepCount = 0

        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let x = now.0, y = now.1
            
            if array[x][y] == "v" {
                wolfCount += 1
            } else if array[x][y] == "o" {
                sheepCount += 1
            }
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] == "#" { continue }
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
        
        return sheepCount > wolfCount ? (sheepCount, 0) : (0, wolfCount)
    }
    
    var sheepCount = 0, wolfCount = 0
    for i in 0..<r {
        for j in 0..<c {
            if array[i][j] != "#" && array[i][j] != "." && !visited[i][j] {
                let count = bfs((i, j))
                sheepCount += count.0
                wolfCount += count.1
            }
        }
    }
        
    return [sheepCount, wolfCount]
}

solution(r, c, array).forEach { print($0, terminator: " ") }
