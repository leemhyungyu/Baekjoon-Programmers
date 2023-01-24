//
//  Baekjoon1343.swift
//  BackJoon
//
//  Created by 임현규 on 2023/01/24.
//

import Foundation

var input = readLine()!

input = input.replacingOccurrences(of: "XXXX", with: "AAAA")
input = input.replacingOccurrences(of: "XX", with: "BB")

print(input.contains("X") ? -1 : input)
