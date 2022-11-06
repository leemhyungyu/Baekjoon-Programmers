//
//  Baekjoon2167.swift
//  
//
//  Created by 임현규 on 2022/11/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 1...n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let k = Int(readLine()!)!

for _ in 1...k {
    let input = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    
    var result = 0
    for i in input[0]...input[2] {
        for j in input[1]...input[3] {
            
            result += array[i][j]
        }
    }
    
    print(result)
}
