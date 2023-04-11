//
//  택배상자.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    
    var order = order
    var subBelt = [Int]()
    var count = 0
    var index = 0
    
    for i in 1...order.count {
        if order[index] != i {
            subBelt.append(i)
            continue
        } else {
            index += 1
            count += 1
        }
        
        while !subBelt.isEmpty {
            if order[index] == subBelt.last! {
                subBelt.removeLast()
                index += 1
                count += 1
            } else {
                break
            }
        }
    }
    
    return count
}
