//
//  최대값과 최솟값.swift
//  
//
//  Created by 임현규 on 2022/11/22.
//

import Foundation

func solution(_ s:String) -> String {

    let result: [Int] = s.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }

    return "\(result[0])" + " " + "\(result.last!)"
}
