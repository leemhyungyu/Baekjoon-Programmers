//
//  Baekjoon11866.swift
//  
//
//  Created by 임현규 on 2022/10/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

var n = input[0]
let k = input[1]

var array = [Int]()
var result = [Int]()

for i in 1...n {
    array.append(i)
}

while n != 0 {

    for i in 0...(k - 1) {
        if i == k - 1 {
            result.append(array.removeFirst())
        } else {
            array.append(array.removeFirst())
        }
    }
    
    n -= 1
}

print("<", terminator: "")
for i in result {
    if i == result.last! {
        print(i, terminator: "")
    } else {
        print("\(i),", terminator: " ")
    }
}
print(">")
