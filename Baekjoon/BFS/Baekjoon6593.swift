//
//  Baekjoon6593.swift
//  Solved
//
//  Created by 임현규 on 2024/04/22.
//

import Foundation

let dxdy = [(0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1), (1, 0, 0), (-1, 0, 0)]
func solution(_ array: [[[String]]], _ l: Int, _ r: Int, _ c: Int) -> String {
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
    var isSuccess = false
    var result = 0
    
    func bfs(start: (Int, Int, Int)) -> Bool {
        var queue = [(start, 0)]
        visited[start.0][start.1][start.2] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, count = now.1
            let z = pos.0, x = pos.1, y = pos.2
            
            if array[z][x][y] == "E" {
                result = count
                return true
            }
            
            for i in dxdy {
                let nz = z + i.0, nx = x + i.1, ny = y + i.2
                
                if !(0..<l).contains(nz) || !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
                if visited[nz][nx][ny] { continue }
                if array[nz][nx][ny] == "#" { continue }
                queue.append(((nz, nx, ny), count + 1))
                visited[nz][nx][ny] = true
            }
        }
        
        return false
    }
    
    for z in 0..<l {
        for x in 0..<r {
            for y in 0..<c {
                if array[z][x][y] == "S" {
                    isSuccess = bfs(start: (z, x, y))
                }
            }
        }
    }
    
    return isSuccess ? "Escaped in \(result) minute(s)." : "Trapped!"
}

while true {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    let l = input[0], r = input[1], c = input[2]
    if l == 0 && r == 0 && c == 0 { break }
    var array = [[[String]]]()
    
    for _ in 0..<l {
        var temp = [[String]]()
        for _ in 0...r {
            let building = readLine()!.map { String($0) }
            if building.isEmpty { continue }
            temp.append(building)
        }
        
        array.append(temp)
    }
    
    print(solution(array, l, r, c))
}
