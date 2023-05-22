//
//  Baekjoon10974.swift
//  
//
//  Created by 임현규 on 2023/05/22.
//
import Foundation

let n = Int(readLine()!)!
var result = 0
var setArray = Set<[Int]>()
var visited = Array(repeating: false, count: n + 1)

func solution(_ num: Int) {
    
    for i in 1...n {
        dfs([i], i)
    }
}

func dfs(_ number: [Int], _ index: Int) {
    visited[index] = true

    if number.count == n {
        print(number.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if visited[i] { continue}
        dfs(number + [i], i)
        visited[i] = false
    }
    
    visited[index] = false
}


solution(n)
