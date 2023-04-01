//
//  귤 고르기 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var tangerDic = [Int: Int]()
    var result = 0
    var tangerineCount = 0

    for i in tangerine {
        if let value = tangerDic[i] {
            tangerDic[i] = value + 1
        } else {
            tangerDic[i] = 1
        }
    }
    
    var sortedDic = tangerDic.sorted { $0.1 > $1.1 }
    
    for i in sortedDic {
        tangerineCount += i.1
        result += 1
        
        if tangerineCount >= k {
            break
        }
    }
    
    return result
}
