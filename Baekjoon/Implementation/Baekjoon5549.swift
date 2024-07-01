//
//  Baekjoon5549.swift
//  Solved
//
//  Created by 임현규 on 7/1/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let k = Int(readLine()!)!
var array = [[String]]()
var info = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.map { String($0) })
}

for _ in 0..<k {
    info.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[String]], _ info: [[Int]], _ n: Int, _ m: Int, _ k: Int) -> [[Int]] {
    var jungle = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var ocean = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var ice = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var result = [[Int]]()

    for i in 1...n {
        for j in 1...m {
            let geography = array[i - 1][j - 1]
            jungle[i][j] = jungle[i - 1][j] + jungle[i][j - 1] - jungle[i - 1][j - 1]
            ocean[i][j] = ocean[i - 1][j] + ocean[i][j - 1] - ocean[i - 1][j - 1]
            ice[i][j] = ice[i - 1][j] + ice[i][j - 1] - ice[i - 1][j - 1]

            if geography == "J" {
                jungle[i][j] += 1
            } else if geography == "O" {
                ocean[i][j] += 1
            } else {
                ice[i][j] += 1
            }
        }
    }
        
    for i in 0..<k {
        let pos = info[i]
        let x1 = pos[0], y1 = pos[1], x2 = pos[2], y2 = pos[3]
        result.append([
            jungle[x2][y2] - jungle[x2][y1 - 1] - jungle[x1 - 1][y2] + jungle[x1 - 1][y1 - 1],
            ocean[x2][y2] - ocean[x2][y1 - 1] - ocean[x1 - 1][y2] + ocean[x1 - 1][y1 - 1],
            ice[x2][y2] - ice[x2][y1 - 1] - ice[x1 - 1][y2] + ice[x1 - 1][y1 - 1]
            
        ])
    }
    
    return result
}

solution(array, info, n, m, k).forEach {
    print($0.map { String($0) }.joined(separator: " "))
}
