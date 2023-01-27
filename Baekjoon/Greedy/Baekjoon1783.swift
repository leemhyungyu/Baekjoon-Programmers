//
//  Baekjoon1783.swift
//  
//
//  Created by 임현규 on 2023/01/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

print(n == 1 ? 1 : n == 2 ? min(4, (m + 1) / 2) : m <= 6 ? min(4, m) : m - 2)
