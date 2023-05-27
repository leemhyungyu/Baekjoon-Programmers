//
//  Baekjoon1535.swift
//  
//
//  Created by 임현규 on 2023/05/27.
//

import Foundation

let n = Int(readLine()!)!

let health = readLine()!.split(separator: " ").map { Int($0)! }
let funny = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

func solution(_ n: Int, _ health: [Int], _ funny: [Int]) -> Int {
    for i in 0..<n {
        dfs([health[i]], [funny[i]], i)
    }
    return result
}

func dfs(_ loss: [Int], _ gave: [Int], _ index: Int) {
        
    if loss.reduce(0) { $0 + $1 } >= 100 {
        return
    }
    
    result = max(result, gave.reduce(0) { $0 + $1 })
    
    for j in index + 1..<n {
        dfs(loss + [health[j]], gave + [funny[j]], j)
    }
}


print(solution(n, health, funny))
