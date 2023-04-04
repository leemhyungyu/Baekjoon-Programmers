//
//  [Lv2] 프린터.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var stack = [(Int, Int)]()
    var tempArray = priorities.sorted { $0 > $1 }
    var count = 0
    
    for (index, element) in priorities.enumerated() {
        stack.append((index, element))
    }
    
    while true {
        
        if stack.first!.1 >= tempArray.max()! {
            count += 1

            if stack.first!.0 == location {
                break
            }
            
            tempArray.removeFirst()
            stack.removeFirst()
        } else {
            stack.append(stack.removeFirst())
        }
    }
    
    return count
}
