//
//  징검다리 건너기.swift
//  Solved
//
//  Created by 임현규 on 6/10/24.
//

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var stones = stones
    var start = 0, end = 200000000
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 0
        var isFlag = false
        
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                count += 1
            } else {
                count = 0
            }
            
            if count >= k {
                isFlag = true
                break
            }
        }
        
        if isFlag {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return start
}
