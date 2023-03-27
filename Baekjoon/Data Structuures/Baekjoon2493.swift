//
//  Baekjoon2493.swift
//  
//
//  Created by 임현규 on 2023/03/27.
//

import Foundation

let n = Int(readLine()!)!
let topArray = readLine()!.split(separator: " ").map { Int($0)! }
var result: [Int] = [0]
var stack: [(Int, Int)] = [(topArray.first!, 1)]

for i in 1..<topArray.count {
    
    while true {
        if stack.isEmpty || stack.last!.0 > topArray[i] {
            stack.append((topArray[i], i + 1))
            break
        }
            
        if stack.last!.0 < topArray[i] {
            stack.removeLast()
        } else if stack.last!.0 == topArray[i] {
            break
        }
    }
   
    
    if stack.count == 1 {
        result.append(0)
    } else if stack.count > 1 {
        result.append(stack[stack.count - 2].1)
    }
}

print(result.map { String($0) }.joined(separator: " "))
