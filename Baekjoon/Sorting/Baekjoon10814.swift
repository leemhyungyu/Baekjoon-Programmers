//
//  Baekjoon10814.swift
//  
//
//  Created by 임현규 on 2022/09/28.
//

import Foundation

let n = Int(readLine()!)!

var array = [(Int, Int, String)]()

for i in 0...(n - 1) {
  let input = readLine()!.split(separator: " ")

  array.append((i, Int(String(input[0]))!, String(input[1])))
}

let sortedArr = array.sorted(by: {($0.1, $0.0) < ($1.1, $1.0)})

for i in sortedArr {
  print(i.1, i.2)
}
