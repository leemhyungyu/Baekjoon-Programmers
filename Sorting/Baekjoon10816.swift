//
//  Baekjoon10816.swift
//  
//
//  Created by 임현규 on 2022/09/29.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let getArray = readLine()!.split(separator: " ").map { Int($0)! }

var dic = [Int: Int]()

array.map {
  if let value = dic[$0] {
    dic.updateValue(value + 1, forKey: $0)
  } else {
    dic.updateValue(1, forKey: $0)
  }
}

getArray.map {
  if let count = dic[$0] {
    print(count, terminator: " ")
  } else {
    print(0, terminator: " ")
  }
}
