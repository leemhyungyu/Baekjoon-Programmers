//
//  Baekjoon3079.swift
//  Solved
//
//  Created by 임현규 on 2024/04/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { UInt64($0)! }
let n = input[0], m = input[1]
var array = [UInt64]()
for _ in 0..<n {
    array.append(UInt64(readLine()!)!)
}

func solution(_ array: [UInt64], _ n: UInt64, _ m: UInt64) -> UInt64 {
    var array = array.sorted { $0 < $1 }
    var result = UInt64.max
    var start = UInt64(1), end = UInt64(array.min()! * m)
    
    while start <= end {
        let mid = (start + end) / 2
        let people = array.map { mid / $0 }.reduce(0) { $0 + $1 }
        
        if people >= m {
            result = min(result, UInt64(mid))
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return result
}

print(solution(array, n, m))

