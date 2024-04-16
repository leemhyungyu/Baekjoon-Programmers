//
//  Baekjoon14567.swift
//  Solved
//
//  Created by 임현규 on 2024/04/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var subject = Array(repeating: [Int](), count: n + 1)
    var inDegree = Array(repeating: 0, count: n + 1)
    var result = Array(repeating: 1, count: n + 1)
    var queue = [Int]()
    var count = 2
    
    for i in array {
        subject[i[0]] += [i[1]]
        inDegree[i[1]] += 1
    }
    
    for i in 1...n {
        if inDegree[i] == 0 { queue.append(i) }
    }
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let now = queue.removeFirst()
            for next in subject[now] {
                inDegree[next] -= 1
                if inDegree[next] == 0 {
                    result[next] = count
                    queue.append(next)
                }
            }
        }
        
        count += 1
    }
    
    return Array(result[1...n])
}

print(solution(array, n, m).map { String($0) }.joined(separator: " "))
