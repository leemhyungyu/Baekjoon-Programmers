//
//  Baekjoon2023.swift
//  Solved
//
//  Created by 임현규 on 2024/04/29.
//

import Foundation

let n = Int(readLine()!)!

extension Int {
    var isPrime: Bool {
        if self < 2 { return false }
        
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 { return false }
        }
        
        return true
    }
}

func solution(_ n: Int) {
    findPrime(2, n - 1)
    findPrime(3, n - 1)
    findPrime(5, n - 1)
    findPrime(7, n - 1)
}

func findPrime(_ n: Int, _ count: Int) {
    if count == 0 { print(n) }
    
    for i in 1..<10 where i % 2 != 0 {
        let temp = n * 10 + i
        if temp.isPrime { findPrime(temp, count - 1) }
    }
}

solution(n)

