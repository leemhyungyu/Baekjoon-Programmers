//
//  Baekjoon1058.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

let n = Int(readLine()!)!
var array = [[String]]()

for _ in 0..<n {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]], _ n: Int) -> Int {
    var result = 0
    var friends: [Set<Int>] = Array(repeating: [], count: n)
    var visited = Array(repeating: false, count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if array[i][j] == "N" { continue }
            friends[i].insert(j)
            friends[j].insert(i)
        }
    }
    
    func bfs(_ start: Int) -> Int {
        var queue = [(start, 0)]
        var friendCount = 0
        visited[start] = true
        
        while !queue.isEmpty {
            let temp = queue.removeLast()
            let person = temp.0, count = temp.1
            
            for i in friends[person] {
                if visited[i] { continue }
                if count > 1 { continue }
                queue.append((i, count + 1))
                friendCount += 1
                visited[i] = true
            }
        }
        
        return friendCount
    }
    
    for i in 0..<n {
        visited = Array(repeating: false, count: n)
        result = max(bfs(i), result)
    }
    
    return result
}

print(solution(array, n))
