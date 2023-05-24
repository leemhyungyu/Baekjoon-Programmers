//
//  Baekjoon2210.swift
//  
//
//  Created by 임현규 on 2023/05/24.
//

import Foundation

var board = [[Int]]()
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우
var numberSet = Set<[Int]>()

for _ in 0..<5 {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func solution(_ board: [[Int]]) -> Int {
    
    for i in 0..<5 {
        for j in 0..<5 {
            dfs([board[i][j]], i, j)
        }
    }
    
    return numberSet.count
}

func dfs(_ n: [Int], _ x: Int, _ y: Int) {
    if n.count == 6 {
        numberSet.insert(n)
        return
    }
    
    for i in dxdy {
        var nx = x + i.0
        var ny = y + i.1
        
        if (0..<5).contains(nx) && (0..<5).contains(ny) {
            dfs(n + [board[nx][ny]], nx, ny)
        }
    }
}

print(solution(board))
