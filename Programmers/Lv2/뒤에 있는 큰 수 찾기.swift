//
//  뒤에 있는 큰 수 찾기.swift
//  
//
//  Created by 임현규 on 2023/04/10.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var result = [-1]
    var targetNum = numbers.last!
    var maxNum = numbers.last!
    
    for i in (0..<numbers.count - 1).reversed() {
        
        if numbers[i + 1] > numbers[i] {
                    
            targetNum = numbers[i + 1]
            result.append(targetNum)

            if maxNum < targetNum {
                maxNum = targetNum
            }

        } else {
            if numbers[i] < targetNum {
                result.append(targetNum)
            } else {
                if numbers[i] < maxNum {
                    
                    for j in i..<numbers.count {
                        if numbers[i] < numbers[j] {
                            result.append(numbers[j])
                            break
                        }
                    }
                } else {
                    maxNum = numbers[i]
                    result.append(-1)
                }
            }
        }
    }
        
    
    return result.reversed()
}
