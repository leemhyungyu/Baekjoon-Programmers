//
//  행렬 테두리 회전하기.swift
//  
//
//  Created by 임현규 on 2023/04/19.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {

    var array = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var result = [Int]()
    var number = 1
    
    for i in 0..<rows {
        for j in 0..<columns {
            array[i][j] = number
            number += 1
        }
    }
    
    for i in queries {
        
        var preNum = array[i[0] - 1][i[1] - 1]
        var temp = 0
        var minNum = preNum
        
        // 윗변
        for j in i[1]...i[3] - 1 {
            temp = array[i[0] - 1][j]
            array[i[0] - 1][j] = preNum
            preNum = temp
            
            minNum = min(minNum, preNum)
        }
        
        // 오른쪽 변
        for j in i[0]...i[2] - 1 {
            temp = array[j][i[3] - 1]
            array[j][i[3] - 1] = preNum
            preNum = temp
            minNum = min(minNum, preNum)
        }
        
        // 아랫 변
        for j in (i[1] - 1...i[3] - 2).reversed() {
            temp = array[i[2] - 1][j]
            array[i[2] - 1][j] = preNum
            preNum = temp
            minNum = min(minNum, preNum)
        }
        
        // 왼쪽 변
        for j in (i[0] - 1...i[2] - 2).reversed() {
            temp = array[j][i[1] - 1]
            array[j][i[1] - 1] = preNum
            preNum = temp
            minNum = min(minNum, preNum)
        }
        
        result.append(minNum)
    }
    
    return result
}
