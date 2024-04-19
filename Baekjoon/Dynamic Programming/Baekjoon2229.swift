//
//  Baekjoon2229.swift
//  Solved
//
//  Created by 임현규 on 2024/04/19.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }


func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: 0, count: n + 1)
    
    for i in 1...n {
        for j in (1...i).reversed() {
            let minValue = min(array[i - 1], array[j - 1])
            let maxValue = max(array[i - 1], array[j - 1])
            d[i] = max(d[i], d[j - 1] + maxValue - minValue)
        }
    }
    
    return d[n]
}

print(solution(array, n))
