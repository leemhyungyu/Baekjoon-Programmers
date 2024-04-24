//
//  Baekjoon12931.swift
//  Solved
//
//  Created by 임현규 on 2024/04/24.
//

import Foundation

let n = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map { Int($0)! }
let a = Array(repeating: 0, count: n)

func solution(_ a: [Int], _ b: [Int], _ n: Int) -> Int {
    var a = a, b = b
    var result = 0
    
    while b.filter { $0 == 0 }.count != n {
        var isExistOdd = false
        for i in 0..<n {
            if b[i] % 2 != 0 {
                b[i] -= 1
                result += 1
                isExistOdd = true
            }
        }
        
        if !isExistOdd {
            b = b.map { $0 / 2 }
            result += 1
        }
    }
    
    return result
}

print(solution(a, b, n))
