//
//  Baekjoon11265.swift
//  Solved
//
//  Created by 임현규 on 2024/04/19.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()


func solution(_ array: inout [[Int]], _ n: Int, _ m: Int) {
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                array[i][j] = min(array[i][j], array[i][k] + array[k][j])
            }
        }
    }
}

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

solution(&array, n, m)

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    print(array[a - 1][b - 1] <= c ? "Enjoy other party" : "Stay here")
}
