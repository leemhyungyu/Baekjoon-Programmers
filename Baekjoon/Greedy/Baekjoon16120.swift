//
//  Baekjoon16120.swift
//  
//
//  Created by 임현규 on 2023/02/24.
//

import Foundation

var ppapArray = readLine()!.map { String($0) }
var ppapCount = ppapArray.count
let ppap = ["P", "P", "A", "P"]
var stack = [String]()

for i in 0..<ppapArray.count {

    stack.append(ppapArray[i])

    if stack.count >= 4 && Array(stack[stack.count - 4...stack.count - 1]) == ppap {
        stack.removeLast()
        stack.removeLast()
        stack.removeLast()
    }
}

if stack == ["P"] || stack == ppap {
    print("PPAP")
} else {
    print("NP")
}
