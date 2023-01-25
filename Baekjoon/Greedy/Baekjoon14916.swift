//
//  Baekjoon14916.swift
//  
//
//  Created by 임현규 on 2023/01/25.
//

import Foundation

var n = Int(readLine()!)!
var result = 0

while true {

    if n % 5 == 0 {
        result += n / 5
        break
    } else {
        if n > 2 {
            n -= 2
            result += 1
        } else if n == 2 {
            result += 1
            break
        } else {
            result = -1
            break
        }
    }
}

print(result)
