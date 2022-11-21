//
//  Baekjoon1427.swift
//  Sorting
//
//  Created by 임현규 on 2022/09/28.
//

import Foundation

var intArr = Array(readLine()!).map { Int(String($0))! }

intArr.sort(by: { $0 > $1} )

for i in intArr {
  print(i, terminator: "")
}
