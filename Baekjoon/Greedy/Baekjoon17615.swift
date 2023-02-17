//
//  Baekjoon17615.swift
//  
//
//  Created by 임현규 on 2023/02/17.
//

import Foundation

let n = Int(readLine()!)!
var blueCount = 0
var redCount = 0
var moveCount = 0
var result = Int.max

var ballArray = readLine()!.map { String($0) }

ballArray.forEach {
    if $0 == "B" {
        blueCount += 1
    } else {
        redCount += 1
    }
}

result = min(blueCount, redCount)

for i in 0...n - 1 {
    if ballArray[i] == ballArray.first! {
        moveCount += 1
    } else {
        break
    }
}

if ballArray.first! == "B" {
    result = min(result, blueCount - moveCount)
} else {
    result = min(result, redCount - moveCount)
}

moveCount = 0

for i in (0...n - 1).reversed() {
    if ballArray[i] == ballArray.last! {
        moveCount += 1
    } else {
        break
    }
}

if ballArray.last! == "B" {
    result = min(result, blueCount - moveCount)
} else {
    result = min(result, redCount - moveCount)
}

print(result)
