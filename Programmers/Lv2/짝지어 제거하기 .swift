//
//  짝지어 제거하기 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    
    for i in s {
        if !stack.isEmpty && stack.last! == i {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}
