//
//  Baekjoon2491.swift
//  
//
//  Created by 임현규 on 2023/01/15.
//

import Foundation

let n = Int(readLine()!)!
var numberArray = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

if n == 1 {
    print(1)
} else {
    print(check())
}

func check() -> Int {
    var count = 1

    for i in 1...n - 1 {
        if numberArray[i] >= numberArray[i - 1] {
            count += 1
        } else {
            count = 1
        }
        
        if result < count {
            result = count
        }
    }
    
    count = 1
    for i in 1...n - 1 {
        if numberArray[i] <= numberArray[i - 1] {
            count += 1
        } else {
            count = 1
        }
        if result < count {
            result = count
        }
    }
     
    return result
}
