//
//  Baekjoon17626.swift
//  
//
//  Created by 임현규 on 2023/05/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var d = Array(repeating: 0, count : n + 1)
    
    d[1] = 1
    
    for i in 2..<n + 1 {
        var targetNum = 1
        var minValue  = 4
        
        while Int(pow(Double(targetNum), Double(2))) <= i {
            
            minValue = min(minValue, d[i - Int(pow(Double(targetNum), Double(2)))])
            targetNum += 1
        }
        
        d[i] = minValue + 1
    }
            
    return d[n]
}

print(solution(n))
