//
//  Baekjoon7983.swift
//  Solved
//
//  Created by 임현규 on 5/17/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    let array = array.sorted { $0[1] == $1[1] ? $0[0] > $1[0] : $0[1] > $1[1]}
    var day = array[0][1] - array[0][0]

    for i in 1..<array.count {
        let d = array[i][0], t = array[i][1]
        if day > t {
            day = max(day - t, day)
            day = t - d
        } else {
            day = day - d
        }
    }
    
    return day
}

print(solution(array, n))
