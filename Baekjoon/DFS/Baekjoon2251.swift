//
//  Baekjoon2251.swift
//  Solved
//
//  Created by 임현규 on 7/4/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0], b = input[1], c = input[2]

func solution(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
    let maxA = a, maxB = b, maxC = c
    var result = Set<Int>()
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c + 1), count: b + 1), count: a + 1)

    func dfs(_ a: Int, _ b: Int, _ c: Int) {
        if visited[a][b][c] { return }
        visited[a][b][c] = true
        
        if a == 0 { result.insert(c) }
    
        dfs(a + min(maxA - a, c), b, max(0, c - maxA + a))
        dfs(a, b + min(maxB - b, c), max(0, c - maxB + b))
        dfs(a + min(maxA - a, b), max(0, b - maxA + a), c)
        dfs(a, max(0, b - maxC + c), c + min(maxC - c, b))
        dfs(max(0, a - maxB + b), b + min(maxB - b, a), c)
        dfs(max(0, a - maxC + c), b, c + min(maxC - c, a))
    }
    
    dfs(0, 0, c)
    return Array(result).sorted()
}

print(solution(a, b, c).map { String($0) }.joined(separator: " "))
