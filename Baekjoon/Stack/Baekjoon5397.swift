//
//  Baekjoon5397.swift
//  Solved
//
//  Created by 임현규 on 2024/03/27.
//

import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    print(solution(readLine()!))
}

func solution(_ keyLog: String) -> String {
    var pre = [String]()
    var post = [String]()
    var result = [String]()
    var pos = 0
    
    for i in keyLog {
        switch i {
        case "<":
            if pre.isEmpty { continue }
            post.append(pre.removeLast())
        case ">":
            if post.isEmpty { continue }
            pre.append(post.removeLast())
        case "-":
            if pre.isEmpty { continue }
            pre.removeLast()
        default:
            pre.append(String(i))
        }
    }
    
    while !post.isEmpty {
        pre.append(post.removeLast())
    }
    
    return pre.joined() + post.joined()
}
