//
//  Baekjoon4949.swift
//  
//
//  Created by 임현규 on 2023/02/25.
//

import Foundation

while true {
    let input = readLine()!.map { String($0) }
    var stack = [String]()
    
    if input == ["."] {
        break
    }
    
    for i in input {
        if i == "(" || i == "[" || i == "]" || i == ")"{
            stack.append(i)
        }
        
        if stack.count >= 2 {
            if stack[stack.count - 2...stack.count - 1] == ["(", ")"] || stack[stack.count - 2...stack.count - 1] == ["[", "]"] {
                stack.removeLast()
                stack.removeLast()
            }
        }
    }
    
    print(stack.count == 0 ? "yes" : "no")
}
