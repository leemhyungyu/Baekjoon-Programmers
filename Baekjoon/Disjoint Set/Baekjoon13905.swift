//
//  Baekjoon13905.swift
//  Solved
//
//  Created by 임현규 on 6/4/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
input = readLine()!.split(separator: " ").map { Int($0)! }
let s = input[0], e = input[1]
var array = [[Int]]()
var parents = Array(0..<n)

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}
array.sort { $0[2] > $1[2] }

func find(_ a: Int) -> Int {
    a == parents[a] ? a : find(parents[a])
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

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ s: Int, _ e: Int) -> Int {
    var result = 0
    for i in array {
        let h1 = i[0] - 1, h2 = i[1] - 1, k = i[2]
        if find(h1) != find(h2) {
            union(h1, h2)
            if find(s - 1) == find(e - 1) {
                result = k
                break
            }
        }
    }
    
    return result
}

print(solution(array, n, m, s, e))


