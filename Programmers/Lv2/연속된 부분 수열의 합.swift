//
//  연속된 부분 수열의 합.swift
//  
//
//  Created by 임현규 on 2023/04/18.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var result = ((1000001, 1000001), 1000001)
    var left = 0, right = 0
    var sum = sequence[right]
    
    while left <= right && right <= sequence.count - 1 {
        
        // 해당 부분 수열의 합이 k보다 크거나 같으면 left += 1
        if sum > k {
            sum -= sequence[left]
            left += 1
        } else if sum < k { // k보다 작으면 right += 1
            if right == sequence.count { break }
            sum += sequence[right]
        } else {
            var count = right - left + 1
            result = result.1 > count ? ((left, right), count) : result.0.0 > left ? ((left, right), count) : result
            sum -= sequence[left]
            left += 1
        }
    }
    
    
    return [result.0.0, result.0.1]
}
