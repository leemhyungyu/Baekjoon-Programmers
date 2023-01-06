//
//  Baekjoon6603.swift
//  
//
//  Created by 임현규 on 2023/01/06.
//

import Foundation

var k = 0
var check = [Bool]()
var array = [Int]()
var result = [Int]()

while true {
    array = readLine()!.split(separator: " ").map { Int($0)! }
    
    if array[0] == 0 {
        break
    }
    
    k = array.removeFirst()

    check = Array(repeating: false, count: k)
    dfs(0, 0)
    print()
}

func dfs(_ length: Int, _ start: Int) {
    
    if length == 6 {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in start...k - 1 {
        if check[i] { continue }
        
        check[i] = true
        result.append(array[i])
        dfs(length + 1, i)
        check[i] = false
        result.removeLast()
    }
}
