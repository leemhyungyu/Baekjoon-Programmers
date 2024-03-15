//
//  Baekjoon11047.swift
//  
//
//  Created by 임현규 on 2024/03/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var coins = [Int]()

for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

func solution(_ coins: [Int], _ k: Int) -> Int {
    var result = 0
    var k = k
    var coins = coins.sorted { $0 > $1 }
    
    for coin in coins {
        if k >= coin {
            result += k / coin
            k %= coin
        }
    }
    
    return result
}

print(solution(coins, k))
