//
//  Baekjoon1748.swift
//  
//
//  Created by 임현규 on 2023/01/22.
//

let n = Int(readLine()!)!

var i = 1
var result = 0
while i <= n {
    result += (n-i+1)
    i *= 10
}

print(result)
