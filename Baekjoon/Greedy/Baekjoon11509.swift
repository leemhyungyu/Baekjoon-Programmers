//
//  Baekjoon11509.swift
//  
//
//  Created by 임현규 on 2023/02/15.
//

import Foundation

let n = Int(readLine()!)!
var balloonArray = readLine()!.split(separator: " ").map { Int($0)! }
var arrowArray = Array(repeating: 0, count: 1000001)

var result = 0

for i in 0...balloonArray.count - 1 {
    
    let height = balloonArray[i]
    
    if arrowArray[height] > 0 {
        arrowArray[height] -= 1
        arrowArray[height - 1] += 1
    } else {
        result += 1
        arrowArray[height - 1] += 1
    }
}

print(result)
