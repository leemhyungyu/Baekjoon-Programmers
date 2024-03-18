//
//  Baekjoon2805.swift
//  
//
//  Created by 임현규 on 2024/03/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ trees: [Int], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var trees = trees.sorted { $0 < $1 }
    var start = 0
    var end = trees.last!
    
    while start <= end {
        var height = (end + start) / 2
        var length = trees.map { max(0, $0 - height) }.reduce(0) { $0 + $1 }
        if length < m {
            end = height - 1
        } else if length >= m {
            start = height + 1
            result = max(height, result)
        }
    }
    
    return result
}

print(solution(trees, n, m))
