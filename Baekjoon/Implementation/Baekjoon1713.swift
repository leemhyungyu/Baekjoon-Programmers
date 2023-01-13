//
//  Baekjoon1713.swift
//  
//
//  Created by 임현규 on 2023/01/13.
//

import Foundation

let n = Int(readLine()!)!
let recommend = Int(readLine()!)!
let studentArray = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int: (Int, Int)]() // (추천 횟수, 들어온 순서)

for i in 0...recommend - 1 {
    if let value = result[studentArray[i]] {
        result[studentArray[i]] = (value.0 + 1, value.1)
    } else {
        if result.count >= n {
            let removeStudent = result.sorted {
                $0.value.0 != $1.value.0 ? $0.value.0 < $1.value.0 : $0.value.1 < $1.value.1
            }.first!
            result.removeValue(forKey: removeStudent.key)
            result[studentArray[i]] = (1, i)
        }
        result[studentArray[i]] = (1, i)
    }
}
print(result.sorted { $0.key < $1.key }.map { String($0.key) }.joined(separator: " "))
