//
//  Baekjoon2565.swift
//  Solved
//
//  Created by 임현규 on 2024/04/05.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var array = array.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    var d = Array(repeating: 1, count: n)
    
    for i in 0..<array.count {
        for j in 0..<i {
            if array[i][1] > array[j][1] {
                d[i] = max(d[i], d[j] + 1)
            }
        }
    }
    
    return n - d.max()!
}
print(solution(array, n))
