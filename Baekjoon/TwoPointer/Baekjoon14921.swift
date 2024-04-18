//
//  Baekjoon14921.swift
//  Solved
//
//  Created by 임현규 on 2024/04/18.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var array = array.sorted()
    var result = Int.max
    var left = 0, right = n - 1
    
    while left < right {
        let sum = array[left] + array[right]
        if abs(result) > abs(sum) { result = sum }
        if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return result
}

print(solution(array, n))
