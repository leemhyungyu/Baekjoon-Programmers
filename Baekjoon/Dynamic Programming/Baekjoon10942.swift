//
//  Baekjoon10942.swift
//  Solved
//
//  Created by 임현규 on 6/28/24.
//

import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var question = [[Int]]()
for _ in 0..<m {
    question.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ numbers: [Int], _ question: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var d = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        d[i][i] = true
    }
    
    for i in 0..<n - 1 {
        if numbers[i] == numbers[i + 1] {
            d[i][i + 1] = true
        }
    }
    
    for i in (0..<n - 2).reversed() {
        for j in i + 2..<n {
            if numbers[i] == numbers[j] && d[i + 1][j - 1] {
                d[i][j] = true
            }
        }
    }
    
    return question.map { d[$0[0] - 1][$0[1] - 1] ? 1 : 0 }
}

solution(numbers, question, n, m).forEach { print($0) }
