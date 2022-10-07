//
//  Baekjoon1475.swift
//  
//
//  Created by 임현규 on 2022/10/07.
//

import Foundation

var result = 0
    
var array: [Int] = Array(repeating: 0, count: 10)
    
Array(readLine()!).map { array[Int(String($0))!] += 1}
array[6] = (array[6] + array.removeLast() + 1) / 2
print(array.max()!)

    
