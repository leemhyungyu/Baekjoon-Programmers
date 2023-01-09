//
//  Baekjoon18111.swift
//  
//
//  Created by 임현규 on 2023/01/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]
var b = input[2]
var result: (Int, Int) = (99999999, 0)
var array = [Int]()
var minHeight = array.last!
var maxHeight = 0

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    input.forEach {
        array.append($0)
    }
}

array.sort(by: { $0 > $1 })
array.forEach {
    maxHeight += $0
}

maxHeight = Int(floor((Double(maxHeight) + Double(b)) / Double(n * m)))

for i in minHeight...maxHeight {
    
    var inventory = input[2]
    var time = 0
    var ruleOne = 0
    var ruleTwo = 0
    
    for j in 0...array.count - 1 {
        if array[j] > i {
            ruleOne += (array[j] - i) * 2
            inventory += array[j] - i
        } else if array[j] < i {
            ruleTwo += (i - array[j])
            inventory -= i - array[j]
        }
    }
    
    time = ruleOne + ruleTwo

    if time < result.0 {
        result = (time, i)
    } else if time == result.0 {
        if i > result.1 {
            result = (time, i)
        }
    }
}
