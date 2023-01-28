//
//  Baekjoon18310.swift
//  
//
//  Created by 임현규 on 2023/01/28.
//

import Foundation

let n = Int(readLine()!)!
let houseArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }

print(n % 2 != 0 ? houseArray[n / 2] : houseArray[n / 2 - 1])
