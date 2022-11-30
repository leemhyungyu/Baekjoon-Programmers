//
//  Baekjoon1436.swift
//  
//
//  Created by 임현규 on 2022/11/30.
//

import Foundation

let n = Int(readLine()!)!

var result = 666
var count = 0
var temp = 0

while count != n {
    
    temp = result

    while temp >= 666 {
        if temp % 1000 == 666 {
            count += 1
            break
        } else {
            temp /= 10
        }
    }

    result += 1
    
    if count == n {
        print(result - 1)
    }
}
