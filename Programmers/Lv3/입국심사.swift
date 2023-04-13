//
//  입국심사.swift
//  
//
//  Created by 임현규 on 2023/04/14.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    if times.count == 1 {
        return Int64(n) * Int64(times.first!)
    }
    
    var left = 0 // 왼쪽 탐색 Index
    var right = times.max()! * n // 오른쪽 탐색 Index
    var result: Int64 = 0

    while left <= right {
        
        var person = 0
        
        let mid = (left + right) / 2
        
        for i in times {
            person += mid / i
            
            if person >= n { break }
        }
        
        if person >= n {
            result = Int64(mid)
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}
