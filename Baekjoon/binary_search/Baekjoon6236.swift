//
//  Baekjoon6236.swift
//  Solved
//
//  Created by 임현규 on 2024/04/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ m: Int) -> Int {
    var start = 1
    var end = array.reduce(0) { $0 + $1 }
    var result = end
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 1
        var money = mid
        var isFlag = true
        for i in array {
            if i > mid {
                start = mid + 1
                isFlag = false
                break
            }
            
            if money - i < 0 {
                count += 1
                money = mid - i
            } else {
                money -= i
            }
        }
        
        if !isFlag { continue }

        if count <= m {
            end = mid - 1
            result = min(mid, result)
        } else if count > m {
            start = mid + 1
        }
    }
    
    return result
}

print(solution(array, n, m))
