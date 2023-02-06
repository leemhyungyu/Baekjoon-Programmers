//
//  Baekjoon2437.swift
//  
//
//  Created by 임현규 on 2023/02/06.
//

import Foundation

let n = Int(readLine()!)!
var weightArray = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

weightArray.sort { $0 < $1 }

var checkNumber = weightArray.first! // 1

if n == 1 {
    if weightArray[0] > 1 {
        print(1)
    } else {
        print(2)
    }
} else {
    for i in 0...n - 2 {
        if checkNumber < weightArray[i + 1] - 1 {
            break
        } else {
            checkNumber += weightArray[i + 1]
        }
    }
    
    if weightArray[0] > 1 {
        print(1)
    } else {
        print(checkNumber + 1)
    }
}
