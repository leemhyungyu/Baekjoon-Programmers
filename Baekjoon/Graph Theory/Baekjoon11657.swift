//
//  Baekjoon11657.swift
//  Solved
//
//  Created by 임현규 on 6/18/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> [Int] {
    var dist = Array(repeating: Int.max, count: n)
        
    func bp(_ start: Int) -> Bool {
        dist[start] = 0
        for i in 0..<n {
            for j in 0..<m {
                let now = array[j][0] - 1, next = array[j][1] - 1, cost = array[j][2]
                
                if dist[now] != Int.max && dist[next] > dist[now] + cost {
                    dist[next] = dist[now] + cost
                    
                    if i == n - 1 { return false }
                }
            }
        }
        
        return true
    }
    
    return !bp(0) ? [-1] : dist[1..<n].map { $0 == Int.max ? -1 : $0 }
}

solution(array, n, m).forEach { print($0) }
