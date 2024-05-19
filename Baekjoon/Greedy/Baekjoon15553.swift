//
//  Baekjoon15553.swift
//  Solved
//
//  Created by 임현규 on 5/19/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}


func solution(_ array: [Int], _ n: Int, _ k: Int) -> Int {
    var diff = [Int]()
    
    for i in 0..<n - 1 {
        diff.append(array[i + 1] - array[i])
    }
    
    return diff.sorted { $0 > $1 }[k - 1..<n - 1].reduce(0) { $0 + $1 } + k
}

print(solution(array, n, k))
