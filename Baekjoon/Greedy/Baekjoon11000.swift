//
//  Baekjoon11000.swift
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
    var leacture = [(Int, Bool)]()
    var result = 0
    var count = 0
    for i in array {
        leacture.append((i[0], true))
        leacture.append((i[1], false))
    }
    
    leacture.sort { $0.0 == $1.0 ? !$0.1 : $0.0 < $1.0 }

    for i in leacture {
        if i.1 {
            count += 1
            result = max(result, count)
        } else {
            count -= 1
        }
    }
    
    return result
}

print(solution(array, n))
