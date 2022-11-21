//
//  Baekjoon15652.swift
//  
//
//  Created by 임현규 on 2022/10/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

var result = [String]()

func dfs(_ length: Int, _ start: Int) {
            
    if length == m {
        print(result.joined(separator: " "))
        return
    }
    
    for i in start...n {
        result.append("\(i)")
        dfs(length + 1, i)
        result.popLast()
    }
}

dfs(0, 1)
