//
//  Baekjoon1890.swift
//  Solved
//
//  Created by 임현규 on 2024/03/31.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var d = Array(repeating: Array(repeating: 0, count: n), count: n)
    var dxdy = [(1, 0), (0, 1)]
    var result = 0
    
    for i in (0..<n).reversed() {
        for j in (0..<n).reversed() {
            for k in dxdy {
                let nx = i + k.0 * array[i][j], ny = j + k.1 * array[i][j]
                if !(0..<n).contains(nx) || !(0..<n).contains(ny) { continue }
                if (nx, ny) == (n - 1, n - 1) {
                    d[i][j] += 1
                } else if d[nx][ny] != 0 {
                    d[i][j] += d[nx][ny]
                }
            }
        }
    }

    return d[0][0]
}

print(solution(array, n))
