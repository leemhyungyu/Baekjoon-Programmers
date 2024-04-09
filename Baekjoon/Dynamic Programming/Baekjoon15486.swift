//
//  Baekjoon15486.swift
//  Solved
//
//  Created by 임현규 on 2024/04/09.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var d = Array(repeating: 0, count: n + 2)
    var maxValue = 0
    
    for i in 1...n + 1 {
        if d[i] < d[i - 1] { d[i] = d[i - 1] }
        if i - 1 >= array.count { continue }
        if i + array[i - 1][0] > n + 1 { continue }
        
        d[i + array[i - 1][0]] = max(d[i] + array[i - 1][1], d[i + array[i - 1][0]])
    }

    return d[n + 1]
}

print(solution(array, n))
