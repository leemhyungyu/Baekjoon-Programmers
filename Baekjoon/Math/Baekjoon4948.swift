//
//  Baekjoon4948.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

func isFrime(_ n: Int) -> Bool {
    var isFrime = false
    if (1...3).contains(n) { return true }
    
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    
    return true
}

func solution(_ n: Int) -> Int {
    var result = 0
    
    for i in n + 1...2 * n {
        if isFrime(i) { result += 1}
    }
    
    return result
}

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    print(solution(n))
}
