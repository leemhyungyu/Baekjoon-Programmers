//
//  Baekjoon2866.swift
//  Solved
//
//  Created by 임현규 on 2024/04/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1]
var array = [[String]]()

for _ in 0..<r {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]], _ r: Int, _ c: Int) -> Int {
    var start = 0, end = r - 1
    var count = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var savedString = Set<String>()
        
        for i in 0..<c {
            var temp = ""
            for j in mid..<r {
                temp += array[j][i]
            }
            savedString.insert(temp)
        }
        
        if savedString.count != c {
            end = mid - 1
        } else {
            start = mid + 1
            count = mid
        }
    }
    
    return count
}

print(solution(array, r, c))
