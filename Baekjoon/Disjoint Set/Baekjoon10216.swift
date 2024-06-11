//
//  Baekjoon10216.swift
//  Solved
//
//  Created by 임현규 on 6/11/24.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var parents = Array(0..<n)
    var result = n
    
    func find(_ a: Int) -> Int {
        return parents[a] == a ? a : find(parents[a])
    }
    
    func union(_ a: Int, _ b: Int) {
        let a = find(a), b = find(b)
        
        if a == b { return }
        
        if a > b {
            parents[a] = b
        } else {
            parents[b] = a
        }
    }
    
    
    for i in 0..<n {
        let x1 = array[i][0], y1 = array[i][1], r1 = array[i][2]
        
        for j in i + 1..<n {
            let x2 = array[j][0], y2 = array[j][1], r2 = array[j][2]
            
            let length = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)
            let r = (r1 + r2) * (r1 + r2)

            if length <= r {
                if find(i) != find(j) {
                    union(i, j)
                    result -= 1
                }
            }
        }
    }
    
    return result
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    var array = [[Int]]()
    
    for _ in 0..<n {
        array.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    print(solution(array, n))
}
