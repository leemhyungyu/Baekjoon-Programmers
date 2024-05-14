//
//  Baekjoon18869.swift
//  Solved
//
//  Created by 임현규 on 2024/05/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ m: Int, _ n: Int) -> Int {
    var result = 0
    var universIndex = [[Int]]()
    for i in array {
        var dic = [Int: Int]()
        Set(i).sorted().enumerated().sorted { $0.element < $1.element }.forEach { dic[$0.element] = $0.offset }
        universIndex.append(i.map { dic[$0]! })
    }
    
    for i in 0..<m {
        for j in i + 1..<m {
            if universIndex[i] == universIndex[j] { result += 1 }
        }
    }
    
    return result
}

print(solution(array, m, n))
