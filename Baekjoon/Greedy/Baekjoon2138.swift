//
//  Baekjoon2138.swift
//  
//
//  Created by 임현규 on 2023/02/14.
//

import Foundation

let n = Int(readLine()!)!
var bulbArray = readLine()!.map { Int(String($0))! }
var goalArray = readLine()!.map { Int(String($0))! }

var temp = bulbArray
var result = Int.max

solve(true)
solve(false)

print(result == Int.max ? -1 : result)

func solve(_ isFirst: Bool) {
    
    temp = bulbArray
    
    var count = 0
    
    if isFirst {
        changeSwitch(0)
        count = 1
    }
    
    for i in 1...n - 1 {
        if temp[i - 1] != goalArray[i - 1] {
            changeSwitch(i)
            count += 1
            
        }
    }
        
    if temp == goalArray {
        result = min(result, count)
    }
}


func changeSwitch(_ i: Int) {
    
    if i > 0 {
        temp[i - 1] = temp[i - 1] == 0 ? 1 : 0
    }
    
    temp[i] = temp[i] == 0 ? 1 : 0
    
    if i < n - 1 {
        temp[i + 1] = temp[i + 1] == 0 ? 1 : 0
    }
}
