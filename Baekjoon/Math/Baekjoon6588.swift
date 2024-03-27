//
//  Baekjoon6588.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

var isPrimeArray = Array(repeating: true, count: 1000001)

func setFrime(_ n: Int) {
    if n <= 1 { return }
    
    for i in 2...Int(sqrt(Double(n))) {
        if isPrimeArray[i] {
            for j in stride(from: i + i, to: n, by: i) {
                isPrimeArray[j] = false
            }
        }
    }
}

setFrime(1000000)

func solution(_ n: Int) -> String {
    
    for i in 3...n {
        if !isPrimeArray[i] { continue }
        
        var a = i, b = n - i
        if isPrimeArray[b] {
            return "\(n) = \(a) + \(b)"
        }
    }
    
    return "Goldbach's conjecture is wrong."
}

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    print(solution(n))
}
