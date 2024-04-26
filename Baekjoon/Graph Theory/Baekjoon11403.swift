//
//  Baekjoon11403.swift
//  Solved
//
//  Created by 임현규 on 2024/04/26.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> [[Int]] {
    var array = array

    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if array[i][k] == 1 && array[k][j] == 1 {
                    array[i][j] = 1
                }
            }
        }
    }

    return array
}

solution(array, n).forEach { print($0.map { String($0) }.joined(separator: " ")) }
