//
//  Baekjoon13023.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}
func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var friend = Array(repeating: [Int](), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    
    for i in array {
        friend[i[0]] += [i[1]]
        friend[i[1]] += [i[0]]
    }
    var result = 0
    
    func dfs(_ start: Int, _ count: Int) {
        visited[start] = true

        if count >= 4 {
            result = 1
            return
        }
        
        for i in friend[start] {
            if visited[i] { continue }
            dfs(i, count + 1)
            visited[i] = false
        }
    }
    
    for i in 0..<n {
        if result == 1 { break }
        visited = Array(repeating: false, count: n + 1)
        dfs(i, 0)
    }
    
    return result
}

print(solution(array, n, m))
