//
//  기능개발.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var result = [Int]()
    var stack = progresses
    var speed = speeds
    
    while !stack.isEmpty {
        
        var count = 0
        
        for i in 0..<stack.count {
            stack[i] += speed[i]
        }
        
        while stack.first! >= 100 {
            
            stack.removeFirst()
            speed.removeFirst()
            count += 1
            
            if stack.isEmpty {
                break
            }
        }
        
        if count != 0 {
            result.append(count)
        }
    }
    
    return result
}
