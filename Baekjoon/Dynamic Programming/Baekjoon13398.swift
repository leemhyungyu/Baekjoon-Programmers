//
//  Baekjoon13398.swift
//  Solved
//
//  Created by 임현규 on 2024/04/12.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 2), count: n)
    d[0][0] = array[0]
    d[0][1] = array[0]
    
    for i in 1..<n {
        d[i][0] = max(d[i - 1][0] + array[i], array[i])
        d[i][1] = max(d[i - 1][0], d[i - 1][1] + array[i])
    }
        
    return d.flatMap { $0 }.max()!
}

print(solution(array, n))
