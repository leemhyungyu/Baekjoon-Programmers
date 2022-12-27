//
//  Baekjoon2331.swift
//  
//
//  Created by 임현규 on 2022/12/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

var result = [Int]()
var numberArray = Array(String(input[0])).map { String($0) }.map { Int($0)! }
var index = 0

result.append(input[0])

while true {

    var temp = 0

    for i in numberArray {
        temp += Int(pow(Double(i), Double(input[1])))
    }

    if result.contains(temp) {
        index = result.firstIndex(of: temp)!
        break
    } else {
        result.append(temp)
        numberArray = Array(String(temp).map { String($0) }).map { Int($0)! }
    }
}

print(index)
