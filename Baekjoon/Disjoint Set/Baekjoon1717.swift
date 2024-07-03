//
//  Baekjoon1717.swift
//  Solved
//
//  Created by 임현규 on 7/3/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var parents = Array(0...n)
var array = [[Int]]()

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let command = input[0], a = input[1], b = input[2]
    if command == 0 {
        union(a, b)
    } else {
        print(find(a) == find(b) ? "YES" : "NO")
    }
}

func find(_ a: Int) -> Int {
    if parents[a] == a { return a}
    parents[a] = find(parents[a])
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let a = find(a), b = find(b)
    
    if a == b { return }
    
    if a < b {
        parents[b] = a
    } else {
        parents[a] = b
    }
}

