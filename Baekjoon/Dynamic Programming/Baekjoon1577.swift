//
//  Baekjoon1577.swift
//  Solved
//
//  Created by 임현규 on 2024/04/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let k = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<k {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var check = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m + 1), count: n + 1)
    var d = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
    for i in array {
        let a = i[0], b = i[1], c = i[2], d = i[3]
        if a + b < c + d {
            if a < c {
                check[a][b][0] = true
            } else if b < d {
                check[a][b][1] = true
            }
        } else {
            if a > c {
                check[c][d][0] = true
            } else if b > d {
                check[c][d][1] = true
            }
        }
    }
    
    d[0][0] = 1
    
    for x in 0...n {
        for y in 0...m {
            let nx = x + 1, ny = y + 1
            // 아래로 갈 수 있으면
            if !check[x][y][0] && (0...n).contains(nx) {
                d[nx][y] += d[x][y]
            }
            // 오른쪽으로 갈 수 있으면
            if !check[x][y][1] && (0...m).contains(ny){
                d[x][ny] += d[x][y]
            }
        }
    }
        
    return d[n][m]
}

print(solution(array, n, m))
