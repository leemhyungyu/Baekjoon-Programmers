//
//  Baekjoon1263.swift
//  
//
//  Created by 임현규 on 2023/02/15.
//

import Foundation

let n = Int(readLine()!)!
var jobTuple = [(Int, Int)]()
var time = 0
var isResult = true
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    jobTuple.append((input[0], input[1]))
}

jobTuple.sort { $0.1 < $1.1 }

time = jobTuple[0].1 - jobTuple[0].0

for i in 1...jobTuple.count - 1 {
    
    if jobTuple[i - 1].1 + jobTuple[i].0 <= jobTuple[i].1 {
        jobTuple[i].1 = jobTuple[i - 1].1 + jobTuple[i].0
    } else {
        time -= (jobTuple[i - 1].1 + jobTuple[i].0)  - jobTuple[i].1
    }
    
    if time < 0 {
        isResult = false
        break
    }
}

print(isResult ? time : -1)
