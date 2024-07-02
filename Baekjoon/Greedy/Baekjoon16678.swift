//
//  Baekjoon16678.swift
//  Solved
//
//  Created by 임현규 on 7/2/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int) -> Int {
    let array = array.sorted { $0 < $1 }
    var count = 0, last = 1
    
    for i in 1...n {
        let score = array[i - 1]
        if score < last { continue }
        count += score - last
        last += 1
    }
    
    return count
}

print(solution(array, n))
