//
//  Baekjoon1764.swift
//  
//
//  Created by 임현규 on 2022/09/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n: Int = input[0]
let m: Int = input[1]

var count: Int = 0
var dic = [String: Int]()
var result = [String]()
for i in 0...(n + m - 1) {
  // 명단이 딕셔너리에 있는 경우 -> 듣보잡인 경우
  let name = readLine()!
  if let value = dic[name] {
    dic.updateValue(1, forKey: name)
  } else { // 명단이 딕셔너리에 없는 경우 -> 보도 못한 사람의 경우
    dic.updateValue(0, forKey: name)
  }
}

var sortedDic = dic.sorted(by: { $0.0 < $1.0 })

sortedDic.map {
  if $0.1 == 1 {
    count += 1
    result.append($0.0)
  }
}

print(count)

for i in result {
  print(i)
}
