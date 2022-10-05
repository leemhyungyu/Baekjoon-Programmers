//
//  Baekjoon1316.swift
//  
//
//  Created by 임현규 on 2022/10/05.
//

import Foundation

let n = Int(readLine()!)!
var result = 0

for _ in 1...n {
  if checkGroup(readLine()!) {
    result += 1
  }
}

print(result)

func checkGroup(_ text: String) -> Bool {
  var array = [String]()
  var char = ""
  
  for i in text {
    if array.contains(String(i)) {
      if char == String(i) {
        array.append(String(i))
        char = String(i)
      } else {
        return false
      }
    } else {
      array.append(String(i))
      char = String(i)
    }
  }
  return true
}
