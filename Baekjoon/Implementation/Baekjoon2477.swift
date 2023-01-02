//
//  Baekjoon2477.swift
//  
//
//  Created by 임현규 on 2023/01/02.
//

import Foundation

let k = Int(readLine()!)!

var sideArray = [[Int]]()
var row = 0
var column = 0
var temp = 1

for _ in 1...6 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    switch input[0] {
    case 1, 2:
        if input[1] > row {
            row = input[1]
        }
    case 3, 4:
        if input[1] > column {
            column = input[1]
        }
    default:
        break
    }
    sideArray.append(input)
}

for i in 1...sideArray.count {
    if sideArray[(i - 1) % 6][0] == sideArray[(i + 1) % 6][0] {
        temp *= sideArray[i % 6][1]
    }
}

print((row * column - temp) * k)
