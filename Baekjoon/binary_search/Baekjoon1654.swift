//
//  Baekjoon1654.swift
//  
//
//  Created by 임현규 on 2024/03/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0], n = input[1]
var lines = [Int]()

for _ in 0..<k {
    lines.append(Int(readLine()!)!)
}

func solution(_ lines: [Int], _ n: Int) -> Int {
    var length = 1
    var start = 1
    var end = lines.max()!
    var min = (start + end) / 2
    
    while start <= end {
        min = (start + end) / 2
        let count = countCutLine(lines, min)
        
        if count < n {
            end = min - 1
        } else if count >= n {
            start = min + 1
            length = min
        }
    }
    
    return length
}

func countCutLine(_ lines: [Int], _ length: Int) -> Int {
    var result = 0
    
    for line in lines {
        result += line / length
    }
        
    return result
}

print(solution(lines, n))
