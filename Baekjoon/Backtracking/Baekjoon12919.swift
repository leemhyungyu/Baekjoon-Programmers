//
//  Baekjoon12919.swift
//  Solved
//
//  Created by 임현규 on 2024/04/07.
//

import Foundation

let s = readLine()!.map { String($0) }
let t = readLine()!.map { String($0) }

func solution(_ s: [String], _ t: [String]) -> Int {
    var s = s, t = t
    var isSuccess = false
    func backTraking(_ array: [String]) {
        let firstIndex = 0, lastIndex = array.count - 1
        if array.count == s.count {
            if array == s {
                isSuccess = true
            }
            return
        }
        
        if array[firstIndex] == "A" && array[lastIndex] == "B" {
            return
        }
        
        if array[firstIndex] == "B" && array[lastIndex] == "A" {
            backTraking(Array(array[firstIndex...lastIndex - 1]))
            backTraking(Array(array[firstIndex + 1...lastIndex]).reversed())
        } else if array.first! == "B" {
            backTraking(Array(array[firstIndex + 1...lastIndex]).reversed())

        } else if array.last! == "A" {
            backTraking(Array(array[firstIndex...lastIndex - 1]))
        }
    }
    
    backTraking(t)
    return isSuccess ? 1 : 0
}

print(solution(s, t))
