//
//  Baekjoon27210.swift
//  Solved
//
//  Created by 임현규 on 6/19/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 2), count: n)
    
    if array[0] == 1 {
        d[0][0] = 1
    } else {
        d[0][1] = 1
    }
    
    for i in 1..<n {
        if array[i] == 1 {
            d[i][0] = max(d[i][0], d[i - 1][0] + 1)
            d[i][1] = max(d[i][1], d[i - 1][1] - 1)
        } else {
            d[i][0] = max(d[i][0], d[i - 1][0] - 1)
            d[i][1] = max(d[i][1], d[i - 1][1] + 1)
        }
    }
    
    return d.flatMap { $0 }.max()!
}

print(solution(array, n))
