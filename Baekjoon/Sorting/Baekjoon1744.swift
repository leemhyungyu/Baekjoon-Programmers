//
//  Baekjoon1744.swift
//  
//
//  Created by 임현규 on 2022/10/02.
//

import Foundation

let n = Int(readLine()!)!

var array = [Int]()
var result = 0

for _ in 1...n {
  array.append(Int(readLine()!)!)
}

var minusArray = [Int]()
var plusArray = [Int]()

array.sort()

for i in array {
  if i <= 0 {
    minusArray.append(i)
  } else {
    plusArray.append(i)
  }
}


for i in stride(from: 0, to: minusArray.count, by: 2) {
    
    if i + 1 < minusArray.count {
        result += minusArray[i] * minusArray[i + 1]
    } else {
        result += minusArray[i]
    }
    
}

for i in stride(from: plusArray.count - 1, to: -1, by: -2) {
    
    if i - 1 >= 0 {
        if plusArray[i - 1] == 1 {
            result += plusArray[i] + plusArray[i - 1]
        } else {
            result += plusArray[i] * plusArray[i - 1]
        }
    } else {
        result += plusArray[i]
    }
}

print(result)
