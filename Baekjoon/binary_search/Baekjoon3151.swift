//
//  Baekjoon3151.swift
//  Solved
//
//  Created by 임현규 on 7/12/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    let array = array.sorted()
    var result = 0
    
    for i in 0..<n - 1 {
        for j in i + 1..<n {
            let sum = array[i] + array[j]
            let lower = lowerBound(j + 1, -sum)
            let upper = upperBound(j + 1, -sum)
            result += upper - lower
        }
    }
    
    func lowerBound(_ left: Int, _ k: Int) -> Int {
        var left = left, right = n - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if array[mid] >= k {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return left
        
    }
    
    func upperBound(_ left: Int, _ k: Int) -> Int {
        var left = left, right = n - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if array[mid] <= k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return left
    }
    
    return result
}

print(solution(array, n))

