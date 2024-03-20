//
//  Baekjoon2011.swift
//  
//
//  Created by 임현규 on 2024/03/20.
//

import Foundation

let n = readLine()!

func solution(_ n: String) -> Int {
    var n = n.map { String($0) }
    var d = Array(repeating: 0, count: n.count + 1)
    
    d[0] = 1
    d[1] = 1
    
    if n.first! == "0" { return 0 }
    if n.count < 2 { return d[n.count] }
    
    for i in 2...n.count {
        if Int(n[i - 1])! > 0 { d[i] += d[i - 1] % 1000000  }

        if (10...26).contains(Int(n[i - 2] + n[i - 1])!) {
            d[i] += d[i - 2] % 1000000
        }
    }
    
    return d[n.count] % 1000000
}

print(solution(n))
