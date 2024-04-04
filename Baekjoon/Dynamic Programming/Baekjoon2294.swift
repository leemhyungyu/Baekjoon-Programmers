//
//  Baekjoon2294.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ k: Int) -> Int {
    var coins = Array(Set(array)).sorted { $0 < $1 }
    var d = Array(repeating: 10001, count: 100001)
    
    for coin in coins {
        d[coin] = 1
    }
    
    for i in 1...k {
        for coin in coins {
            if i - coin < 0  { continue }
            d[i] = min(d[i], d[i - coin] + 1)
        }
    }
    
    
    return d[k] == 10001 ? -1 : d[k]
}

print(solution(array, n, k))
