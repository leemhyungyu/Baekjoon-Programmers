//
//  Baekjoon16562.swift
//  Solved
//
//  Created by 임현규 on 2024/05/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[2]
let money = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ money: [Int], _ n: Int, _ m: Int, _ k: Int) -> String {
    var visited = Array(repeating: false, count: n)
    var graph = Array(repeating: [Int](), count: n)
    var result = 0
    
    for i in array {
        graph[i[0] - 1] += [i[1] - 1]
        graph[i[1] - 1] += [i[0] - 1]
    }
    
    func bfs(_ start: Int) -> Int {
        var cost = money[start]
        var queue = [start]
        visited[start] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            for next in graph[now] {
                if visited[next] { continue }
                let nextCost = money[next]
                cost = min(cost, nextCost)
                queue.append(next)
                visited[next] = true
            }
        }
        return cost
    }
    
    for i in 0..<n {
        if visited[i] { continue }
        result += bfs(i)
    }
    
    return k >= result ? String(result) : "Oh no"
}

print(solution(array, money, n, m, k))
