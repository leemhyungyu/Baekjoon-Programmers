//
//  Baekjoon1325.swift
//  Solved
//
//  Created by 임현규 on 2024/03/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    array[input[1]] += [input[0]]
}

func solution(_ array: inout [[Int]], _ n: Int, _ m: Int) {
    var result = Array(repeating: 0, count: n + 1)
    var max = 0
    var visited = Array(repeating: false, count: n + 1)
    var count = 0

    for i in 1...n {
        visited = Array(repeating: false, count: n + 1)
        count = 0
        dfs(i, &count, &visited, &array)
        max = count > max ? count : max
        result[i] = count
    }
    
    for i in 1...n where result[i] == max {
        print(i, terminator: " ")
    }
}

func dfs(_ now: Int, _ count: inout Int, _ visited: inout [Bool], _ array: inout [[Int]]) {
    visited[now] = true
    count += 1

    for i in array[now] {
        if visited[i] { continue }
        dfs(i, &count, &visited, &array)
    }
}

solution(&array, n, m)
