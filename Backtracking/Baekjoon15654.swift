//
//  Baekjoon15654.swift
//  
//
//  Created by 임현규 on 2022/10/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

let array = readLine()!.split(separator: " ").map { Int($0)! }

let sortedArray = array.sorted(by: { $0 < $1} )
var visited = Array(repeating: false, count: n + 1)

var result = [String]()

func dfs(_ length: Int) {
            
    if length == m {
        print(result.joined(separator: " "))
        return
    }
    
    for i in 0...sortedArray.count - 1 {
        
        if visited[i] { continue }
        
        visited[i] = true
        result.append("\(sortedArray[i])")
        dfs(length + 1)
        result.popLast()
        visited[i] = false
    }
}

dfs(0)
