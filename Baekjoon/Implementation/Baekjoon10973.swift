//
//  Baekjoon10973.swift
//  
//
//  Created by 임현규 on 2023/01/04.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int]()

if array.sorted() == array {
    print(-1)
} else {
    var minIndex = 0
    var maxIndex = 0
    
    for i in 0...array.count - 1 {
        if (0...array.count - 1).contains(i + 1) && array[i] > array[i + 1] {
            maxIndex = i
        }
    }
    
    for i in maxIndex...array.count - 1 {
        if array[i] < array[maxIndex] {
            minIndex = i
        }
    }

    array.swapAt(maxIndex, minIndex)
    array[maxIndex + 1...array.count - 1].sort { $0 > $1}
    print(array.map {String($0)}.joined(separator: " "))
}
