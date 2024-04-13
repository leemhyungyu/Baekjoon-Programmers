//
//  Baekjoon16938.swift
//  Solved
//
//  Created by 임현규 on 2024/04/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1], r = input[2], x = input[3]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ l: Int, _ r: Int, _ x: Int) -> Int {
    var result = 0
    
    func backTraking(_ now: Int, _ sum: Int, _ max: Int, _ min: Int, _ count: Int) {

        if count >= 2 {
            if (l...r).contains(sum) && max - min >= x {
                result += 1
            }
        }
        
        for i in now + 1..<n {
            backTraking(i, sum + array[i], max < array[i] ? array[i] : max, min > array[i] ? array[i] : min, count + 1)
        }
    }
    
    
    for i in 0..<n {
        backTraking(i, array[i], array[i], array[i], 1)
    }

    return result
}

print(solution(array, n, l, r, x))
