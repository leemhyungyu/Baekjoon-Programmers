//
//  Baekjoon1965.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

let n = Int(readLine()!)!
var boxArray = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ boxArray: [Int], _ n: Int) -> Int {
    var d = Array(repeating: 1, count: n)
    d[0] = 1
    
    for i in 1..<n {
        for j in 0...i {
            if boxArray[j] < boxArray[i] {
                d[i] = max(d[j] + 1, d[i])
            }
        }
    }
    
    return d.max()!
}

print(solution(boxArray, n))
