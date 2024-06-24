//
//  Baekjoon14950.swift
//  Solved
//
//  Created by 임현규 on 6/24/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], t = input[2]
var array = [[Int]]()
var parents = Array(0..<n)

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ t: Int) -> Int {
    var count = 0
    var result = 0
    let array = array.sorted { $0[2] < $1[2] }
    
    for i in array {
        let a = i[0] - 1, b = i[1] - 1, c = i[2]
        if find(a) != find(b) {
            union(a, b)
            result += c + count * t
            count += 1
        }
    }
    
    return result
}

func find(_ a: Int) -> Int {
    return parents[a] == a ? a : find(parents[a])
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

print(solution(array, n, m, t))
