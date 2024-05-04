//
//  Baekjoon16943.swift
//  Solved
//
//  Created by 임현규 on 2024/05/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0], b = input[1]

func solution(_ a: Int, _ b: Int) -> Int {
    var c = -1
    let a = String(a).map { Int(String($0))! }
    
    func backTraking(_ now: [Int], _ route: [Int]) {
        if !now.isEmpty && now.count == a.count && now[0] != 0  {
            let number = Int(now.map { String($0) }.joined())!
            if number < b { c = max(c, number) }
        }
        
        for i in 0..<a.count {
            if route.contains(i) { continue }
            backTraking(now + [a[i]], route + [i])
        }
    }
    
    backTraking([], [])
    return c
}

print(solution(a, b))
