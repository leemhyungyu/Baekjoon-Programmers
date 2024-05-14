//
//  Baekjoon15922.swift
//  Solved
//
//  Created by 임현규 on 2024/05/14.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var result = 0
    var currentX = array[0][0], currentY = array[0][1]
    
    for i in 1..<n {
        let x = array[i][0], y = array[i][1]
        
        // 다음 그릴 선분이 이전 선분에 포함되는 경우
        if x <= currentY {
            if y <= currentY {
                continue
            } else {
                currentY = y
            }
            
        } else { // 다음 그릴 선분이 이전 선분에 포함되지 않는 경우
            result += currentY - currentX
            currentX = x
            currentY = y
        }
    }
    
    result += currentY - currentX

    return result
}

print(solution(array, n))
