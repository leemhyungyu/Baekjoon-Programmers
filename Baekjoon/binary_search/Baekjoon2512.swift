//
//  Baekjoon2512.swift
//  Solved
//
//  Created by 임현규 on 2024/03/30.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

func solution(_ array: [Int], _ n : Int, _ m: Int) -> Int {
    var result = 0
    let sum = array.reduce(0) { $0 + $1 }
    if sum <= m { return array.max()! }
    var start = 1, end = array.max()!
    
    while start <= end {
        let mid = (end + start) / 2
        
        let sum = array
            .map { $0 > mid ? mid : $0 }
            .reduce(0) { $0 + $1 }
        
        if sum > m {
            end = mid - 1
        } else {
            start = mid + 1
            result = max(result, mid)
        }
    }
    
    
    return result
}

print(solution(array, n, m))
