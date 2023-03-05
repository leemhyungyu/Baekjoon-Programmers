//
//  Baekjoon1269.swift
//  
//
//  Created by 임현규 on 2023/03/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let aArray = Set(readLine()!.split(separator: " ").map { Int($0)! })

let bArray = Set(readLine()!.split(separator: " ").map { Int($0)! })

print(aArray.subtracting(bArray).count + bArray.subtracting(aArray).count)
