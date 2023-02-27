//
//  Baekjoon1021.swift
//  
//
//  Created by 임현규 on 2023/02/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var posArray = readLine()!.split(separator: " ").map { Int($0)! }
var deque = Array(1...n)

var result = 0

while !posArray.isEmpty {

    let pos = deque.firstIndex(of: posArray.removeFirst())! + 1
        
    if pos <= (deque.count / 2 + 1) {
        for _ in 0..<pos - 1 {

            deque.append(deque.removeFirst())
            result += 1

        }
    } else {
        for _ in 0..<deque.count - pos + 1{
            deque.insert(deque.removeLast(), at: 0)
            result += 1
        }
        
    }
    deque.removeFirst()

}

print(result)
