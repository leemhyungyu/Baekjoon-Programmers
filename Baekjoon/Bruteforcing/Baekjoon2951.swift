//
//  Baekjoon2951.swift
//  
//
//  Created by 임현규 on 2023/05/25.
//

import Foundation

let n = Int(readLine()!)!
var array = [(Int, Int)]()
var result = Int.max

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    array.append((input[0], input[1]))
}

func solution(_ n: Int) -> Int {

    for i in 0..<n {
        dfs([array[i]], i)
    }
    
    return result
}

func dfs(_ food: [(Int, Int)], _ index: Int) {
    
    result = min(result, calFood(food))
    
    if food.count == n {
        return
    }
    
    for i in index + 1..<n {
        dfs(food + [array[i]], i)
    }
}

func calFood(_ food: [(Int, Int)]) -> Int {
    var sin = 1
    var ssun = 0
    
    for i in food {
        sin *= i.0
        ssun += i.1
    }
    
    return abs(sin - ssun)
}

print(solution(n))
