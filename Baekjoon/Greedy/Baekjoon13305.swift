//
//  Baekjoon13305.swift
//  
//
//  Created by 임현규 on 2023/01/27.
//

import Foundation

let n = Int(readLine()!)!
var lengthArray = readLine()!.split(separator: " ").map { Int($0)! }
var oilArray = readLine()!.split(separator: " ").map { Int($0)! }

var nowOil = oilArray.first!
var result = 0

for i in 0...lengthArray.count - 1 {

    if oilArray[i + 1] < nowOil {
        result += nowOil * lengthArray[i]
        nowOil = oilArray[i + 1]
    } else {
        result += nowOil * lengthArray[i]
    }
}

print(result)
