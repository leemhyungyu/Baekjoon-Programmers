//
//  Baekjoon16922.swift
//  
//
//  Created by 임현규 on 2023/05/10.
//

import Foundation

let n = Int(readLine()!)!

var visited = Array(repeating: false, count: 1001)
var roma = [1, 5, 10, 50]
var result = 0

func solution(_ number: Int) -> Int {

    dfs(0, 0, 0)
    return result
}

func dfs(_ index: Int, _ number: Int, _ count: Int) {

    if count == n {

        if visited[number] { return }

        visited[number] = true
        result += 1

        return
    }

    for i in index..<4 {
        let sum = number + roma[i]
        dfs(i, sum, count + 1)
    }
}

print(solution(n))
