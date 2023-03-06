//
//  Baekjoon3986.swift
//  
//
//  Created by 임현규 on 2023/03/06.
//

import Foundation

let n = Int(readLine()!)!
var stringArray = [[String]]()
var result = 0

for _ in 0..<n {
    stringArray.append(readLine()!.map { String($0)  })
}

for i in stringArray {
    
    var stack = [String]()

    for j in i {
        if !stack.isEmpty && stack.last! == j {
            stack.removeLast()
        } else {
            stack.append(j)
        }
    }
    
        
    if stack.isEmpty {
        result += 1
    }
}

print(result)
