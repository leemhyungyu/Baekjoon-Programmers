//
//  Baekjoon1189.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1], k = input[2]
var array = [[String]]()
for _ in 0..<r {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]], _ r: Int, _ c: Int, _ k: Int) -> Int {
    var result = 0
    var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    
    func dfs(_ now: (Int, Int), _ length: Int) {
        visited[now.0][now.1] = true
        
        if now == (0, c - 1) && length == k {
            result += 1
        }
            
        for i in dxdy {
            let nx = now.0 + i.0, ny = now.1 + i.1
            if !(0..<r).contains(nx) || !(0..<c).contains(ny) { continue }
            if visited[nx][ny] { continue }
            if array[nx][ny] == "T" { continue }
            dfs((nx, ny), length + 1)
            visited[nx][ny] = false
        }
    }
    
    dfs((r - 1, 0), 1)
    
    return result
}

print(solution(array, r, c, k))

