//
//  마법의 엘리베이터.swift
//  
//
//  Created by 임현규 on 2024/03/07.
//

import Foundation

func solution(_ storey:Int) -> Int {
    var result = Int.max
    func dfs(_ storey: Int, _ count: Int = 0) {
        if storey < 10 {
            result = min(result, storey + count, 11 - storey + count)
            return
        }
        
        let rightNumber = storey % 10
        dfs(storey / 10, rightNumber + count)
        dfs(storey / 10 + 1, 10 - rightNumber + count)
    }
    
    dfs(storey)
    return result
}
