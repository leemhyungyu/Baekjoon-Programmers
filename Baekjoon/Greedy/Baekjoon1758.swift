//
//  Baekjoon1758.swift
//  
//
//  Created by 임현규 on 2023/02/23.
//

import Foundation

let n = Int(readLine()!)!

var tipArray = [Int]()
var result = 0

for _ in 0..<n {
    tipArray.append(Int(readLine()!)!)
}

tipArray.sort { $0 > $1 }


for i in 0..<n {
    if tipArray[i] - i > 0 {
        result += tipArray[i] - i
    }
}

print(result)
