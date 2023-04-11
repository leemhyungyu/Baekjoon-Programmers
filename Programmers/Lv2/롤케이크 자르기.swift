//
//  롤케이크 자르기.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ topping:[Int]) -> Int {

    var type = Set<Int>()
    
    var count = 0
    for i in topping {
        type.insert(i)
    }

    var leftArray = [Int]()
    var leftSet = Set<Int>()
    var rightArray = [Int]()
    var rightSet = Set<Int>()
    var typeCount = 0
    
    for i in 0..<topping.count {
        if !leftSet.contains(topping[i]) {
            typeCount += 1
            leftArray.append(typeCount)
            leftSet.insert(topping[i])

        } else {
            leftArray.append(typeCount)
        }
    }
    
    typeCount = 0
    
    for i in (0..<topping.count).reversed() {
        if !rightSet.contains(topping[i]) {
            typeCount += 1
            rightArray.append(typeCount)
            rightSet.insert(topping[i])
        } else {
            rightArray.append(typeCount)
        }
    }
    
            
    for i in 0..<topping.count - 1 {
        if leftArray[i] == rightArray[topping.count - 2 - i] {
            count += 1
        }
    }
    return count
}
