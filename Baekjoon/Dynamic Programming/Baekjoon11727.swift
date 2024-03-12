//
//  Baekjoon11727.swift
//  
//
//  Created by 임현규 on 2024/03/12.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: 0, count: n + 1)
    d[1] = 1
    d[2] = 3

    if n < 3 { return d[n] }
    
    for i in 3...n {
        d[i] = (d[i - 1] + d[i - 2] * 2) % 10007
    }
    
    return d[n]
}
