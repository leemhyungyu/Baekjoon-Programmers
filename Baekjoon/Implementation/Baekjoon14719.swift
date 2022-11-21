//
//  Baekjoon14719.swift
//  
//
//  Created by 임현규 on 2022/11/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let h = input[0], w = input[1]

var blockArray = readLine()!.split(separator: " ").map { Int($0)! }

var maxIndex = 0
var temp = 0
var maxValue = 0
var totalBlockValue = 0
var result = 0

for i in 0...w - 1 {
    totalBlockValue += blockArray[i]
    if maxValue < blockArray[i] {
        maxValue = blockArray[i]
        maxIndex = i
    }
}


for i in 0...maxIndex {
    if temp < blockArray[i] {
        temp = blockArray[i]
    }
    
    result += temp
}

temp = 0

for i in (maxIndex...w - 1).reversed() {
    if temp < blockArray[i] {
        temp = blockArray[i]
    }
    
    result += temp
}

print(result - totalBlockValue - maxValue)
