//
//  Baekjoon22866.swift
//  Solved
//
//  Created by 임현규 on 2024/04/20.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) {
    var buliding = [[Int]]()
    var result = Array(repeating: (100001, 100001), count: n)
    var count = Array(repeating: 0, count: n)
    for i in 0..<n {
        while !buliding.isEmpty {
            if array[i] >= buliding.last![0] {
                buliding.removeLast()
            } else {
                break
            }
        }
        
        if !buliding.isEmpty {
            result[i] = (buliding.last![0] - array[i], buliding.last![1])
            count[i] += buliding.count
        }
        
        buliding.append([array[i], i + 1])
    }
    
    buliding = [[Int]]()
    
    for i in (0..<n).reversed() {
        while !buliding.isEmpty {
            if array[i] >= buliding.last![0] {
                buliding.removeLast()
            } else {
                break
            }
        }
        
        if !buliding.isEmpty {
            if result[i].1 == 100001 {
                result[i] = (buliding.last![0] - array[i], buliding.last![1])
            } else if abs(buliding.last![1] - i) < abs(i - result[i].1) {
                result[i] = (buliding.last![0] - array[i], buliding.last![1])

            }
            count[i] += buliding.count
        }
        
        buliding.append([array[i], i])
    }
    
    for i in 0..<n {
        if count[i] == 0 {
            print(count[i])
        } else {
            print(count[i], result[i].1 + 1)
        }
    }
}

solution(array, n)
