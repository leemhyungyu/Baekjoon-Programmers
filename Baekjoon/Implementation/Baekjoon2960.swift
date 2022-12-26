//
//  Baekjoon2960.swift
//  
//
//  Created by 임현규 on 2022/12/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var numberArray = [Int]()
var resultArray = [Int]()

for i in 2...n {
    numberArray.append(i)
}

while !numberArray.isEmpty {
    let p = numberArray.first!

    if numberArray.count <= p {
        resultArray.append(numberArray.removeFirst())
    } else {
        for i in 0...(numberArray.count - 1) {
            if numberArray[i] % p == 0 {
                resultArray.append(numberArray[i])
                numberArray[i] = 0
            }
        }
        numberArray = numberArray.filter { $0 != 0 }
    }
}

print(resultArray[k - 1])
