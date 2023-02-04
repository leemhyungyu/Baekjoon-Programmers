//
//  Baekjoon2872.swift
//  
//
//  Created by 임현규 on 2023/02/04.
//

import Foundation

var n = Int(readLine()!)!
var bookArray = [Int]()

for _ in 1...n {
    bookArray.append(Int(readLine()!)!)
}

var result = 0

for i in (0...n - 1).reversed() {
    if bookArray[i] == n {
        n -= 1
    } else {
        result += 1
    }
}

print(result)
