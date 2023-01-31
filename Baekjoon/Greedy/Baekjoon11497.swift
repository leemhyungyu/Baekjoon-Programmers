//
//  Baekjoon11497.swift
//  
//
//  Created by 임현규 on 2023/01/31.
//

import Foundation

let t = Int(readLine()!)!

for _ in 1...t {
    var n = Int(readLine()!)!
    var treeArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
    var left = treeArray.removeFirst()
    var right = treeArray.removeFirst()
    
    var result = abs(left - right)

    while !treeArray.isEmpty {
        
        if treeArray.count == 1 {
            let last = treeArray.removeFirst()
            
            if result < max(abs(left - last), abs(right - last)) {
                result = max(abs(left - last), abs(right - last))
            }
        } else {
            let leftNext = treeArray.removeFirst()
            
            if result < abs(left - leftNext) {
                result = abs(left - leftNext)
            }
            
            let rightNext = treeArray.removeFirst()
            
            if result < abs(right - rightNext) {
                result = abs(right - rightNext)
            }
            
            left = leftNext
            right = rightNext
        }
    }
}
