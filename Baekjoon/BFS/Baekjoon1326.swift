//
//  Baekjoon1326.swift
//  Solved
//
//  Created by 임현규 on 2024/04/02.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0], b = input[1]

func solution(_ array: [Int], _ n: Int, _ a: Int, _ b: Int) -> Int {
    var result = Array(repeating: 0, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
        
    func bfs(_ start: Int) {
        var queue = [(start, 0)]
        visited[start] = true
        
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            let now = temp.0, count = temp.1
            result[now] = count
            
            for i in 1...n where (i - now) % array[now - 1]  == 0 {
                if visited[i] { continue }
                queue.append((i, count + 1))
                visited[i] = true
            }
        }
    }
    
    bfs(a)
    
    return visited[b] ? result[b] : -1
}

print(solution(array, n, a, b))
