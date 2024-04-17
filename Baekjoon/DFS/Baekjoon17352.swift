//
//  Baekjoon17352.swift
//  Solved
//
//  Created by 임현규 on 2024/04/17.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n - 2 {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> [Int] {
    var graph = Array(repeating: [Int](), count: n)
    var visited = Array(repeating: false, count: n)
    var first = -1, second = -1
    for i in array {
        graph[i[0] - 1] += [i[1] - 1]
        graph[i[1] - 1] += [i[0] - 1]
    }
    
    func dfs(_ now: Int) {
        visited[now] = true
        
        for next in graph[now] {
            if visited[next] { continue }
            dfs(next)
        }
    }
    
    for i in 0..<n {
        if visited[i] { continue }
        if first == -1 {
            first = i
        } else {
            second = i
        }
        dfs(i)
    }

    return [first + 1, second + 1]
}

print(solution(array, n).map { String($0) }.joined(separator: " "))
