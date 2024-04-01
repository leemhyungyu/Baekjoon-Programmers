//
//  Baekjoon1850.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0], b = input[1]

func solution(_ a: Int, _ b: Int) -> String {
    var result = ""

    for i in 1..<10000000 {
        if a % i == 0 && b % i == 0 {
            result = Array(repeating: 1, count: i).map { String($0) }.joined()
        }
    }
    return result
}

print(solution(a, b))
