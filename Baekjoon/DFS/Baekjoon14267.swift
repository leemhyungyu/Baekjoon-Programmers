//
//  Baekjoon14267.swift
//  Solved
//
//  Created by 임현규 on 2024/05/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ numbers: [Int], _ array: [[Int]], _ n: Int, _ m: Int) -> String {
    var graph = Array(repeating: [Int](), count: n + 1)
    var scoreArray = Array(repeating: 0, count: n + 1)
    var count = 0
    
    for i in 1...n {
        if numbers[i - 1] == -1 { continue }
        graph[numbers[i - 1]] += [i]
    }
    
    
    func dfs(_ now: Int, _ score: Int) {
        scoreArray[now] += score
        
        for i in graph[now] {
            dfs(i, scoreArray[now])
        }
    }
    
    for i in array {
        scoreArray[i[0]] += i[1]
    }
    
    dfs(1, 0)
    
    return scoreArray[1...n].map { String($0) }.joined(separator: " ")
    
}

print(solution(numbers, array, n, m))
