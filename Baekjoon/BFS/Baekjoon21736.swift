//
//  Baekjoon21736.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[String]]()

for _ in 0..<n {
    array.append(readLine()!.map { String($0) })
}


func solution(_ array: [[String]], _ n: Int, _ m: Int) -> String {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    func bfs(_ start: (Int, Int)) -> Int {
        var queue = [start]
        var count = 0
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeLast()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                visited[nx][ny] = true
                if array[nx][ny] == "X" { continue }
                if array[nx][ny] == "P" { count += 1 }
                queue.append((nx, ny))
            }
        }
        
        return count
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] == "I" {
                result = bfs((i, j))
            }
        }
    }
    return result == 0 ? "TT" : String(result)
}


print(solution(array, n, m))
