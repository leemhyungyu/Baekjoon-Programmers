//
//  Baekjoon1188.swift
//  Solved
//
//  Created by 임현규 on 5/28/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

func solution(_ n: Int, _ m: Int) -> Int {
    return m - gcd(n, m)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}

print(solution(n, m))
