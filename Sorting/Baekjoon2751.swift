//
//  Baekjoon2751.swift
//  
//
//  Created by 임현규 on 2022/09/28.
//

import Foundation

let n = Int(readLine()!)!

var array = [Int]()

for _ in 0...(n - 1) {
  array.append(Int(readLine()!)!)
}

array.sort()

for i in array {
  print(i)
}
