//
//  Baekjoon2230.swift
//  Solved
//
//  Created by 임현규 on 2024/04/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var array = array.sorted { $0 < $1 }
    var start = 0, end = 0
    var minValue = Int.max
    
    while start < n && end < n {
        let result = array[end] - array[start]
        
        if result < m {
            end += 1
        } else {
            start += 1
            minValue = min(result, minValue)
        }
    }
    
    return minValue
}

print(solution(array, n, m))
