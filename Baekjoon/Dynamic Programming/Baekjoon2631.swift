//
//  Baekjoon2631.swift
//  Solved
//
//  Created by 임현규 on 5/27/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int) -> Int {
    var d = Array(repeating: 1, count: n)
    
    for i in 0..<n {
        for j in 0..<i {
            if array[j] > array[i] { continue }
            d[i] = max(d[i], d[j] + 1)
        }
    }
    
    return n - d.max()!
}

print(solution(array, n))
