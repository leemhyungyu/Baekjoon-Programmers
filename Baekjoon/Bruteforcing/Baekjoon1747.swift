//
//  Baekjoon1747.swift
//  
//
//  Created by 임현규 on 2023/05/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var result = 0
    var targetNum = n
    
    while true {
        if isPrime(targetNum) {
            if isPalin(targetNum) {
                result = targetNum
                break
            }
        }
        
        targetNum += 1
    }

    return result
}

// 팰린드롬 판별
func isPalin(_ n: Int) -> Bool {

    let number = String(n).map { Int(String($0))! }
    let target = number.reversed().map { Int($0) }
    
    if number == target {
        return true
    } else {
        return false
    }
}

// 소수 판별
func isPrime(_ n: Int) -> Bool {

    if n <= 3 { return n == 1 ? false : true }

    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }

    return true
}

print(solution(n))
