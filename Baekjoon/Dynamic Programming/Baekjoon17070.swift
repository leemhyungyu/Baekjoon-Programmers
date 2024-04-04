//
//  Baekjoon17070.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    let dxdy = [0, 1, 2] // 가로, 세로, 대각선
    var d = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n), count: n)
    d[0][1][0] = 1
    
    for i in 0..<n {
        for j in 0..<n {
            for k in (0..<3) {
                let x = i, y = j
                if array[x][y] == 1 { continue }
                switch k {
                case 0: // 가로인 경우
                    if y - 1 < 0 { continue }
                    d[x][y][0] = max(d[x][y][0], d[x][y - 1][0] + d[x][y - 1][2])
                case 1: // 세로인 경우
                    if x - 1 < 0 { continue }
                    d[x][y][1] = max(d[x][y][1], d[x - 1][y][1] + d[x - 1][y][2])
                case 2: // 대각선인 경우
                    if x - 1 < 0 || y - 1 < 0 { continue }
                    if array[x - 1][y] == 1 || array[x][y - 1] == 1 { continue}
                    d[x][y][2] = max(d[x][y][2], d[x - 1][y - 1][0] + d[x - 1][y - 1][1] + d[x - 1][y - 1][2])
                default:
                    break
                }
            }
        }
    }
    
    return d[n - 1][n - 1].reduce(0) { $0 + $1 }
}

print(solution(array, n))
