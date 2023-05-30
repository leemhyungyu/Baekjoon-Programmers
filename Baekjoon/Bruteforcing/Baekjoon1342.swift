//
//  Baekjoon1342.swift
//  
//
//  Created by 임현규 on 2023/05/30.
//

import Foundation

let s = readLine()!
var result = 0
var counter = Array(repeating: 0, count: 26)

for i in s {
    counter[Int(i.asciiValue!) - 97] += 1
}

func solution(_ s: String) -> Int {
    
    makeString(-1, 0)

    return result
}

func makeString(_ target: Int, _ length: Int) {

    if length == s.count {
        result += 1
        return
    }
    
    for i in 0..<26 {
        if counter[i] < 1 || target == i { continue }
        
        counter[i] -= 1
        makeString(i, length + 1)
        counter[i] += 1
    }
}

print(solution(s))
