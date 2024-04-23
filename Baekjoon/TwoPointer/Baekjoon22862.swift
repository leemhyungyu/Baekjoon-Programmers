//
//  Baekjoon22862.swift
//  Solved
//
//  Created by 임현규 on 2024/04/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ k: Int) -> Int {
    var left = 0, right = 0
    var result = 0
    var evenCount = 0, oddCount = 0
    
    while left < n && right < n {
        
        if oddCount <= k {
            if array[right] % 2 != 0 {
                oddCount += 1
            } else {
                evenCount += 1
            }
            
            result = max(result, evenCount)
            right += 1
                    
        } else {
            if array[left] % 2 != 0 {
                oddCount -= 1
            } else {
                evenCount -= 1
            }
            
            left += 1
        }
    }
    
    return result
}

print(solution(array, n, k))
