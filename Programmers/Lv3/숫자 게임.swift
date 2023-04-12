//
//  숫자 게임.swift
//  
//
//  Created by 임현규 on 2023/04/12.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var result = 0
    var sortedA = a.sorted { $0 < $1 }
    var sortedB = b.sorted { $0 > $1 }
    var aPoint = 0, bPoint = sortedA.count - 1
    
    if a.min()! >= b.max()! {
        return 0
    }
    
    while true {
            
        if !(0...sortedA.count).contains(aPoint) || !(0...sortedB.count).contains(bPoint) {
            break
        }
            
        if sortedA[aPoint] >= sortedB[bPoint] {
            bPoint -= 1
        } else {
            aPoint += 1
            bPoint -= 1
            result += 1
        }
    }
    
    return result
}
