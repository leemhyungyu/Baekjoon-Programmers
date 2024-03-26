//
//  Baekjoon1389.swift
//  Solved
//
//  Created by 임현규 on 2024/03/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var visited = Array(repeating: false, count: n + 1)
    var friends: [[Int]] = Array(repeating: [], count: n + 1)
    var kavin = [Int: Int]()

    for i in array {
        friends[i[0]].append(i[1])
        friends[i[1]].append(i[0])
    }
    
    func bfs(_ start: Int) -> Int {
        var queue = [start]
        var result = Array(repeating: 0, count: n + 1)
        result[start] = 0
        visited[start] = true
        
        while !queue.isEmpty {
            let s = queue.removeFirst()
            
            for i in friends[s] {
                if visited[i] { continue }
                queue.append(i)
                visited[i] = true
                result[i] = result[s] + 1
            }
        }
        
        return result.reduce(0) { $0 + $1 }
    }
    
    for i in 1...n {
        visited = Array(repeating: false, count: n + 1)
        kavin[i] = bfs(i)
    }
    
    return kavin.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }.first!.key
}


print(solution(array, n, m))
