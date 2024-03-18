//
//  Baekjoon1699.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: Int.max, count: 100002)
    d[1] = 1
    d[2] = 2
    d[3] = 3
    
    if n < 4 { return d[n] }
    
    for i in 1...316 {
        d[i * i] = 1
    }
    
    for i in 4...n {
        if d[i] != Int.max { continue }
        for j in 1..<i + 1 {
            if j * j > i { break }
            d[i] = min(d[i], d[i - j * j] + 1)
        }
    }
    
    return d[n]
}

print(solution(n))
