//
//  Baekjoon10819.swift
//  
//
//  Created by 임현규 on 2023/05/22.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
var setArray = Set<[Int]>()
var visited = Array(repeating: false, count: n)

func solution(_ array: [Int]) -> Int {
    
    for i in 0..<array.count {
        visited = Array(repeating: false, count: n)
        visited[i] = true
        dfs([array[i]], i)
    }
    
    for i in setArray {
        result = max(culArray(i), result)
    }
    
    return result
}

func dfs(_ number: [Int], _ index: Int) {
    visited[index] = true

    if number.count == n {
        setArray.insert(number)
        return
    }
    
    for i in 0..<array.count {
        if visited[i] { continue}
        dfs(number + [array[i]], i)
        visited[i] = false
    }
}

func culArray(_ array: [Int]) -> Int {
    
    var sum = 0
    
    for i in 0..<array.count - 1 {
        sum += abs(array[i] - array[i + 1])
    }
    
    return sum
}

print(solution(array))
