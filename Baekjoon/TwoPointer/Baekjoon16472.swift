//
//  Baekjoon16472.swift
//  Solved
//
//  Created by 임현규 on 2024/05/10.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.map { String($0) }

func solution(_ array: [String], _ n: Int) -> Int {
    var left = 0, right = 0, maxLength = 1
    var alphaDic = [String: Int]()
    var alphaCount: Int {
        return alphaDic.filter { $0.value != 0 }.count
    }
    
    array.forEach { alphaDic[$0] = 0 }
    
    alphaDic[array[left]] = 1
    
    while left < array.count - 1 && right < array.count - 1 {
        
        if alphaDic[array[right + 1]]! > 0 {
            right += 1
            alphaDic[array[right]] = alphaDic[array[right]]! + 1
            maxLength = max(maxLength, right - left + 1)
        } else if alphaDic[array[right + 1]]! == 0 {
            if alphaCount >= n {
                alphaDic[array[left]] = alphaDic[array[left]]! - 1
                left += 1
            } else {
                right += 1
                alphaDic[array[right]] = alphaDic[array[right]]! + 1
                maxLength = max(maxLength, right - left + 1)
            }
        }
    }
    
    return maxLength
}

print(solution(array, n))
