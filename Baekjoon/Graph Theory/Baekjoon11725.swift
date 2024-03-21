//
//  Baekjoon11725.swift
//  
//
//  Created by 임현규 on 2024/03/22.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append(input)
}

func solution(_ array: [[Int]], _ n: Int) {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var result = Array(repeating: 0, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    for i in array {
        graph[i[0]].append(i[1])
        graph[i[1]].append(i[0])
    }
    
    func bfs(_ start: Int) {
        var queue = [start]
        visited[start] = true
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for i in graph[node] {
                if visited[i] { continue }
                result[i] = node
                queue.append(i)
                visited[i] = true
            }
        }
    }
    
    bfs(1)
    
    (2...n).forEach { print(result[$0]) }
}

solution(array, n)
