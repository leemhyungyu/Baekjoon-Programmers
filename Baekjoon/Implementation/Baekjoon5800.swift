//
//  Baekjoon5800.swift
//  
//
//  Created by 임현규 on 2022/12/30.
//

import Foundation

let k = Int(readLine()!)!
var array = [[Int]]()

for _ in 1...k {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0...array.count - 1 {
    
    var gap = 0
    
    array[i].removeFirst()
    
    print("Class \(i + 1)")
    
    array[i] = array[i].sorted { $0 < $1 }
    
    for j in 1...array[i].count - 1 {
        let temp = array[i][j - 1] - array[i][j]
        if abs(temp) > gap {
            gap = abs(temp)
        }
    }
    
    print("Max \(array[i].max()!), Min \(array[i].min()!), Largest gap \(gap)")
}
