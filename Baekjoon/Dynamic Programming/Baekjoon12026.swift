//
//  Baekjoon12026.swift
//  Solved
//
//  Created by 임현규 on 2024/05/05.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.map { String($0) }


func solution(_ n: Int, _ array: [String]) -> Int {
    var d = Array(repeating: Int.max, count: n)
    let target = ["B": "O", "O": "J", "J": "B"]
    d[0] = 0

    for i in 0..<n {
        if d[i] == Int.max { continue }
        for j in i + 1..<n {
            if array[j] == target[array[i]]! {
                d[j] = min(d[i] + (j - i) * (j - i), d[j])
            }
        }
    }
    
    return d[n - 1] == Int.max ? -1 : d[n - 1]
}

print(solution(n, array))
