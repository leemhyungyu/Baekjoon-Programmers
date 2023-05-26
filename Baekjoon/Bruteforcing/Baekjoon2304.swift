//
//  Baekjoon2304.swift
//  
//
//  Created by 임현규 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
var array = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((input[0], input[1]))
}

array.sort { $0.0 < $1.0 }

var maxHeight = 0
var maxIndex = 0
for i in 0..<array.count {
    if maxHeight < array[i].1 {
        maxIndex = i
        maxHeight = array[i].1
    }
}

func solution(_ array: [(Int, Int)]) -> Int {
    
    var result = 0
    // 왼쪽
    var maxLeft = array.first!
    
    for i in (0..<maxIndex) {
        if array[i + 1].1 > maxLeft.1 {
            
            result += (array[i + 1].0 - maxLeft.0) * maxLeft.1
            maxLeft = array[i + 1]
        }
    }
    
    var maxRight = array.last!
    
    // 오른쪽
    for i in (maxIndex + 1..<array.count).reversed() {
        if array[i - 1].1 > maxRight.1 {
            result += (maxRight.0 - array[i - 1].0) * maxRight.1
            maxRight = array[i - 1]
        }
    }
    
    
    result += maxHeight
    
    return result
}

print(solution(array))
