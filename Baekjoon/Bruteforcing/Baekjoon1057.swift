//
//  Baekjoon1057.swift
//  
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0], kim = input[1], leem = input[2]

func solution(_ num: Int, _ kim: Int, _ leem: Int) -> Int {
    var result = 0
    var kim = kim
    var leem = leem
    
    while kim != leem {
        kim = (kim + 1) / 2
        leem = (leem + 1) / 2
        result += 1
    }
    
    return result
}

print(solution(n, kim, leem))
