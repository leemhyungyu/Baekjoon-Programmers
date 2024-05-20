//
//  Baekjoon19951.swift
//  Solved
//
//  Created by 임현규 on 5/20/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let ground = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ ground: [Int], _ n: Int, _ m: Int) -> [Int] {
    var temp = Array(repeating: 0, count: n + 1)
    var ground = ground
    for i in array {
        let a = i[0] - 1, b = i[1], k = i[2]
        temp[a] += k
        temp[b] += -k
    }
    
    for i in 1..<n {
        temp[i] += temp[i - 1]
    }
    
    for i in 0..<n {
        ground[i] += temp[i]
    }
    
    return ground
}

print(solution(array, ground, n, m).map { String($0) }.joined(separator: " "))
