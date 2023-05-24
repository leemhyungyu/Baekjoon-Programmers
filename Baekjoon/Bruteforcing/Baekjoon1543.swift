//
//  Baekjoon1543.swift
//  
//
//  Created by 임현규 on 2023/05/24.
//

import Foundation

let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }

func solution(_ a: [String], _ b: [String]) -> Int {
    
    return a.joined().replacingOccurrences(of: b.joined(), with: "1").filter { $0 == "1" }.count
    
}

print(solution(a, b))
