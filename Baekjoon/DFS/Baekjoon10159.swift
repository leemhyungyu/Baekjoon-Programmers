//
//  Baekjoon10159.swift
//  Solved
//
//  Created by 임현규 on 6/5/24.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}


func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var result = Array(repeating: 0, count: n)
    var visited = Array(repeating: false, count: n)
    var upGraph = Array(repeating: [Int](), count: n)
    var downGraph = Array(repeating: [Int](), count: n)
    
    for i in array {
        let a = i[0] - 1, b = i[1] - 1
        upGraph[a] += [b]
        downGraph[b] += [a]
    }
    
    func dfs(_ start: Int, _ now: Int, _ count: Int, _ graph: inout [[Int]]) {
        visited[now] = true
        
        for i in graph[now] {
            if visited[i] { continue }
            dfs(start, i, count + 1, &graph)
        }
    }
    
    for i in 0..<n {
        visited = Array(repeating: false, count: n)
        dfs(i, i, 0, &upGraph)
        dfs(i, i, 0, &downGraph)
        result[i] = visited.filter { !$0 }.count
    }
    
    
    return result
}

solution(array, n, m).forEach { print($0) }
