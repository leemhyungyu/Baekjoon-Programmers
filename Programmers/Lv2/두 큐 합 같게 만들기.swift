//
//  두 큐 합 같게 만들기.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var firstQueue = queue1
    var secondQueue = queue2
    var count = 0
    var totalSum = (firstQueue.reduce(0) { $0 + $1 } + secondQueue.reduce(0) { $0 + $1})
    var targetNum = totalSum / 2
    var firstSum = firstQueue.reduce(0) { $0 + $1 }
    var totalArray = firstQueue + secondQueue
    
    var left = 0, right = firstQueue.count - 1
    
    if totalSum % 2 != 0 { return -1 }

    while right != totalArray.count - 1 {
        
        if firstSum == targetNum { break }
        
        if firstSum > targetNum {
            firstSum -= totalArray[left]
            left += 1
            count += 1
            
        } else if firstSum < targetNum {
            right += 1
            firstSum += totalArray[right]
            count += 1
            
        }
    }

    if firstSum == targetNum {
        return count
    } else {
        return -1
    }
}
