//
//  Baekjoon1049.swift
//  
//
//  Created by 임현규 on 2023/01/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()

for _ in 1...input[1] {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var minBundle = array.sorted { $0[0] < $1[0]}.first![0]
var minSingle = array.sorted { $0[1] < $1[1]}.first![1]

if minBundle <= minSingle * (input[0] % 6)   {
    if input[0] % 6 == 0 {
        print((input[0] / 6) * minBundle)
    } else {
        print((input[0] / 6) * minBundle + minBundle)
    }
} else if minBundle > minSingle * 6 {
    print(input[0] * minSingle)
} else {
    print((input[0] % 6) * minSingle + (input[0] / 6) * minBundle)
}
