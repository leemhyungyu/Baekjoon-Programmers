//
//  Baekjoon24391.swift
//  Solved
//
//  Created by 임현규 on 2024/05/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let codes = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [[Int]], _ codes: [Int], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var parents = Array(repeating: 0, count: n + 1)
    
    for i in 1...n {
        parents[i] = i
    }
    
    
    func findParent(_ a: Int) -> Int {
        if parents[a] == a { return a }
        parents[a] = findParent(parents[a])
        return parents[a]
    }
    
    func union(_ a: Int, _ b: Int) {
        let a = findParent(a), b = findParent(b)
        
        if a == b { return }
        
        if a > b {
            parents[a] = b
        } else {
            parents[b] = a
        }
    }
    
    for i in array {
        let a = i[0], b = i[1]
        union(a, b)
    }
    
    for i in 1..<codes.count {
        if findParent(codes[i - 1]) != findParent(codes[i]) { result += 1 }
    }
    
    return result
}


print(solution(array, codes, n, m))
