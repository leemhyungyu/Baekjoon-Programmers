//
//  타겟 넘버.swift
//  
//
//  Created by 임현규 on 2024/03/11.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    let dn = [1, -1]
    
    func dfs(_ queue: [Int], _ index: Int) {
        if queue.count == numbers.count {
            if queue.reduce(0) { $0 + $1 } == target {
                result += 1
            }
            return
        }
        
        for n in dn {
            dfs(queue + [numbers[index + 1] * n], index + 1)
        }
    }
    
    for n in dn {
        dfs([numbers.first! * n], 0)
    }
    
    return result
}
