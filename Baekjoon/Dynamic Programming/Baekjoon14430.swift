//
//  Baekjoon14430.swift
//  Solved
//
//  Created by 임현규 on 2024/04/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: m), count: n)

    for x in 0..<n {
        for y in 0..<m {
            d[x][y] = max(d[max(x - 1, 0)][y], d[x][max(y - 1, 0)]) + array[x][y]
        }
    }
                    
    return d[n - 1][m - 1]
}

print(solution(array, n, m))
                                                     
                                                     

