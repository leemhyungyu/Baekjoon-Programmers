//
//  Baekjoon1303.swift
//  Solved
//
//  Created by 임현규 on 2024/03/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[String]]()

for _ in 0..<m {
    array.append(readLine()!.map { String($0) })
}
func solution(_ array: [[String]], _ n: Int, _ m: Int) -> (Int, Int) {
    var myTeam = 0
    var anotherTeam = 0
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    
    func bfs(_ start: (Int, Int)) -> Int {
        var queue = [start]
        var target = array[start.0][start.1]
        var count = 1
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<m).contains(nx) || !(0..<n).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] != target { continue }
                count += 1
                queue.append((nx, ny))
                visited[nx][ny] = true
            }
        }
        
        return count * count
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if visited[i][j] { continue }
            if array[i][j] == "W" {
                myTeam += bfs((i, j))
            } else {
                anotherTeam += bfs((i, j))
            }
        }
    }
    
    return (myTeam, anotherTeam)
}

let result = solution(array, n, m)
print(result.0, result.1)
