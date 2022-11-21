//
//  Baekjoon2470.swift
//  
//
//  Created by 임현규 on 2022/09/30.
//

import Foundation

let n = Int(readLine()!)!

var array = readLine()!.split(separator: " ").map { Int($0)! }

array.sort()

var start = 0
var end = array.count - 1
var result = array[start] + array[end]
var one = array[start]
var two = array[end]

while start < end {
  var temp = array[start] + array[end]

  if abs(temp) < abs(result) {
    result = abs(temp)
    one = array[start]
    two = array[end]
  }

  if temp < 0 {
    start += 1
  } else {
    end -= 1
  }
}

print(one, two)
