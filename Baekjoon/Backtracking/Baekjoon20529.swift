//
//  Baekjoon20529.swift
//  Solved
//
//  Created by 임현규 on 2024/04/02.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ array: [String], _ n: Int) -> Int {
    if n > 32 { return 0 }
    var combi = Set<[String]>()
    var result = Int.max
    
    func combination(_ now: [String], _ index: Int) {
        if now.count == 3 {
            combi.insert(now)
            return
        }
        
        for i in index..<array.count {
            combination(now + [array[i]], i + 1)
        }
    }
    combination([], 0)

    for i in combi {
        let a = i[0], b = i[1], c = i[2]
        result = min(result, getLength(a, b) + getLength(a, c) + getLength(b, c))
    }
    
    return result
}

func getLength(_ a: String, _ b: String) -> Int {
    var count = 0
    let a = a.map { String($0) }, b = b.map { String($0) }
    for i in 0..<a.count {
        if a[i] == b[i] { continue }
        count += 1
    }
    return count
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { String($0) }
    print(solution(array, n))
}

