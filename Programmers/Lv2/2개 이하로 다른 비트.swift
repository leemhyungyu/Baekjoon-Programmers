//
//  2개 이하로 다른 비트.swift
//  
//
//  Created by 임현규 on 2023/04/09.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {

    var result = [Int64]()
    
    for i in numbers {
        let bit = String(i, radix: 2).map { String($0) }
        var oneBitCount = 0
        for i in (0..<bit.count).reversed() {
            if bit[i] == "0" {
                break
            } else {
                oneBitCount += 1
            }
        }

        if oneBitCount == 0 {
            result.append(i + 1)
        } else {
            result.append(i + Int64(pow(2, Double(Int64(oneBitCount) - 1))))
        }
    }
    
    return result
}
