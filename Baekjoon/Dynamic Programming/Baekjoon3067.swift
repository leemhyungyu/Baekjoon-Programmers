//
//  Baekjoon3067.swift
//  Solved
//
//  Created by 임현규 on 6/3/24.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ coins: [Int], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: 0, count: m + 1)
    
    d[0] = 1
    
    for i in 0..<n {
        for j in coins[i]...m {
            d[j] += d[j - coins[i]]
        }
    }
        
    return d[m]
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    print(solution(coins, n, m))
}
