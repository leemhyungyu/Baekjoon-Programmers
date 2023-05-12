//
//  Baekjoon1205.swift
//  
//
//  Created by 임현규 on 2023/05/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], new = input[1], p = input[2]
var scores = [Int]()

if n > 0 {
    scores = readLine()!.split(separator: " ").map { Int(String($0))! }
} else {
    print(1)
    exit(0)
}

if n == p && new <= scores.last! {
    print(-1)
    exit(0)
}

var count = 0

for score in scores {
    if score > new {
        count += 1
    }
}

print(count + 1)
