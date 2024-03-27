//
//  Baekjoon2302.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var array = [Int]()

for _ in 0..<m {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var result = 1
    var d = Array(repeating: 1, count: 41)
    d[1] = 1
    d[2] = 2
    
    for i in 3...40 {
        d[i] = d[i - 2] + d[i - 1]
    }
        
    if m == 0 {
        return d[n]
    } else {
        result *= d[array.first! - 1]
        result *= d[n - array.last!]
        
        for i in 0..<array.count - 1{
            result *= d[array[i + 1] - array[i] - 1]
        }
    }
    
    return result
    
}

print(solution(array, n, m))
