//
//  Baekjoon11055.swift
//  
//
//  Created by 임현규 on 2024/03/17.
//

import Foundation

let a = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int]) -> Int {
    var d = Array(repeating: 0, count: array.count)

    for i in 0..<array.count {
        var max = 0
        
        for j in 0..<i {
            if array[j] < array[i] {
                if max < d[j] {
                    max = d[j]
                }
            }
        }
        
        d[i] = max + array[i]
    }
    
    return d.max() ?? 0
}



print(solution(array))
