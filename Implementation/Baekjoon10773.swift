//
//  Baekjoon10773.swift
//  
//
//  Created by 임현규 on 2022/10/06.
//

import Foundation

let k = Int(readLine()!)!

var array = [Int]()
var result = 0

for _ in 1...k {
    moneyback(Int(readLine()!)!)
}

for i in array {
    result += i
}

print(result)

func moneyback(_ input: Int) {
    if input == 0 {
        array.remove(at: array.endIndex - 1)
    } else {
        array.append(input)
    }
}
