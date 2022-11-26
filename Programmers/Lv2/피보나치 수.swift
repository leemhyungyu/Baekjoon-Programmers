//
//  피보나치 수.swift
//  
//
//  Created by 임현규 on 2022/11/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var array = Array(repeating: 0, count: n + 1)
    
    array[0] = 0
    array[1] = 1
    
    for i in 2...array.count - 1 {
        array[i] = array[i - 2] % 1234567 + array[i - 1] % 1234567
    }
    
    return array.last! % 1234567
}

