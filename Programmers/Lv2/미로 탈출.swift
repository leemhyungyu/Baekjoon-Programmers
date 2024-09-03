//
//  미로 탈출.swift
//  Solved
//
//  Created by 임현규 on 9/3/24.
//

import Foundation

let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func solution(_ maps:[String]) -> Int {
    let maps = maps.map { $0.map { String($0) }}
    let n = maps.count, m = maps.first!.count
    var start = (0, 0)
    var lever = (0, 0)
    var exit = (0, 0)
    
    for i in 0..<n {
        for j in 0..<m {
            if maps[i][j] == "S" { start = (i, j) }
            if maps[i][j] == "L" { lever = (i, j) }
            if maps[i][j] == "E" { exit = (i, j) }
        }
    }
    
    func bfs(_ start: (Int, Int), _ target: (Int, Int)) -> Int? {
        var visited = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
        var queue = [(start, 1)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, count = now.1
            let x = pos.0, y = pos.1

            for i in dxdy {
                let nx = i.0 + x, ny = i.1 + y
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if maps[nx][ny] == "X" { continue }
                if (nx, ny) == target { return count }
                
                queue.append(((nx, ny), count + 1))
                visited[nx][ny] = true
            }
        }
        
        return nil
    }
    
    guard let startToLever = bfs(start, lever),
          let leverToExit = bfs(lever, exit) else { return -1 }

    return startToLever + leverToExit
}
