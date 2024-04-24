//
//  Baekjoon1240.swift
//  Solved
//
//  Created by 임현규 on 2024/04/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var distances = Array(repeating: [(Int, Int)](), count: n + 1)
var nodes = [[Int]]()

for _ in 0..<n - 1 {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    distances[input[0]] += [(input[1], input[2])]
    distances[input[1]] += [(input[0], input[2])]
}

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.append([input[0], input[1]])
}

func solution(_ distances: [[(Int, Int)]], _ nodes: [[Int]], _ n: Int, _ m: Int) {
    var visited = Array(repeating: false, count: n + 1)
    var result = Array(repeating: 0, count: n + 1)
    
    func bfs(_ start: Int, _ end: Int) -> Int {
        var queue = [(start, 0)]
        visited[start] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let nowNode = now.0, nowDistance = now.1
            
            if nowNode == end {
                return nowDistance
            }
            
            for i in distances[nowNode] {
                let nextNode = i.0, nextDistance = i.1
                if visited[nextNode] { continue }
                visited[nextNode] = true
                queue.append((nextNode, nowDistance + nextDistance))
            }
        }
        
        return 0
    }
    
    for node in nodes {
        visited = Array(repeating: false, count: n + 1)
        let startNode = node[0], endNode = node[1]
        print(bfs(startNode, endNode))
        
    }
}

solution(distances, nodes, n, m)
