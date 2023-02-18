//
//  Baekjoon1041.swift
//  
//
//  Created by 임현규 on 2023/02/18.
//

import Foundation

let n = Int(readLine()!)!
var dice = readLine()!.split(separator: " ").map { Int($0)! }

var sortedDice = dice.sorted()
var threeDice = [[0, 1, 2], [0, 1, 3], [0, 3, 4], [0, 2, 4], [1, 3, 5], [1, 2, 5], [2, 4, 5], [2, 1, 5], [3, 4, 5]]
var twoDice = [[0, 1], [0, 2], [0, 3], [0, 4], [1, 2], [1, 3], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5]]
var threeDiceValue = Int.max, twoDiceValue = Int.max
var oneDiceValue = sortedDice.first!

if n == 1 {
    sortedDice.removeLast()
    
    print(sortedDice.reduce(0) {$0 + $1})
} else {
    for i in threeDice {
        if threeDiceValue > dice[i[0]] + dice[i[1]] + dice[i[2]] {
            threeDiceValue = dice[i[0]] + dice[i[1]] + dice[i[2]]
        }
    }

    for i in twoDice {
        if twoDiceValue > dice[i[0]] + dice[i[1]] {
            twoDiceValue = dice[i[0]] + dice[i[1]]
        }
    }

    print(
        ((n - 2) * 4 * (n - 1) + (n - 2) * (n - 2)) * oneDiceValue +
        (((n - 1) * 4) + (n - 2) * 4) * twoDiceValue +
        (4 * threeDiceValue)
    )
}
