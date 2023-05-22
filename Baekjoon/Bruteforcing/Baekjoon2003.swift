//
//  Baekjoon2003.swift
//  
//
//  Created by 임현규 on 2023/05/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int]) -> Int {

    var result = 0
    var left = 0
    var right = 0

    while right < array.count {
        
        let sum = array[left...right].reduce(0) { $0 + $1 }
            
        if sum > m {
            left += 1
            right = left
        }
            
        if sum == m {
            left += 1
            right = left
            result += 1
        }
        
        if sum < m {
            right += 1
        }
    }

    return result
}

print(solution(array))
