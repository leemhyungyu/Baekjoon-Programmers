//
//  Baekjoon11058.swift
//  Solved
//
//  Created by 임현규 on 2024/04/24.
//

import Foundation

let n = Int(readLine()!)!

func solutioin(_ n: Int) -> Int {
    var result = 0
    var d = Array(repeating: 0, count: 101)
    
    for i in 1...6 {
        d[i] = i
    }
    
    for i in 7...100 {
        for j in 3...i - 1 {
            if i - j - 2 > 0 {
                d[i] = max(d[j] + d[j] * (i - j - 2), d[i])
            }
        }
    }
    
    return d[n]
}

print(solutioin(n))
