//
//  Baekjoon13397.swift
//  Solved
//
//  Created by 임현규 on 7/14/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var left = 0, right = array.max()!
    var result = 10001
    
    func isPossible(_ mid: Int) -> Bool {
        var maxValue = array[0], minValue = array[0]
        var count = 1
        
        for i in 1..<n {
            maxValue = max(maxValue, array[i])
            minValue = min(minValue, array[i])
            
            if maxValue - minValue > mid {
                count += 1
                maxValue = array[i]
                minValue = array[i]
            }
        }
        
        return count <= m
    }
    
    while left <= right {
        let mid = (left + right) / 2
        
        if isPossible(mid) {
            result = min(result, mid)
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}

print(solution(array, n, m))
