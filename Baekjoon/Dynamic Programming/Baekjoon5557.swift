//
//  Baekjoon5557.swift
//  Solved
//
//  Created by 임현규 on 2024/04/08.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 21), count: n * 9 + 1)
    d[0][array.first!] = 1
    
    for i in 1..<array.count {
        for j in 0..<d[i - 1].count {
            if d[i - 1][j] == 0 { continue }
            
            if j + array[i] <= 20 {
                d[i][j + array[i]] += d[i - 1][j]
            }
            
            if j - array[i] >= 0 {
                d[i][j - array[i]] += d[i - 1][j]
                
            }
        }
    }
    
    return d[n - 2][array.last!]
}

print(solution(array, n))
