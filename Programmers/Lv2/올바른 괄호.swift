//
//  올바른 괄호.swift
//  
//
//  Created by 임현규 on 2022/11/23.
//

import Foundation

func solution(_ s:String) -> Bool {
    var array = s.map { String($0) }
    
    var count = 0
    
    for i in 0...array.count - 1 {
        if count == 0 && array[i] == ")" {
            return false
        }
        
        if array[i] == "(" {
            count += 1
        } else {
            count -= 1
        }
    }
    
    if count > 0 {
        return false
    } else {
        return true
    }
}
