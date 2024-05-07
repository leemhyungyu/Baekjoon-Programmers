//
//  Baekjoon2624.swift
//  Solved
//
//  Created by 임현규 on 2024/05/07.
//

import Foundation

let t = Int(readLine()!)!
let k = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<k {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}
func solution(_ array: [[Int]], _ t: Int, _ k: Int) -> Int {
    var d = Array(repeating: 0, count: t + 1)
    d[0] = 1

    for i in 0..<k {
        let money = array[i][0], count = array[i][1]
        for j in (0...t).reversed() {
            for z in 1...count {
                if j - money * z < 0 { continue }
                d[j] += d[j - money * z]
            }
        }
    }
    return d[t]
}

print(solution(array, t, k))
