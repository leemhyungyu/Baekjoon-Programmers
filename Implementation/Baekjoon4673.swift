//
//  Baekjoon4673.swift
//  
//
//  Created by 임현규 on 2022/10/05.
//

import Foundation

var numSet = Set<Int>()


for i in 1...100000 {
  numSet.insert(selfNumber(i))
}

for i in 1...10000 {
  if !numSet.contains(i) {
    print(i)
  }
}

func selfNumber(_ number: Int) -> Int {

  let numberString = String(number)

  var result = number
  
  for i in numberString {
      result += Int(String(i))!
  }
  return result
}
