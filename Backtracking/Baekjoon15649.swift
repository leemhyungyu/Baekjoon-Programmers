//
//  Baekjoon15649.swift
//  
//
//  Created by 임현규 on 2022/10/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var check = Array(repeating: false, count: n + 1)

func dfs(_ length: Int, _ stack: [String]) {
    
    if length == m {
        print(stack.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if check[i] { continue }
        
        check[i] = true
        dfs(length + 1, stack + [String(i)])
        check[i] = false
    }
}

dfs(0, [])
