//
//  Baekjoon16564.swift
//  Solved
//
//  Created by 임현규 on 2024/05/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var levels = [Int]()
for _ in 0..<n {
    levels.append(Int(readLine()!)!)
}

func solutioin(_ levels: [Int], _ n: Int, _ k: Int) -> Int {
    var levels = levels.sorted()
    var result = 0
    var start = levels.min()!, end = 2000000000

    while start <= end {
        let mid = (start + end) / 2
        
        if levels.filter { $0 < mid }.map { mid - $0 }.reduce(0) { $0 + $1 } <= k {
            result = max(mid, result)
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return result
}

print(solutioin(levels, n, k))

