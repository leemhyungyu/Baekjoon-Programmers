//
//  Baekjoon2212.swift
//  
//
//  Created by 임현규 on 2023/02/07.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var sensorArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
var sensorDistance = [Int]()
var result = 0

if n <= k {
    print(0)
} else {
    for i in 0...sensorArray.count - 2 {
        sensorDistance.append(sensorArray[i + 1] - sensorArray[i])
    }

    sensorDistance.sort()

    for i in 0...(n - k - 1) {
        result += sensorDistance[i]
    }

    print(result)
}
