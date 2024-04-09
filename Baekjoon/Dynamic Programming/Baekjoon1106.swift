//
//  Baekjoon1106.swift
//  Solved
//
//  Created by 임현규 on 2024/04/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let c = input[0], n = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}
func solution(_ array: [[Int]], _ c: Int, _ n: Int) -> Int {
    var d = Array(repeating: 1000000, count: 1101)
    
    for i in 1...1100 {
        for j in array {
            if i < j[1] { continue }
            if i == j[1] {
                d[i] = min(d[i], j[0])
            } else {
                d[i] = min(d[i - j[1]] + j[0], d[i])
            }
        }
    }
    
    return d[c...1100].min()!
}

print(solution(array, c, n))
