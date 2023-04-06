//
//  할인 행사.swift
//  
//
//  Created by 임현규 on 2023/04/07.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var wantDic = [String: Int]()
    var result = 0
    
    for i in 0..<want.count {
        if let value = wantDic[want[i]] {
            wantDic[want[i]] = value + 1
        } else {
            wantDic[want[i]] = number[i]
        }
    }
    
    for i in 0..<discount.count {
        var tempDic = wantDic
        for j in i..<[i + 10, discount.count].min()! {
            
            if let value = tempDic[discount[j]] {
                if value != 0 {
                    tempDic[discount[j]]! -= 1
                }
            }
        }
        
        if tempDic.filter { $0.1 == 0 }.count == want.count {
            result += 1
        }
    }
    return result
}
