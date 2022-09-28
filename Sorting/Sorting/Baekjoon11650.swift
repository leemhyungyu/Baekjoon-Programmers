//
//  Baekjoon11650.swift
//  Sorting
//
//  Created by 임현규 on 2022/09/28.
//

import Foundation

let n = Int(readLine()!)!

var array = [[Int]]()

for _ in 0...(n - 1) {
  array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let result = array.sorted(by: { ($0[0], $0[1]) < ($1[0], $1[1]) })

for i in result {
  print(i[0], i[1])
}
