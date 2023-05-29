//
//  Baekjoon17086.swift
//  
//
//  Created by 임현규 on 2023/05/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
var result = 0
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (1, -1), (-1, 1), (1, 1)]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]]) -> Int {

    for i in 0..<n {
        for j in 0..<m {
            visited = Array(repeating: Array(repeating: false, count: m), count: n)

            if array[i][j] != 1 {
                result = max(result, dfs(i, j, 1))
            }
        }
    }
    return result
}

func dfs(_ x: Int, _ y: Int, _ depth: Int) -> Int {
    
    var queue = [(x, y, depth)]
    visited[x][y] = true
    
    while !queue.isEmpty {
        let nxny = queue.removeFirst()
        
        for i in dxdy {
            let dx = i.0 + nxny.0
            let dy = i.1 + nxny.1
            
            if (0..<n).contains(dx) && (0..<m).contains(dy) && !visited[dx][dy] {
                if array[dx][dy] == 1 {
                    return nxny.2
                } else {
                    visited[dx][dy] = true
                    queue.append((dx, dy, nxny.2 + 1))
                }
            }
        }
    }
    
    return 0
}

print(solution(array))
