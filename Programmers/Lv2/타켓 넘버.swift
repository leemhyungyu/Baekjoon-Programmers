//
//  타켓 넘버.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var result = 0
    var queue = [(numbers.first!, 0), (numbers.first! * -1, 0)]
    
    while !queue.isEmpty {
        let element = queue.removeLast()
        var value = element.0
        var index = element.1
        
        if index != numbers.count - 1 {
            queue.append((value + numbers[index + 1], index + 1))
            queue.append((value - numbers[index + 1], index + 1))
        } else {
            if value == target {
                result += 1
            }
        }
    }

    return result
}
