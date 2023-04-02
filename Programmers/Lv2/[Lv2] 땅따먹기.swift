//
//  [Lv2] 땅따먹기.swift
//  
//
//  Created by 임현규 on 2023/04/03.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var board = land
    
    for i in 1..<land.count {
        board[i][0] += [board[i - 1][1], board[i - 1][2], board[i - 1][3]].max()!
        board[i][1] += [board[i - 1][0], board[i - 1][2], board[i - 1][3]].max()!
        board[i][2] += [board[i - 1][0], board[i - 1][1], board[i - 1][3]].max()!
        board[i][3] += [board[i - 1][0], board[i - 1][1], board[i - 1][2]].max()!
        
    }

    return board.last!.max()!
}
