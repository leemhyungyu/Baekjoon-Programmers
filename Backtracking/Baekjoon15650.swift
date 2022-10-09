//
//  Baekjoon15650.swift
//  
//
//  Created by 임현규 on 2022/10/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m =  input[1]
var visited = Array(repeating: false, count: n + 1)
var result = [Int]()

func dfs(_ length: Int) {
    
    if length == m {
        if result.sorted() == result {
            print(result.map{String($0)}.joined(separator: " "))
        }
        return
    }
    
    for i in 1...n {
        if visited[i] { continue }
        
        visited[i] = true
        result.append(i)
        dfs(length + 1)
        visited[i] = false
        result.popLast()
    }
}

dfs(0)
