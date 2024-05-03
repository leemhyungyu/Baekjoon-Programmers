//
//  Baekjoon5052.swift
//  Solved
//
//  Created by 임현규 on 2024/05/03.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ numbers: [String], _ n: Int) -> String {
    var numbers = numbers.sorted { $0 < $1 }
    var result = true
    
    for i in 0..<n - 1 {
        if numbers[i].count > numbers[i + 1].count { continue }
        if numbers[i] == numbers[i + 1].map { String($0) }[0..<numbers[i].count].joined() {
            result = false
            break
        }
    }
    
    return result ? "YES" : "NO"
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    var numbers = [String]()
    
    for _ in 0..<n {
        numbers.append(readLine()!)
    }
    
    print(solution(numbers, n))
}

