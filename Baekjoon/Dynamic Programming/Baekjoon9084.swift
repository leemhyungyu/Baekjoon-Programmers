//
//  Baekjoon9084.swift
//  Solved
//
//  Created by 임현규 on 2024/04/18.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ coins: [Int], _ number: Int, _ n: Int) -> Int {
    var d = Array(repeating: 0, count: number + 1)
    d[0] = 1
    
    for coin in coins {
        for i in stride(from: coin, through: number, by: 1) {
            if d[i] + d[i - coin] >= Int(pow(2.0, 31.0)) {
                d[i] = 0
            }
            d[i] += d[i - coin]
        }
    }
    return d[number]
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let number = Int(readLine()!)!
    print(solution(coins, number, n))
}
