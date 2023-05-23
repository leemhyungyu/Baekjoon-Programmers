//
//  Baekjoon1120.swift
//  
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
var a = input[0], b = input[1]

func solution(_ a: String, _ b: String) -> Int {

    var result = 51
    
    let a = a.map { String($0) }
    let b = b.map { String($0) }
    
    for i in 0...b.count - a.count {
        var count = 0
        
        for j in 0..<a.count {
            if a[j] != b[j + i] {
                count += 1
            }
        }
        
        result = min(count, result)
    }
    
    return result
}

print(solution(a, b))
