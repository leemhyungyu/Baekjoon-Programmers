//
//  Baekjoon2877.swift
//  
//
//  Created by 임현규 on 2023/01/22.
//

import Foundation

let k = Int(readLine()!)!

var binaryNumber = String(k + 1, radix: 2).map { String($0) }

binaryNumber.removeFirst()

print(binaryNumber.map {
    if $0 == "1" {
        return "7"
    } else {
        return "4"
    }
}.joined(separator: ""))
