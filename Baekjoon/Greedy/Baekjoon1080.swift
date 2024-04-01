//
//  Baekjoon1080.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var a = [[Int]](), b = [[Int]]()

for _ in 0..<n {
    a.append(readLine()!.map { Int(String($0))! })
}

for _ in 0..<n {
    b.append(readLine()!.map { Int(String($0))! })
}

func solution(_ a: inout [[Int]], _ b: inout [[Int]], _ n: Int, _ m: Int) -> Int {
    if a == b { return 0 }
    if n < 3 || m < 3 { return -1 }
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    
    for i in 0..<n {
        for j in 0..<m {
            if a[i][j] == b[i][j] { continue }
            result += 1
            if change((i, j), &a, &b) { return result }
        }
    }
    
    return result == 0 ? 0 : -1
}

func change(_ start: (Int, Int), _ a: inout [[Int]], _ b: inout [[Int]]) -> Bool {
    let endX = start.0 + 3, endY = start.1 + 3

    if !(0...n).contains(endX) || !(0...m).contains(endY) { return false }
    
    for i in start.0..<endX{
        for j in start.1..<endY {
            a[i][j] = a[i][j] == 1 ? 0 : 1
        }
    }
    return a == b
}

print(solution(&a, &b, n, m))
