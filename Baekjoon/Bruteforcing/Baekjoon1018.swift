//
//  Baekjoon1018.swift
//  
//
//  Created by 임현규 on 2023/05/20.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var borad = [[String]]()

for _ in 0..<n {
    borad.append(readLine()!.map { String($0) })
}

var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func solution(_ borad: [[String]]) -> Int {

    var result = 100
        
    for i in 0..<n - 7 {
        for j in 0..<m - 7 {
            
            result = min(findChessBoard(i, j, "B"), findChessBoard(i, j, "W"), result)
        }
    }

    return result
}

func findChessBoard(_ x: Int, _ y: Int, _ start: String) -> Int {
    
    var target = borad
    var count = target[x][y] == start ? 0 : 1
    
    target[x][y] = start
    
    for i in x..<x + 8 {
        for j in y..<y + 8 {
            for k in dxdy {
                let nx = i + k.0
                let ny = j + k.1
                
                if (x..<x + 8).contains(nx) && (y..<y + 8).contains(ny) {
                    if target[nx][ny] == target[i][j] {
                        target[nx][ny] = target[i][j] == "B" ? "W" : "B"
                        count += 1
                    }
                }
            }
        }
    }
        
    return count
}

print(solution(borad))
