//
//  Baekjoon11054.swift
//  Solved
//
//  Created by 임현규 on 6/14/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var left = Array(repeating: 1, count: n)
    var right = Array(repeating: 1, count: n)
    var result = 0
    
    for i in 0..<n {
        for j in 0..<i {
            if array[i] > array[j] {
                left[i] = max(left[i], left[j] + 1)
            }
        }
    }
    
    var array = Array(array.reversed())
    
    for i in 0..<n {
        for j in 0..<i {
            if array[j] < array[i] {
                right[i] = max(right[i], right[j] + 1)
            }
        }
    }
    
    right = Array(right.reversed())
    
    for i in 0..<n {
        result = max(left[i] + right[i], result)
    }
    
    return result - 1
}


print(solution(array, n))
