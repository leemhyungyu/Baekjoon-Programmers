//
//  Baekjoon5567.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}
func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var friend = Array(repeating: [Int](), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    for i in array {
        friend[i[0]].append(i[1])
        friend[i[1]].append(i[0])
    }
        
    func bfs(_ start: Int) -> Int {
        var queue = [(start, 0)]
        var count = 0
        visited[start] = true
        
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            let now = temp.0, depth = temp.1
            if depth == 2 { return count }
            for i in friend[now] {
                if visited[i] { continue }
                queue.append((i, depth + 1))
                visited[i] = true
                count += 1
            }
        }
        
        return count
    }

    result = bfs(1)
    
    return result
}

print(solution(array, n, m))
