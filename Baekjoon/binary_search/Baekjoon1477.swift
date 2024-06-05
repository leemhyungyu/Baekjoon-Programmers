//
//  Baekjoon1477.swift
//  Solved
//
//  Created by 임현규 on 6/5/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], l = input[2]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ m: Int, _ l: Int) -> Int {
    let array = [0] + array.sorted() + [l]
    var start = 1, end = l
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 0
        
        for i in 0..<array.count - 1 {
            count += (array[i + 1] - array[i] - 1) / mid
        }

        if count > m {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return start
}

print(solution(array, n, m, l))

