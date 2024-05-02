//
//  Baekjoon20040.swift
//  Solved
//
//  Created by 임현규 on 2024/05/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var numbers = [[Int]]()
var parent = Array(0..<n)
var result = 0

func find(_ x: Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a == b { return }
    
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

for i in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    if find(a) == find(b) {
        result = i
        break
    } else {
        union(a, b)
    }
}

print(result)
