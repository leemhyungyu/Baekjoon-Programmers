//
//  Baekjoon13164.swift
//  
//
//  Created by 임현규 on 2023/02/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var heightArray = readLine()!.split(separator: " ").map { Int($0)! }
var distanceArray = [Int]()


for i in 0..<n - 1 {
    distanceArray.append(heightArray[i + 1] - heightArray[i])
}

distanceArray.sort()

if k >= 2 {
    for _ in 0...k - 2 {
        distanceArray.removeLast()
    }
}

print(distanceArray.reduce(0) { $0 + $1 })
