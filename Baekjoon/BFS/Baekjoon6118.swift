//
//  Baekjoon6118.swift
//  Solved
//
//  Created by 임현규 on 2024/04/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var result: [[Int]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var maxLength = 0
    for i in array {
        graph[i[0]] += [i[1]]
        graph[i[1]] += [i[0]]
    }
    
    func bfs(_ start: Int) {
        var queue = [(start, 0)]
        visited[start] = true
        
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            let now = temp.0, length = temp.1
            maxLength = max(length, maxLength)
            result[length] += [now]
            
            for i in graph[now] {
                if visited[i] { continue }
                queue.append((i, length + 1))
                visited[i] = true
            }
        }
    }

    bfs(1)

    let number = result[maxLength].min()!
    let count = result[maxLength].count
    return [number, maxLength, count]
}

solution(array, n, m).forEach { print($0, terminator: " ")}
