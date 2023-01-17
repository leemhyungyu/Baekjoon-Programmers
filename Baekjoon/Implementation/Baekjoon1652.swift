//
//  Baekjoon1652.swift
//  
//
//  Created by 임현규 on 2023/01/18.
//

import Foundation

let n = Int(readLine()!)!
var roomArray = [[String]]()
var result = (0, 0)

for _ in 1...n {
    roomArray.append(readLine()!.map { String($0) })
}

for i in 0...n - 1 {
    let splitRow = roomArray[i].split(separator: "X").map { $0.count }
    let splitCol = roomArray.map { $0[i] }.split(separator: "X").map { $0.count }
    
    for j in splitRow {
        if j >= 2 {
            result.0 += 1
        }
    }
    
    for j in splitCol {
        if j >= 2 {
            result.1 += 1
        }
    }
}

print(result.0, result.1)
