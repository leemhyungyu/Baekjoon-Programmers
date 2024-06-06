//
//  Baekjoon1253.swift
//  Solved
//
//  Created by 임현규 on 6/6/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    let array = array.sorted()
    var count = 0
    
    for i in 0..<array.count {
        let target = array[i]
        var left = 0, right = n - 1

        while left < right {
            let sum = array[left] + array[right]
            if sum == target {
                if left == i {
                    left += 1
                } else if right == i {
                    right -= 1
                } else {
                    count += 1
                    break
                }
            } else {
                if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    
    return count
}

print(solution(array, n))
