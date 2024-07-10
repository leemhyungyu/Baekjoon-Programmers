//
//  Baekjoon19539.swift
//  Solved
//
//  Created by 임현규 on 7/10/24.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> String {
    let total = array.reduce(0) { $0 + $1 }
    if total % 3 != 0 { return "NO" }
    return array.reduce(0) { $0 + $1 / 2 } >= total / 3 ? "YES" : "NO"
}

print(solution(array, n))
