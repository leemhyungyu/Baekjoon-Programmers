//
//  Baekjoon1669.swift
//  Solved
//
//  Created by 임현규 on 2024/04/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let x = input[0], y = input[1]

func solution(_ x: Int, _ y: Int) -> Int {
    var height = 0, day = 0
    var isFlag = false
    
    for i in 1...y {
        for _ in 0..<2 {
            if y - x <= height {
                isFlag = true
                break
            }
            height += i
            day += 1
        }
        
        if isFlag { break }
    }
    
    return day
}

print(solution(x, y))

