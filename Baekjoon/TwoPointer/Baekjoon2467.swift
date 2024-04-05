//
//  Baekjoon2467.swift
//  Solved
//
//  Created by 임현규 on 2024/04/05.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> (Int, Int) {
    var start = 0
    var end = n - 1
    var result = Int.max
    var resultIndex = (0, 0)
    
    while start < end {
        let one = array[start], two = array[end]
        let sum = one + two
    
        if result > abs(sum) {
            result = abs(sum)
            resultIndex = (start, end)
        }
        
        if abs(one) < abs(two) {
            end -= 1
        } else {
            start += 1
        }
    }
    
    return (array[resultIndex.0], array[resultIndex.1])
}

let result = solution(array, n)
print(result.0, result.1)
