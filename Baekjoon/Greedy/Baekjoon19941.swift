//
//  Baekjoon19941.swift
//  
//
//  Created by 임현규 on 2023/02/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var posArray = readLine()!.map { String($0) }
var count = 0
var left = 0 {
    didSet {
        if left < 0 {
            left = 0
        }
    }
}

var right = 0 {
    didSet {
        if right > posArray.count - 1 {
            right = posArray.count - 1
        }
    }
}


for i in 0...posArray.count - 1 {
    if posArray[i] == "P" {
        left = i - k
        right = i + k
        
        for j in left...right {
            if posArray[j] == "H" {
                posArray[j] = "X"
                count += 1
                break
            }
        }
    }
}

print(count)
