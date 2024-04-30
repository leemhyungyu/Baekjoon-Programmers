//
//  Baekjoon5904.swift
//  Solved
//
//  Created by 임현규 on 2024/04/30.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    let mooString = ["m", "o", "o"]
    var result = ""
    var totalLength = 0
    var k = 0
    
    while totalLength < n {
        totalLength = totalLength * 2 + (k + 3)
        k += 1
    }
    
    func backTraking(_ target: Int, _ length: Int, _ k: Int) {
        if target <= 3 {
            result = mooString[target - 1]
            return
        }
        
        let mid = (length - (k + 3)) / 2
        
        if target <= mid {
            backTraking(target, mid, k - 1)
        } else if target > mid + (k + 3) {
            backTraking(target - (mid + (k + 3)), mid, k - 1)
        } else {
            result = mid + 1 - target == 0 ? "m" : "o"
            return
        }
    }
    
    backTraking(n, totalLength, k - 1)
    
    return result
}

print(solution(n))
