//
//  Baekjoon10972.swift
//  
//
//  Created by 임현규 on 2023/01/08.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int]()

if array.sorted(by: { $0 > $1 }) == array {
    print(-1)
} else {
    var minIndex = 0
    var maxIndex = 0
    
    for i in 0...array.count - 1 {
        if (0...array.count - 1).contains(i + 1) && array[i] < array[i + 1] {
            minIndex = i
        }
    }
    
    for i in minIndex...array.count - 1 {
        if array[i] > array[minIndex] {
            maxIndex = i
        }
    }
    
    array.swapAt(maxIndex, minIndex)
    array[minIndex + 1...array.count - 1].sort { $0 < $1}
    print(array.map {String($0)}.joined(separator: " "))
}
