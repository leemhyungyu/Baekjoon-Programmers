//
//  행렬의 곱셈.swift
//  
//
//  Created by 임현규 on 2023/04/02.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {

    var result = Array(repeating: Array(repeating: 0, count: arr2.first!.count), count: arr1.count)

    for i in 0..<arr1.count {
        for j in 0..<arr2.first!.count {
            for k in 0..<arr2.count {
                result[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }

    return result
}
