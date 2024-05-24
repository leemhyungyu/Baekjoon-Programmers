//
//  Baekjoon19942.swift
//  Solved
//
//  Created by 임현규 on 5/24/24.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let mp = input[0], mf = input[1], ms = input[2], mu = input[3]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ mp: Int, _ mf: Int, _ ms: Int, _ mu: Int) {
    var minCost = 7501
    var result = [Int]()
    func backTraking(_ choice: Int, route: [Int], now: [Int], _ cost: Int) {
        
        if now[0] >= mp && now[1] >= mf && now[2] >= ms && now[3] >= mu {
            if minCost > cost {
                result = route
                minCost = cost
            }
            
            return
        }
        
        for i in choice + 1..<n {
            var next = now
            next[0] += array[i][0]
            next[1] += array[i][1]
            next[2] += array[i][2]
            next[3] += array[i][3]
            backTraking(i, route: route + [i], now: next, cost + array[i][4])
        }
    }
    
    
    for i in 0..<n {
        backTraking(i, route: [i], now: [array[i][0], array[i][1], array[i][2], array[i][3]], array[i][4])
    }
    
    if minCost == 7501 {
        print(-1)
    } else {
        print(minCost)
        print(result.map { String($0 + 1) }.joined(separator: " "))
    }
}

solution(array, n, mp, mf, ms, mu)
