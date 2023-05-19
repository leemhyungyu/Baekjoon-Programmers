//
//  Baekjoon11057.swift
//  
//
//  Created by 임현규 on 2023/05/19.
//
import Foundation

let n = Int(readLine()!)!

func solution(_ number: Int) -> Int {
    
    var d = Array(repeating: 1, count: 10)
    
    for _ in 1..<number {
        for j in 1..<10 {
            d[j] = (d[j - 1] + d[j]) % 10007
        }
    }
   
    return d.reduce(0) { ($0 + $1) % 10007}
}

print(solution(n))
