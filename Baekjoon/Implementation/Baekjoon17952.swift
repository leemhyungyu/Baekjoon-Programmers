//
//  Baekjoon17952.swift
//  
//
//  Created by 임현규 on 2023/05/14.
//

import Foundation

let n = Int(readLine()!)!

var project = [(Int, Int)]()
var count = 0
var index = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    if input.count == 1 {
        if !project.isEmpty {
            project[project.count - 1].1 -= 1
            if project[project.count - 1].1 == 0 {
                count += project.removeLast().0
            }
        }
    } else {
        
        var score = input[1], time = input[2]
        if time - 1 == 0 {
            count += score
        } else {
            project.append((score, time - 1))
        }
    }
}

print(count)
