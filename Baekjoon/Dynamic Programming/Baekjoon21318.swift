//
//  Baekjoon21318.swift
//  Solved
//
//  Created by 임현규 on 2024/05/12.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let q = Int(readLine()!)!
var questions = [[Int]]()

for _ in 0..<q {
    questions.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [Int], _ questions: [[Int]], _ n: Int, _ q: Int) -> [Int] {
    var result = Array(repeating: 0, count: q)
    var d = Array(repeating: 0, count: n + 1)
    
    for i in 1..<n {
        if array[i - 1] > array[i] {
            d[i + 1] = d[i] + 1
        } else {
            d[i + 1] = d[i]
        }
    }
    
    for i in 0..<q {
        let x = questions[i][0], y = questions[i][1]
        result[i] = d[y] - d[x]
    }
    
    return result
}

solution(array, questions, n, q).forEach { print($0) }
