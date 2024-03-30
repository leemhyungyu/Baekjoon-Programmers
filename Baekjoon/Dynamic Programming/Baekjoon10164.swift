//
//  Baekjoon10164.swift
//  Solved
//
//  Created by 임현규 on 2024/03/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[2]

var dxdy = [(0, -1), (-1, 0)]

func solution(_ n: Int, _ m: Int, _ k: Int) -> Int {
    var result = 0
    var d = Array(repeating: Array(repeating: 0, count: m), count: n)
    var kPos: (Int, Int) {
        if k == 0 { return (0, 0) }
        return (k % m == 0 ? k / m - 1 : k / m,
                k <= m ? k - 1 : k % m == 0 ? m - 1 : k % m - 1)
    }
    
    d[n - 1][m - 1] = 1
    
    for i in (kPos.0..<n).reversed() {
        for j in (kPos.1..<m).reversed() {
            let x = i, y = j
            if (i, j) == kPos { continue }
            for k in dxdy {
                let nx = x + k.0, ny = y + k.1
                
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                d[nx][ny] += d[x][y]
            }
        }
    }
    for i in (0...kPos.0).reversed() {
        for j in (0...kPos.1).reversed() {
            let x = i, y = j
            
            for k in dxdy {
                let nx = x + k.0, ny = y + k.1
                
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                d[nx][ny] += d[x][y]
            }
        }
    }
    
    return d[0][0]
}

print(solution(n, m, k))
