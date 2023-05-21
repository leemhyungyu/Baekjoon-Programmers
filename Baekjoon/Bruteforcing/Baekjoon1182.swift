//
//  Baekjoon1182.swift
//  
//
//  Created by 임현규 on 2023/05/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], s = input[1]
var array = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
var result = 0

func solution(_ array: [Int]) -> Int {
    
    for i in 0..<array.count {
        findSubArray([array[i]], i)
    }
    
    return result
}

func findSubArray(_ target: [Int], _ index: Int) {
    
    if target.reduce(0) { $0 + $1 } == s {
        result += 1
    }
    
    if target.count == array.count {
        return
    }
    
    for i in index + 1..<array.count {
        findSubArray(target + [array[i]], i)
    }
}


print(solution(array))
