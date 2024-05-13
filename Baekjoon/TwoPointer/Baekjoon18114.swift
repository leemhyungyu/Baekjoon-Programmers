//
//  Baekjoon18114.swift
//  Solved
//
//  Created by 임현규 on 2024/05/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], c = input[1]
let weights = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ weights: [Int], _ n: Int, _ c: Int) -> Int {
    let weights = weights.sorted()
    var left = 0, right = n - 1    
    
    while left <= right {
        let sum = left == right ? weights[left] : weights[left] + weights[right]
                
        for i in 0..<n where i != left && i != right {
            if sum + weights[i] == c { return 1 }
        }
        if sum < c {
            left += 1
        } else if sum > c {
            right -= 1
        } else {
            return 1
        }
    }
    
    return 0
}

print(solution(weights, n, c))
