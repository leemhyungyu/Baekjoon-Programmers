//
//  괄호 회전하기 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ s:String) -> Int {
 
    var count = 0
    for i in 0..<s.count - 1 {
        var stack = [Character]()

        var newString = rotation(s, i)

        for j in newString {

            if stack.isEmpty {
                stack.append(j)
            } else {
                if (stack.last! == "[" && j == "]") || (stack.last! == "{" && j == "}") || (stack.last! == "(" && j == ")") {
                    stack.removeLast()
                } else {
                    stack.append(j)
                }
            }
        }
        
        
        if stack.isEmpty {
            count += 1
        }
    }
    
    return count
}

func rotation(_ s: String, _ x: Int) -> String {
    
    var result = [Character]()
    
    for i in s {
        result.append(i)
    }
    
    for i in 0..<x {
        result.append(result.removeFirst())
    }
    
    return String(result)
}
