//
//  Baekjoon2110.swift
//  Solved
//
//  Created by 임현규 on 2024/05/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], c = input[1]
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ c: Int) -> Int {
    let array = array.sorted()
    var maxLength = 0
    var start = 1, end = array.last!
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 1
        var nowPos = array[0]
        
        for i in 1..<n {
            if array[i] - nowPos >= mid {
                nowPos = array[i]
                count += 1
            }
        }

        if count >= c {
            maxLength = max(maxLength, mid)
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return maxLength
}

print(solution(array, n, c))
