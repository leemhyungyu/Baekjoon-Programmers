//
//  Baekjoon1449.swift
//  
//
//  Created by 임현규 on 2023/01/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1]
var waterArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
var result = 0
var distance = 0

if n == 1 {
    print(1)
} else {
    for i in 0...n - 2 {
        if waterArray[i + 1] - waterArray[i] + 1 > l {
            result += 1
            distance = 0
        }
    }
    print(result + 1)
}
