//
//  위장.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var dic = [String: Int]()
    var result = 0
    
    for i in clothes {
        if let value = dic[i[1]] {
            dic[i[1]] = value + 1
        } else {
            dic[i[1]] = 2
        }
    }

    result += dic.values.reduce(1) { $0 * $1 } - 1
    
    return result
}
