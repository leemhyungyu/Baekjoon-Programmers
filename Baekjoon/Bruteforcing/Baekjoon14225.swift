//
//  Baekjoon14225.swift
//  
//
//  Created by 임현규 on 2023/05/28.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var numSet = Set<[Int]>()
var resultSet = Set<Int>()
var result = 0

func solution(_ array: [Int]) -> Int {
    
    for i in 0..<n {
        dfs([array[i]], i)
    }
    
    
    for i in 1...resultSet.max()! {
        if !resultSet.contains(i) {
            result = i
            break
        }
    }
    
    
    return result == 0 ? resultSet.max()! + 1 : result
}

func dfs(_ numbers: [Int], _ index: Int) {
            
    numSet.insert(numbers)
    resultSet.insert(numbers.reduce(0) { $0 + $1 })
    
    if numbers.count == n {
        return
    }
    
    for i in index + 1..<n {
        if numSet.contains(numbers + [array[i]]) { continue }
        dfs(numbers + [array[i]], i)
    }
}

print(solution(array))
