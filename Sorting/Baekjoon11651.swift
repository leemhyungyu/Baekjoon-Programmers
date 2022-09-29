//
//  Baekjoon11651.swift
//  
//
//  Created by 임현규 on 2022/09/29.
//

import Foundation

let n = Int(readLine()!)!

var array = [[Int]]()

for i in 0...(n - 1) {
  array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let sortedArr = array.sorted(by: { ($0[1], $0[0]) < ($1[1], $1[0])} )

for i in sortedArr {
  print(i[0], i[1])
}
