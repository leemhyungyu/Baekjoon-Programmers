//
//  Baekjoon9237.swift
//  
//
//  Created by 임현규 on 2023/02/02.
//

import Foundation

let n = Int(readLine()!)!
var treeArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }

for i in (0...n - 1).reversed() {
    treeArray[i] -= i
}

print(treeArray.max()! + n + 1)
