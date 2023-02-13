//
//  Baekjoon1461.swift
//  
//
//  Created by 임현규 on 2023/02/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0], m = input[1]

var plusArray = [Int]()
var minusArray = [Int]()
var maxValue = 0

readLine()!.split(separator: " ").forEach {
    
    if abs(Int($0)!) > maxValue {
        maxValue = abs(Int($0)!)
    }
    
    if Int($0)! < 0 {
        minusArray.append(Int($0)!)
    } else {
        plusArray.append(Int($0)!)
    }
}

var result = 0


minusArray.sort()
plusArray.sort { $0 > $1 }


while !minusArray.isEmpty {
    
    for i in minusArray {
        if abs(i) == maxValue {
            result += abs(maxValue)
            break
        } else {
            result += abs(i * 2)
            break
        }
    }
    
    for _ in 1...m {
        if !minusArray.isEmpty {
            minusArray.removeFirst()
        }
    }
}

while !plusArray.isEmpty {
    
    for i in plusArray {
        if i == maxValue {
            result += maxValue
            break
        } else {
            result += i * 2
            break
        }
    }
    
    for _ in 1...m {
        if !plusArray.isEmpty {
            plusArray.removeFirst()
        }
    }
}

print(result)
