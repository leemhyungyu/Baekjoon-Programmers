//
//  [1차] 비밀지도.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var binary = String(arr1[i] | arr2[i], radix: 2).map { String($0) }
        answer.append(Array(repeating: "0", count: n - binary.count).joined() + binary.joined())
    }
    
    
    let result = answer
            .map { $0.replacingOccurrences(of: "1", with: "#") }
            .map { $0.replacingOccurrences(of: "0", with: " ") }
    
    return result
}
