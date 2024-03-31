//
//  Baekjoon18353.swift
//  Solved
//
//  Created by 임현규 on 2024/03/31.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: 1, count: n + 1)
    var result = 0
    var count = 0
    
    for i in 1..<array.count {
        for j in 0..<i {
            if array[j] > array[i] {
                d[i] = max(d[i], d[j] + 1)
            }
        }
    }
    
    return n - d.max()!
}

print(solution(array, n))
