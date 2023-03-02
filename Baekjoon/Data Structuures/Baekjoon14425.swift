//
//  Baekjoon14425.swift
//  
//
//  Created by 임현규 on 2023/03/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

var n = input[0], m = input[1]
var stringArray = Set<String>()

var result = 0

for _ in 0..<n {
    stringArray.insert(String(readLine()!))
}

for _ in 0..<m {
    if stringArray.contains(String(readLine()!)) {
        result += 1
    }
}

print(result)
