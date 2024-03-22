//
//  양궁대회.swift
//  
//
//  Created by 임현규 on 2024/03/22.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var maxScore = 0
    var result = [Int]()
    var isWin = false
    
    func backTraking(_ lion: [Int], _ index: Int, _ count: Int) {
        if count == n {
            guard let gameResult = game(lion, info) else { return }
            
            if maxScore < gameResult {
                result = lion
                maxScore = gameResult
            } else if maxScore == gameResult {
                result = score(result, lion)
            }
            
            isWin = true
            
            return
        }

        var temp = lion
        
        for i in index...10 {
            if count == n { continue }
            temp[i] += 1
            backTraking(temp, i, count + 1)
            temp[i] -= 1
        }
    }
    
    backTraking([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 0, 0)
    
    return isWin ? result : [-1]
}

// 두 사람의 경기 결과 리턴
// lion이 이기면 Int, 지면 nil
func game(_ lion: [Int], _ apeach: [Int]) -> Int? {
    var lionScore = 0
    var apeachScore = 0
    
    for i in 0...10 {
        if apeach[i] == 0 && lion[i] == 0 { continue }
        
        if apeach[i] == lion[i] {
            apeachScore += 10 - i
        } else if apeach[i] > lion[i] {
            apeachScore += 10 - i
        } else {
            lionScore += 10 - i
        }
    }
        
    return lionScore > apeachScore ? lionScore - apeachScore : nil
}

func score(_ a: [Int], _ b: [Int]) -> [Int] {
    for i in (0...10).reversed() {
        if a[i] == b[i] { continue }
        return a[i] > b[i] ? a : b
        
    }
    return a
}
