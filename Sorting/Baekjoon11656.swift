//
//  Baekjoon11656.swift
//  
//
//  Created by 임현규 on 2022/09/30.
//

import Foundation

let s = Array(readLine()!).map {String($0)}

var array = [String]()

for i in 0...(s.count - 1) {
  var temp: String = ""
  
  for j in i...(s.count - 1) {
    temp = temp + s[j]
  }
  array.append(temp)
}

array.sort()

for i in array {
  print(i)
}
