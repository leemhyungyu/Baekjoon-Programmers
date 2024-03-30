//
//  Baekjoon1495.swift
//  Solved
//
//  Created by 임현규 on 2024/03/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], s = input[1], m = input[2]
let volume = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ volume: [Int], _ n: Int, _ s: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
    d[0][s] = true
    
    for i in 1...n {
        for j in 0...m {
            if !d[i - 1][j] { continue }
            
            if j + volume[i - 1] <= m {
                d[i][j + volume[i - 1]] = true
            }
            
            if j - volume[i - 1] >= 0 {
                d[i][j - volume[i - 1]] = true
            }
        }
    }
    
    let result = d[n].enumerated().filter { $0.element }.map { $0.offset }.max()
    return result == nil ? -1 : result!
}



print(solution(volume, n, s, m))
