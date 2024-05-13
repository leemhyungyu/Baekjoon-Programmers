//
//  Baekjoon6068.swift
//  Solved
//
//  Created by 임현규 on 2024/05/13.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var time = 0
    var breakTime = Int.max
    
    let array = array.sorted { $0[1] == $1[1] ? $0[0] > $1[0] : $0[1] < $1[1] }
    
    for i in array {
        time += i[0]
        if time > i[1] { return -1 }
        breakTime = min(i[1] - time, breakTime)
    }
    
    return breakTime
}

print(solution(array, n))
