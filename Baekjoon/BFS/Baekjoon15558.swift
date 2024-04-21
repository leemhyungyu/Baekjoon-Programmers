//
//  Baekjoon15558.swift
//  Solved
//
//  Created by 임현규 on 2024/04/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
let left = readLine()!.map { Int(String($0))! }
let right = readLine()!.map { Int(String($0))! }

func solution(_ left: [Int], _ right: [Int], _ n: Int, _ k: Int) -> Int {
    var array = [left, right]
    var count = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: 2)
    
    
    func bfs(_ start: (Int, Int)) -> Bool {
        var queue = [(start, count)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, count = now.1
            let x = pos.0, y = pos.1
            let dxdy = [(x, y + 1), (x, y - 1), (x + 1, y + k), (x - 1, y + k)]
            
            for i in dxdy {
                let nx = i.0, ny = i.1
                if (0..<2).contains(nx) && ny >= n { return true }
                if !(0..<2).contains(nx) || !(0..<n).contains(ny) || (0...count).contains(ny) { continue }
                if visited[nx][ny] { continue }
                if array[nx][ny] == 0 { continue }
                queue.append(((nx, ny), count + 1))
                visited[nx][ny] = true
            }
        }
        
        return false
    }
    
    return bfs((0, 0)) ? 1 : 0
}

print(solution(left, right, n, k))
