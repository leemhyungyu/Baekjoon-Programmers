//
//  시소 짝꿍.swift
//  
//
//  Created by 임현규 on 2024/03/09.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var result: Int = 0
    var dic = [Double: Int]()
    var ratios: [(Double, Double)] = [(1, 1), (2, 3), (1, 2), (3, 4)]
    
    weights.forEach { dic[Double($0), default: 0] += 1}
  
    for (weight, count) in dic {
        for ratio in ratios {
            if count < 2 && ratio.0 / ratio.1 == 1 { continue }
            
            if ratio.0 / ratio.1 == 1 {
                result += dic[weight]! * (dic[weight]! - 1) / 2
                continue
            }
            
            result += count * (dic[weight * ratio.0 / ratio.1] ?? 0)
        }
    }
    
    return Int64(result)
}
