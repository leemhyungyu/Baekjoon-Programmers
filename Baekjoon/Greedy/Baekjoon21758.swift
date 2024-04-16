//
//  Baekjoon21758.swift
//  Solved
//
//  Created by 임현규 on 2024/04/16.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int]) -> Int {
    var d = Array(repeating: 0, count: n)
    var result = 0
    
    d[n - 1] = array[n - 1]
    for i in (0..<array.count - 1).reversed() {
        d[i] = array[i] + d[i + 1]
    }

    // 벌 벌 통
    for i in 1..<n {
        let leftSum = d[0] - array[0] - array[i]
        let rightSum = d[i] - array[i]
        result = max(leftSum + rightSum, result)
    }
    
    // 벌 통 벌
    for i in 1..<n - 1 {
        let leftSum = d[0] - d[i] - array[0] + array[i]
        let rightSum = d[i] - array[n - 1]
        result = max(leftSum + rightSum, result)
    }
    
    // 통 벌 벌
    for i in 1..<n - 1 {
        let leftSum = d[0] - d[i]
        let rightSum = d[0] - array[n - 1] - array[i]
        result = max(leftSum + rightSum, result)
    }
    
    return result
}

print(solution(array))
