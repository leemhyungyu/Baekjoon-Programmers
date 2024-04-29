//
//  Baekjoon20437.swift
//  Solved
//
//  Created by 임현규 on 2024/04/29.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ w: [String], _ k: Int) -> [Int]? {
    var alphabet = [String: Int]()
    var maxCount = 1, minCount = Int.max
    for i in w {
        alphabet[i] = (alphabet[i] ?? 0) + 1
    }
    
    if alphabet.map { $0.value }.filter { $0 >= k }.isEmpty { return nil }
    
    if k == 1 { return [1, 1] }
    
    for i in 0..<w.count {
        if alphabet[w[i]]! < k { continue }
        var count = 1
        for j in i + 1..<w.count {
            if w[i] == w[j] {
                count += 1
                if count == k {
                    maxCount = max(maxCount, j - i + 1)
                    minCount = min(minCount, j - i + 1)
                    break
                }
            }
        }
    }
    
    return [minCount, maxCount]
}

for _ in 0..<t {
    let w = readLine()!.map { String($0) }
    let k = Int(readLine()!)!
    
    guard let result = solution(w, k) else {
        print(-1)
        continue
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}
