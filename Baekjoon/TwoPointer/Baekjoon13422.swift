//
//  Baekjoon13422.swift
//  Solved
//
//  Created by 임현규 on 6/24/24.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ array: [Int], _ n: Int, _ m: Int, _ k: Int) -> Int {
    let array = array + array
    var result = 0
    var sum = Array(repeating: 0, count: array.count + 1)
    var left = 1, right = m
    
    sum[1] = array[0]
    
    for i in 1..<array.count {
        sum[i + 1] = sum[i] + array[i]
    }
    
    if n == m {
        return sum[right] - sum[left - 1] < k ? 1 : 0
    }
    
    while left <= n {
        let money = sum[right] - sum[left - 1]
                
        if money < k {
            result += 1
        }
        
        left += 1
        right += 1
    }
    
    return result
}

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], m = input[1], k = input[2]
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    print(solution(array, n, m, k))
}
