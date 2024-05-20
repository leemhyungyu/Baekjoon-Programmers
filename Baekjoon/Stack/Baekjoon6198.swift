//
//  Baekjoon6198.swift
//  Solved
//
//  Created by 임현규 on 5/20/24.
//

import Foundation

let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int) -> Int {
    var stack = [Int]()
    var result = 0
    
    for i in array {
        if stack.isEmpty {
            stack.append(i)
        } else {
            var count = stack.count

            while !stack.isEmpty && stack.last! <= i {
                stack.removeLast()
                count -= 1
            }
            stack.append(i)
            result += count
        }
    }
    
    return result
}

print(solution(array, n))
