//
//  Baekjoon2118.swift
//  Solved
//
//  Created by 임현규 on 5/21/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: 0, count: n + 1)
    var result = 0
    var totalLength = array.reduce(0) { $0 + $1 }
    var left = 0, right = 1
    
    for i in 1...n {
        d[i] += d[i - 1] + array[i - 1]
    }
    

    while left <= right && right < n {
        let length = d[right] - d[left]
        let minLength = min(length, totalLength - length)
        result = max(result, minLength)

        if length == minLength {
            right += 1
        } else {
            left += 1
        }
    }

    return result
}

print(solution(array, n))
