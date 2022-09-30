//
//  Baekjoon11652.swift
//  
//
//  Created by 임현규 on 2022/10/01.
//

import Foundation

let n = Int(readLine()!)!

var dic = [Int: Int]()

for _ in 0...(n - 1) {

  let input = Int(readLine()!)!
  
  if let count = dic[input] {
    dic.updateValue(count + 1, forKey: input)
  } else {
    dic.updateValue(1, forKey: input)
  }
}

var sortedDic = dic.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })

print(sortedDic.first!.key)
