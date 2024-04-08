//
//  Baekjoon2293.swift
//  Solved
//
//  Created by 임현규 on 2024/04/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ k: Int) -> Int {
    var d = Array(repeating: 0, count: k + 1)
    var array = array.sorted()
    d[0] = 1
    
    for i in array {
        for j in stride(from: i, through: k, by: 1) {
            if d[j] + d[j - i] >= Int(pow(2.0, 31.0)) {
                d[j] = 0
            }
            d[j] += d[j - i]
        }
    }
        
    return d[k]
}

print(solution(array, n, k))
