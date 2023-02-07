//
//  Baekjoon15904.swift
//  
//
//  Created by 임현규 on 2023/02/08.
//

import Foundation

var input = readLine()!.map { String($0) }
var ucpc = ["U", "C", "P", "C"]

for i in input {
    if i == ucpc.first {
        ucpc.removeFirst()
    }
}

print(ucpc.count == 0 ? "I love UCPC" : "I hate UCPC")
