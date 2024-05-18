//
//  Baekjoon10713.swift
//  Solved
//
//  Created by 임현규 on 5/18/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let p = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()

for _ in 0..<n - 1 {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ p: [Int], _ n: Int, _ m: Int) -> Int {
    var costs = Array(repeating: 0, count: n)
    var count = Array(repeating: 0, count: n)
    var result = 0

    for i in 0..<n - 1 {
        costs[i] = array[i][0]
    }
    
    for i in 0..<m - 1 {
        var from = p[i] - 1, to = p[i + 1] - 1
        if p[i] > p[i + 1] {
            from = p[i + 1] - 1
            to = p[i] - 1
        }
        
        count[from] += 1
        count[to] -= 1
    }
    
    for i in 1..<n {
        count[i] += count[i - 1]
    }
    
    for i in 0..<n - 1 {
        if costs[i] * count[i] > count[i] * array[i][1] + array[i][2] {
            result += array[i][2]
            costs[i] = array[i][1]
        }
    }
    
    for i in 0..<n - 1 {
        result += costs[i] * count[i]
    }

    return result
}

print(solution(array, p, n, m))
