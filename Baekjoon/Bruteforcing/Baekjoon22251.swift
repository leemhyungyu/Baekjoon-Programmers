//
//  Baekjoon22251.swift
//  Solved
//
//  Created by 임현규 on 5/17/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1], p = input[2], x = input[3]


func solution(_ n: Int, _ k: Int, _ p: Int, _ x: Int) -> Int {
    var result = 0
    let led = [
        [true, true, true, true, true, true, false],
        [false, false, false, false, true, true, false],
        [true, false, true, true, false, true, true],
        [true, false, false, true, true, true, true],
        [false, true, false, false, true, true, true],
        [true, true, false, true, true, false, true],
        [true, true, true, true, true, false, true],
        [true, false, false, false, true, true, false],
        [true, true, true, true, true, true, true],
        [true, true, false, true, true, true, true]
    ]
    
    for i in 1...n {
        if i == x { continue }
        var count = 0
        var from = x, to = i
        for _ in 0..<k {
            for z in 0..<7 {
                if led[from % 10][z] != led[to % 10][z] {
                    count += 1
                }
            }
            
            from /= 10
            to /= 10
        }
        
        if count <= p { result += 1 }
    }
    
    return result
}

print(solution(n, k, p, x))
