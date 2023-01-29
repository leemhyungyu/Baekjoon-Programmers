//
//  Baekjoon15903.swift
//  
//
//  Created by 임현규 on 2023/01/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var cardArray = readLine()!.split(separator: " ").map { UInt($0)! }.sorted { $0 < $1 }

if m != 0 {
    for _ in 1...m {
        let plusResult = cardArray[0] + cardArray[1]
        cardArray[0] = plusResult
        cardArray[1] = plusResult
        
        cardArray.sort { $0 < $1 }
    }
}

print(cardArray.reduce(0, +))
