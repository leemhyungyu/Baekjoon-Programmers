//
//  Baekjoon16198.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    var result = 0
    var temp = array
    
    func backTraking(_ sum: Int) {

        if temp.count == 2 {
            result = max(result, sum)
            return
        }
        
        for i in 1..<temp.count - 1 {
            let result = temp[i - 1] * temp[i + 1]
            let number = temp[i]
            temp.remove(at: i)
            backTraking(sum + result)
            temp.insert(number, at: i)
        }
    }
    
    backTraking(0)
    
    return result
}

print(solution(array, n))
