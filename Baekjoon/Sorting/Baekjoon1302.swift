//
//  Baekjoon1302.swift
//  
//
//  Created by 임현규 on 2022/10/02.
//

import Foundation

let n = Int(readLine()!)!

var bookDic = [String: Int]()

for i in 0...(n - 1) {
  var book = readLine()!

  if let bookCount = bookDic[book] {
    bookDic.updateValue(bookCount + 1, forKey: book)
  } else {
    bookDic.updateValue(1, forKey: book)
  }
}

let sortedDic = bookDic.sorted(by: { ($0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1) })

print(sortedDic[0].key)
