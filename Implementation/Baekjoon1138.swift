//
//  Baekjoon1138.swift
//  
//
//  Created by 임현규 on 2022/11/16.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var resultArray = Array(repeating: 0, count: n)

for i in 0...(n - 1) {
    
    var spaceCount = 0 // 왼쪽에 빈 공간 카운트
    
    for j in 0...(n - 1) {
        if array[i] != 11 {
            // 자리가 비어있는 경우
            if spaceCount == array[i] && resultArray[j] == 0 {
                resultArray[j] = i + 1
                array[i] = 11
                spaceCount += 1
            } else if resultArray[j] == 0 {
                spaceCount += 1
            }
        }
    }
}

for i in resultArray {
    print(i, terminator: " ")
}
