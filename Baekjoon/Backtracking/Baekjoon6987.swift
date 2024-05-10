//
//  Baekjoon6987.swift
//  Solved
//
//  Created by 임현규 on 2024/05/10.
//

import Foundation

var array = [[Int]]()

for _ in 0..<4 {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solutioin(_ array: [[Int]]) -> [Int] {
    var result = Array(repeating: 0, count: 4)
    var count = 0
    for i in array {
        var scoreBoard = Array(repeating: Array(repeating: 0, count: 3), count: 6)
        var isFlag = true
        for j in 0..<i.count {
            scoreBoard[j / 3][j % 3] = i[j]
        }
        
        for j in 0..<6 {
            if scoreBoard[j].reduce(0) { $0 + $1 } != 5 {
                isFlag = false
            }
        }
        
        if isFlag {
            backTraking(0, 1, scoreBoard)
        }
    
        count += 1
    }
    
    func backTraking(_ home: Int, _ away: Int, _ scoreBoard: [[Int]]) {
        var home = home, away = away
        
        if away == 6 {
            home += 1
            away = home + 1
        }
        
        if home == 5 {
            result[count] = 1
            return
        }

        var newScoreBoard = scoreBoard
        
        // home 승
        if newScoreBoard[home][0] > 0 && newScoreBoard[away][2] > 0 {
            newScoreBoard[home][0] -= 1
            newScoreBoard[away][2] -= 1
            backTraking(home, away + 1, newScoreBoard)
        }

        // home 무
        newScoreBoard = scoreBoard
        if newScoreBoard[home][1] > 0 && newScoreBoard[away][1] > 0 {
            newScoreBoard[home][1] -= 1
            newScoreBoard[away][1] -= 1
            backTraking(home, away + 1, newScoreBoard)
        }

        // home 패
        newScoreBoard = scoreBoard
        if newScoreBoard[home][2] > 0 && newScoreBoard[away][0] > 0 {
            newScoreBoard[home][2] -= 1
            newScoreBoard[away][0] -= 1
            backTraking(home, away + 1, newScoreBoard)
        }
    }

    return result
}

print(solutioin(array).map { String($0) }.joined(separator: " "))
