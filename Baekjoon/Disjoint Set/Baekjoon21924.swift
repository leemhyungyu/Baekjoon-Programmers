//
//  Baekjoon21924.swift
//  Solved
//
//  Created by 임현규 on 6/2/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [(Int, Int, Int)]()
var parents = Array(0..<n)
var minCost = 0
var count = 0
var totalCost = 0

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((input[0] - 1, input[1] - 1, input[2]))
    totalCost += input[2]
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

func find(_ a: Int) -> Int {
    if a == parents[a] { return a }
    return find(parents[a])
}

array.sort { $0.2 < $1.2 }

for i in array {
    let a = i.0, b = i.1, c = i.2
    if find(a) == find(b) { continue }
    union(a, b)
    count += 1
    minCost += c
}

print(count == n - 1 ? totalCost - minCost : -1)

