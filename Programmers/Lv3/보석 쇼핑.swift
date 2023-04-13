//
//  보석 쇼핑.swift
//  
//
//  Created by 임현규 on 2023/04/13.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {

    var type = Set(gems)
    var dic = [String: Int]()
    var left = 0
    var right = 0
    var resultLeft = 0
    var resultRight = gems.count - 1
    
    dic[gems[left]] = 1
    
    while left < gems.count && right < gems.count {
        
        if dic.count == type.count {
            if (resultRight - resultLeft) > (right - left) {
                resultRight = right
                resultLeft = left
            }
            
            if let value = dic[gems[left]] {
                if value == 1 {
                    dic.removeValue(forKey: gems[left])
                } else {
                    dic[gems[left]] = value - 1
                }
            }
            
            left += 1
            
            if left > gems.count - 1 { break }
        } else {
            right += 1
            if right > gems.count - 1 { break }

            if let value = dic[gems[right]] {
                dic[gems[right]] = value + 1
            } else {
                dic[gems[right]] = 1
            }
        }
    }

    return [resultLeft + 1, resultRight + 1]
}
