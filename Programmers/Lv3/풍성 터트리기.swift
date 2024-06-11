//
//  풍성 터트리기.swift
//  Solved
//
//  Created by 임현규 on 6/11/24.
//

import Foundation

func solution(_ a:[Int]) -> Int {
    var left = Array(repeating: 1000000001, count: a.count)
    var right = Array(repeating: 1000000001, count: a.count)
    var result = 0
    left[0] = a[0]
    right[a.count - 1] = a[a.count - 1]
    
    for i in 1..<a.count {
        left[i] = min(left[i - 1], a[i - 1])
    }
    
    for i in (0..<a.count - 1).reversed() {
        right[i] = min(right[i + 1], a[i + 1])
    }
    
    for i in 0..<a.count {
        if left[i] >= a[i] || right[i] >= a[i] { result += 1 }
    }
    
    return result
}
