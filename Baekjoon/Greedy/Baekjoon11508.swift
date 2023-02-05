//
//  Baekjoon11508.swift
//  
//
//  Created by 임현규 on 2023/02/05.
//

import Foundation

var n = Int(readLine()!)!
var milkArray = [Int]()

for _ in 1...n {
    milkArray.append(Int(readLine()!)!)
}

milkArray.sort { $0 > $1 }

var result = 0

for i in 0...n - 1 {
    if (i + 1) % 3 != 0 {
        result += milkArray[i]
    }
}
print(result)
