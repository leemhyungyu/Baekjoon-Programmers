//
//  Baekjoon2847.swift
//  
//
//  Created by 임현규 on 2023/01/25.
//

import Foundation

var n = Int(readLine()!)!
var levelArray = [Int]()
var result = 0

for _ in 0...n - 1{
    levelArray.append(Int(readLine()!)!)
}

for i in (1...n - 1).reversed() {
    if levelArray[i] <= levelArray[i - 1] {
        result += levelArray[i - 1] - levelArray[i] + 1
        levelArray[i - 1] = levelArray[i] - 1
    }
}

print(result)
