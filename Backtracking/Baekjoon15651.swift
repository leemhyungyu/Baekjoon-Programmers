//
//  Baekjoon15651.swift
//  
//
//  Created by 임현규 on 2022/10/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

var result = [String]()

func dfs(_ length: Int) {
            
    if length == m {
        print(result.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        result.append("\(i)")
        dfs(length + 1)
        result.popLast()
    }
}

dfs(0)
