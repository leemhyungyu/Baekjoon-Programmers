//
//  Baekjoon1863.swift
//  Solved
//
//  Created by 임현규 on 2024/05/04.
//

import Foundation

let n = Int(readLine()!)!
var stack = [[Int]]()

var result = 0

for _ in 0..<n {
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    while !stack.isEmpty {
        if stack.last![1] > array[1] {
            stack.removeLast()
            result += 1
        } else if stack.last![1] < array[1] {
            stack.append(array)
        } else {
            break
        }
    }
    
    if stack.isEmpty {
        stack.append(array)
    }
}

print(result + stack.filter { $0[1] > 0 }.count)
