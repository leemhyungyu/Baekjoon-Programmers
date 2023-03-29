//
//  Baekjoon9935.swift
//  
//
//  Created by 임현규 on 2023/03/29.
//

import Foundation

let array = readLine()!.map { String($0) }
let bomb = readLine()!

var stack = [Character]()

for i in 0..<array.count {

    stack.append(Character(array[i]))

    if Character(array[i]) == bomb.last! {
        if stack.count >= bomb.count && String(stack[stack.count - bomb.count...stack.count - 1]) == bomb {
            
            for _ in 1...bomb.count {
                stack.removeLast()
            }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))
