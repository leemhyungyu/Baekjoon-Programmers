//
//  Baekjoon9934.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let k = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ k: Int) {
    var result = Array(repeating: [Int](), count: k)
    var now = array.count / 2
    
    func backTraking(_ now: Int, _ depth: Int, _ nodes: [Int]) {
        if nodes.isEmpty { return }
        result[depth] += [nodes[now]]
        let left = Array(nodes[0..<now])
        let right = Array(nodes[now + 1..<nodes.count])
        backTraking(left.count / 2, depth + 1, left)
        backTraking(right.count / 2, depth + 1, right)
    }
    
    backTraking(now, 0, array)
    for i in 0..<k {
        print(result[i].map { String($0) }.joined(separator: " "))
    }
}

solution(array, k)
