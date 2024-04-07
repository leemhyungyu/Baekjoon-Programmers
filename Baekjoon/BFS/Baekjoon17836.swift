//
//  Baekjoon17836.swift
//  Solved
//
//  Created by 임현규 on 2024/04/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], t = input[2]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> String {
    var array = array
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var posOfGram = (0, 0)
    var valueOfGram = 0
    
    func bfs(_ start: (Int, Int)) {
        var queue = [start]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] == 1 { continue }
                
                if array[nx][ny] == 0 {
                    array[nx][ny] = array[x][y] + 1
                    queue.append((nx, ny))
                } else if array[nx][ny] == 2 {
                    posOfGram = (nx, ny)
                    valueOfGram = array[x][y] + 1
                }
                visited[nx][ny] = true
            }
        }
    }
    
    bfs((0, 0))
    
    let gramRouteValue = valueOfGram != 0 ? n - 1 - posOfGram.0 + m - 1 - posOfGram.1 + valueOfGram : 0
    let result = array[n - 1][m - 1] == 0 ? gramRouteValue : min(array[n - 1][m - 1], gramRouteValue)
    
    return result > t || result == 0  ? "Fail" : "\(result)"
}

print(solution(array, n, m))
