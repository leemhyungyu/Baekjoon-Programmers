//
//  Baekjoon9095.swift
//  
//
//  Created by 임현규 on 2024/03/15.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(solution(n))
}

func solution(_ n: Int) -> Int {
    var d = Array(repeating: 0, count: 11)
    
    d[1] = 1
    d[2] = 2
    d[3] = 4
   
    for i in 4...n {
        d[i] = d[i - 3] + d[i - 2] + d[i - 1]
    }
    
    return d[n]
}
