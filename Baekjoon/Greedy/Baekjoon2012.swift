//
//  Baekjoon2012.swift
//  
//
//  Created by 임현규 on 2023/02/03.
//

import Foundation

let n = Int(readLine()!)!
var rankArray = [Int]()
var result = 0
var realArray = (1...n).map { Int($0) }

for _ in 0...n - 1 {
    rankArray.append(Int(readLine()!)!)
}

rankArray.sort()

for i in 0...n - 1 {
    result += abs(rankArray[i] - realArray[i])
}

print(result)
