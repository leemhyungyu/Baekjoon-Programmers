//
//  Baekjoon2343.swift
//  Solved
//
//  Created by 임현규 on 2024/03/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var start = array.max()!, end = array.reduce(0) { $0 + $1 }
    
    while start <= end {
        let mid = (end + start) / 2
        var count = 1
        var sum = 0

        for i in 0..<n {
            if sum + array[i] <= mid {
                sum += array[i]
            } else {
                count += 1
                sum = array[i]
            }
        }
        
        if count > m {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return start
}

print(solution(array, n, m))
