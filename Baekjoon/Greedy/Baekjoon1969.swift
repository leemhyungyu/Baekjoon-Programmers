//
//  Baekjoon1969.swift
//  
//
//  Created by 임현규 on 2023/01/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var dnaArray = [[String]]()
var result = [String]()
var distance = 0

for _ in 1...n {
    dnaArray.append(readLine()!.map { String($0)})
}

for i in 0...m - 1 {
    
    var temp = [String: Int]()
    
    for j in dnaArray {
        if let value = temp[j[i]] {
            temp[j[i]] = value + 1
        } else {
            temp[j[i]] = 1
        }
    }
    
    var sortedTemp = temp.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
    
    result.append(sortedTemp.first!.key)
    
    sortedTemp.removeFirst()
    sortedTemp.forEach {
        distance += $0.value
    }
}

print(result.joined(separator: ""))
print(distance)
