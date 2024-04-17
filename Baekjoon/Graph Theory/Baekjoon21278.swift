//
//  Baekjoon21278.swift
//  Solved
//
//  Created by 임현규 on 2024/04/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var graph = Array(repeating: Array(repeating: 101, count: n + 1), count: n + 1)
    var result = (0, 0)
    var value = Int.max
    
    for i in array {
        graph[i[0]][i[1]] = 1
        graph[i[1]][i[0]] = 1
    }

    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if i == j { graph[i][j] = 0 }
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    
    for i in 1...n - 1 {
        for j in i + 1...n {
            var sum = 0
            for k in 1...n {
                if k == i || k == j { continue }
                sum += min(graph[k][i], graph[k][j]) * 2
            }
            
            if sum < value {
                result = (i, j)
                value = sum
            }
        }
    }
    
    return [result.0, result.1, value]
}

print(solution(array, n, m).map { String($0) }.joined(separator: " "))
