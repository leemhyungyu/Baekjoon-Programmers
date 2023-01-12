//
//  Baekjoon22858.swift
//  
//
//  Created by 임현규 on 2023/01/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var sArray = readLine()!.split(separator: " ").map { Int($0)! }
let dArray = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: 0, count: n)

for _ in 1...k {
    for i in 0...dArray.count - 1 {
        result[dArray[i] - 1] = sArray[i]
    }
    sArray = result
}

print(result.map { String($0) }.joined(separator:  " "))
