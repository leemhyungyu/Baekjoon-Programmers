//
//  Baekjoon1181.swift
//  
//
//  Created by 임현규 on 2022/09/28.
//

import Foundation

let n = Int(readLine()!)!

var array = [String: Int]()

for _ in 0...(n - 1) {
  let inputText = readLine()!
  array.updateValue(inputText.count, forKey: inputText)
}

// 길이 순, 알파벳 순으로 정렬
var sortedArray = array.sorted(by: { ($0.1, $0.0) < ($1.1, $1.0) } )


for i in sortedArray {
  print(i.key)
}
