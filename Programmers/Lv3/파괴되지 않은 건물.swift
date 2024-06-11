//
//  파괴되지 않은 건물.swift
//  Solved
//
//  Created by 임현규 on 6/11/24.
//

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let m = board.count, n = board.first!.count
    var temp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    var result = 0
    
    for i in skill {
        let type = i[0], r1 = i[1], c1 = i[2], r2 = i[3], c2 = i[4]
        let degree = type == 1 ? -i[5] : i[5]
        temp[r1][c1] += degree
        temp[r1][c2 + 1] += -degree
        temp[r2 + 1][c1] += -degree
        temp[r2 + 1][c2 + 1] += degree
    }
    

    for i in 1...m {
        for j in 0...n {
            temp[i][j] += temp[i - 1][j]
        }
    }
    
    for i in 1...n {
        for j in 0...m {
            temp[j][i] += temp[j][i - 1]
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] + temp[i][j] > 0 {
                result += 1
            }
        }
    }
    
    return result
}
