//
//  Baekjoon1647.swift
//  Solved
//
//  Created by 임현규 on 5/22/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var array = array.sorted { $0[2] < $1[2] }
    var parents = Array(0..<n)
    var result = 0, maxCost = 0
    
    func find(_ a: Int) -> Int {
        if parents[a] == a { return a }
        return find(parents[a])
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
    
    for i in array {
        let a = i[0] - 1, b = i[1] - 1, c = i[2]
        if find(a) != find(b) {
            union(a, b)
            result += c
            maxCost = max(c, maxCost)
        }
    }
     
    return result - maxCost
}

print(solution(array, n, m))
