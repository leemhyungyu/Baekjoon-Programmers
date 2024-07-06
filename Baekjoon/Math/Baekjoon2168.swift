//
//  Baekjoon2168.swift
//  Solved
//
//  Created by 임현규 on 7/6/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let x = input[0], y = input[1]

func solution(_ x: Int, _ y: Int) -> Int {
    return x + y - gcd(x, y)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}

print(solution(x, y))
