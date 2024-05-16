//
//  Baekjoon17089.swift
//  Solved
//
//  Created by 임현규 on 2024/05/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var friends = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    var graph = Array(repeating: [Int](), count: n + 1)
    var temp = [[Int]]()
    var result = Int.max
    
    for i in array {
        friends[i[0]][i[1]] = true
        friends[i[1]][i[0]] = true
        graph[i[0]] += [i[1]]
        graph[i[1]] += [i[0]]
    }
    for a in 1..<n + 1 {
        for b in a + 1..<n + 1{
            if !friends[a][b] { continue }
            for c in b + 1..<n + 1 {
                if !friends[a][c] || !friends[b][c] { continue }
                result = min(result, [a, b, c].map { graph[$0].count }.reduce(0) { $0 + $1 } - 6)
            }
        }
    }
        
    return result == Int.max ? -1 : result
}

print(solution(array, n, m))
