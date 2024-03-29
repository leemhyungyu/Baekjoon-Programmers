//
//  Baekjoon1309.swift
//  Solved
//
//  Created by 임현규 on 2024/03/29.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    d[1][0] = 1
    d[1][1] = 1
    d[1][2] = 1
    
    if n == 1 { return d[n].reduce(0) { $0 + $1 }}
    
    for i in 2...n {
        d[i][0] = (d[i - 1][1] * 2 + d[i - 2][1]) % 9901
        d[i][1] = (d[i - 1][0] * 2 + d[i - 2][0]) % 9901
        d[i][2] = (d[i - 1].reduce(0) { $0 + $1 }) % 9901
    }
    
    return (d[n].reduce(0) { $0 + $1 }) % 9901
}

print(solution(n))
